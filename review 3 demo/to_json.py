#!/usr/bin/env python3
"""
gml_to_json.py

Convert all .gml files in capec_graphs/ to JSON files in capec_graphs_json/.

Output JSON layout:
{
  "graph": { <graph-level attributes like capec_id, name, ...> , "directed": true/false },
  "nodes": [
    { "id": <node_id>, "attributes": { ... } },
    ...
  ],
  "edges": [
    { "source": <node_id>, "target": <node_id>, "attributes": { ... } },
    ...
  ]
}
"""
import os
import json
import argparse
from typing import Any
import networkx as nx
import numbers

IN_DIR = "capec_graphs"
OUT_DIR = "capec_json"


def sanitize_value(v: Any):
    """Recursively convert non-JSON-serializable types to JSON-friendly types."""
    # None, bool, int, float, str are fine
    if v is None or isinstance(v, (bool, str)):
        return v
    if isinstance(v, numbers.Integral):
        return int(v)
    if isinstance(v, numbers.Real):
        return float(v)
    # Bytes -> decode if possible
    if isinstance(v, (bytes, bytearray)):
        try:
            return v.decode("utf-8")
        except Exception:
            return str(v)
    # Lists / tuples -> sanitize each item
    if isinstance(v, (list, tuple, set)):
        return [sanitize_value(x) for x in list(v)]
    # Dict -> sanitize keys/values
    if isinstance(v, dict):
        return {str(k): sanitize_value(val) for k, val in v.items()}
    # Fallback: stringify (covers numpy types, objects)
    return str(v)


def graph_to_dict(G: nx.Graph):
    """Convert a networkx graph to a JSON-serializable dict."""
    # Graph-level attributes
    graph_attrs = {k: sanitize_value(v) for k, v in G.graph.items()}
    graph_attrs["directed"] = G.is_directed()

    # Nodes: include the node id and its attributes
    nodes = []
    for n, attrs in G.nodes(data=True):
        nodes.append({
            "id": sanitize_value(n),
            "attributes": {k: sanitize_value(v) for k, v in attrs.items()}
        })

    # Edges: source, target and any attributes
    edges = []
    # use G.edges(data=True) which yields (u, v, attrdict)
    for u, v, attrs in G.edges(data=True):
        edges.append({
            "source": sanitize_value(u),
            "target": sanitize_value(v),
            "attributes": {k: sanitize_value(vv) for k, vv in attrs.items()}
        })

    return {"graph": graph_attrs, "nodes": nodes, "edges": edges}


def convert_folder(in_dir: str = IN_DIR, out_dir: str = OUT_DIR, overwrite: bool = True):
    os.makedirs(out_dir, exist_ok=True)
    files = [f for f in os.listdir(in_dir) if f.lower().endswith(".gml")]
    if not files:
        print(f"No .gml files found in '{in_dir}'.")
        return

    for fname in files:
        in_path = os.path.join(in_dir, fname)
        base = os.path.splitext(fname)[0]
        out_fname = f"{base}.json"
        out_path = os.path.join(out_dir, out_fname)

        if os.path.exists(out_path) and not overwrite:
            print(f"Skipping (already exists): {out_path}")
            continue

        try:
            # networkx.read_gml will parse GML and return a Graph/DiGraph
            # read_gml may interpret node ids as strings or ints depending on file
            G = nx.read_gml(in_path, label="label")  # try to preserve 'label' as the node name where possible
        except Exception as e:
            # If read_gml fails (some GML files have slightly different formatting), try without label param
            try:
                G = nx.read_gml(in_path)
            except Exception as e2:
                print(f"[ERROR] Failed to read '{in_path}': {e2}")
                continue

        # networkx sometimes stores the original node id in 'id' attribute; ensure we capture both
        # Convert graph to JSON-serializable structure
        out_dict = graph_to_dict(G)

        # If there is a 'capec_id' or similar at graph root, it should already be in out_dict["graph"]
        # Save JSON
        with open(out_path, "w", encoding="utf-8") as f:
            json.dump(out_dict, f, indent=2, ensure_ascii=False)

        print(f"Converted: {in_path} -> {out_path}")


if __name__ == "__main__":
    parser = argparse.ArgumentParser(description="Convert CAPEC .gml files to JSON")
    parser.add_argument("--in", dest="in_dir", default=IN_DIR, help="Input folder with .gml files (default: capec_graphs)")
    parser.add_argument("--out", dest="out_dir", default=OUT_DIR, help="Output folder for .json files (default: capec_graphs_json)")
    parser.add_argument("--no-overwrite", dest="overwrite", action="store_false", help="Do not overwrite existing .json files")
    args = parser.parse_args()

    convert_folder(in_dir=args.in_dir, out_dir=args.out_dir, overwrite=args.overwrite)
