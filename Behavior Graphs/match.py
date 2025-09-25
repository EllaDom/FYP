#!/usr/bin/env python3
"""
compare_graphs.py

Compare all user graphs (JSON) in user_graphs/ with all CAPEC graphs (JSON) in capec_json/
and compute similarity scores without using VF2 or GED.

Creates one output JSON file per user graph.
"""

import json
import os
import difflib

# ---------- Similarity helpers ----------
def jaccard(set1, set2):
    if not set1 or not set2:
        return 0.0
    return len(set1 & set2) / len(set1 | set2)

def string_similarity(a, b):
    return difflib.SequenceMatcher(None, a, b).ratio()

# ---------- Graph comparison ----------
def compare_graphs(user_graph, capec_graph):
    # --- Extract action labels from user graph ---
    user_actions = [
        n.get("canonical_label", n.get("label", "")).lower()
        for n in user_graph["nodes"]
        if n.get("type") == "action"
    ]
    user_action_set = set(user_actions)

    # --- Extract CAPEC steps ---
    capec_nodes = [n["id"].lower() for n in capec_graph["nodes"]]
    capec_node_set = set(capec_nodes)

    # --- Node overlap score ---
    exact_overlap = jaccard(user_action_set, capec_node_set)

    # --- Fuzzy node matching score ---
    fuzzy_scores = []
    for ua in user_action_set:
        best = max((string_similarity(ua, ca) for ca in capec_node_set), default=0)
        fuzzy_scores.append(best)
    fuzzy_node_score = sum(fuzzy_scores) / len(fuzzy_scores) if fuzzy_scores else 0

    # --- Edge sequence similarity ---
    user_edges = [(e["source"], e["target"]) for e in user_graph["edges"] if e.get("relation") == "sequence"]
    capec_edges = [(e["source"], e["target"]) for e in capec_graph["edges"]]
    user_edge_labels = set([f"{a}->{b}" for a, b in user_edges])
    capec_edge_labels = set([f"{a}->{b}" for a, b in capec_edges])
    edge_overlap = jaccard(user_edge_labels, capec_edge_labels)

    # --- Attribute/contextual similarity ---
    user_contexts = {n["label"].lower() for n in user_graph["nodes"] if n.get("type") == "context"}
    capec_prereqs = {p.lower() for p in capec_graph["graph"].get("prerequisites", [])}
    context_overlap = jaccard(user_contexts, capec_prereqs)

    # --- Weighted final score ---
    score = (
        0.4 * fuzzy_node_score +
        0.2 * exact_overlap +
        0.2 * edge_overlap +
        0.2 * context_overlap
    )

    return {
        "fuzzy_node_score": round(fuzzy_node_score, 3),
        "exact_node_overlap": round(exact_overlap, 3),
        "edge_overlap": round(edge_overlap, 3),
        "context_overlap": round(context_overlap, 3),
        "final_score": round(score, 3)
    }

# ---------- Main loop ----------
if __name__ == "__main__":
    USER_DIR = "user_graphs"
    CAPEC_DIR = "capec_json"
    OUT_DIR = "similarity_scores"
    os.makedirs(OUT_DIR, exist_ok=True)

    user_files = [f for f in os.listdir(USER_DIR) if f.lower().endswith(".json")]
    capec_files = [f for f in os.listdir(CAPEC_DIR) if f.lower().endswith(".json")]

    for uf in user_files:
        with open(os.path.join(USER_DIR, uf), encoding="utf-8") as f:
            user_graph = json.load(f)

        user_results = {}

        for cf in capec_files:
            with open(os.path.join(CAPEC_DIR, cf), encoding="utf-8") as f:
                capec_graph = json.load(f)

            scores = compare_graphs(user_graph, capec_graph)
            user_results[cf] = scores

        # Save per-user score file
        base_name = os.path.splitext(uf)[0]
        out_path = os.path.join(OUT_DIR, f"{base_name}_scores.json")
        with open(out_path, "w", encoding="utf-8") as f:
            json.dump(user_results, f, indent=2, ensure_ascii=False)

        print(f"✅ Saved scores for {uf} -> {out_path}")
