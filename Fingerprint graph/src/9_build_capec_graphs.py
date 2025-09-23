# 9_build_capec_graphs.py
import json
from pathlib import Path
import networkx as nx

SRC_DIR = Path(__file__).parent
OUT_DIR = SRC_DIR.parent / "out"

CAPEC_CANDIDATES_FILE = OUT_DIR / "capec_candidates_rich.json"
HELPER_FILE = OUT_DIR / "action_vocab_helper.json"
CANONICAL_VOCAB_FILE = OUT_DIR / "action_vocab_canonical.json"
GRAPH_OUT_DIR = OUT_DIR / "capec_graphs"
GRAPH_OUT_DIR.mkdir(exist_ok=True)

# ---------------------- Load Data ----------------------
capec_candidates = json.load(open(CAPEC_CANDIDATES_FILE, "r", encoding="utf-8"))
helper = json.load(open(HELPER_FILE, "r", encoding="utf-8"))
canonical_vocab = json.load(open(CANONICAL_VOCAB_FILE, "r", encoding="utf-8"))

capec_ordered_actions = helper["capec_ordered_actions"]

# ---------------------- Build Graphs ----------------------
for capec in capec_candidates:
    capec_id = capec["capec_id"]
    capec_name = capec["name"]

    # Preserve raw order and canonicalize
    raw_actions = capec_ordered_actions.get(capec_id, [])
    canonical_actions = [canonical_vocab.get(tok, tok) for tok in raw_actions]

    # Initialize directed graph
    G = nx.DiGraph()

    # Add nodes
    for action in canonical_actions:
        G.add_node(action)

    # Add sequential edges
    for i in range(1, len(canonical_actions)):
        G.add_edge(canonical_actions[i-1], canonical_actions[i])

    # Graph-level metadata (for teammate)
    G.graph.update({
        "capec_id": capec_id,
        "name": capec_name,
        "abstraction": capec.get("abstraction", ""),
        "status": capec.get("status", ""),
        "description": capec.get("description", ""),
        "likelihood": capec.get("likelihood", ""),
        "severity": capec.get("severity", ""),
        "related_attack_patterns": capec.get("related_attack_patterns", []),
        "prerequisites": capec.get("prerequisites", []),
        "skills_required": capec.get("skills_required", []),
        "resources_required": capec.get("resources_required", []),
        "consequences": capec.get("consequences", []),
        "mitigations": capec.get("mitigations", []),
        "example_instances": capec.get("example_instances", []),
        "related_weaknesses": capec.get("related_weaknesses", []),
        "matched_cwes": capec.get("matched_cwes", []),
        "taxonomy_mappings": capec.get("taxonomy_mappings", []),
        "execution_flow": capec.get("execution_flow", [])
    })

    # Save graph as GML
    out_file = GRAPH_OUT_DIR / f"CAPEC_{capec_id}.gml"
    nx.write_gml(G, out_file)
    print(f"[DONE] Saved CAPEC {capec_id} → {out_file}")

print(f"[ALL DONE] {len(capec_candidates)} CAPEC graphs saved in {GRAPH_OUT_DIR}")
