from flask import Flask, render_template, request, jsonify, send_from_directory

import os
import pandas as pd
from utils.graph_utils import load_gml_graph, visualize_graph, load_json_graph


app = Flask(__name__)

DATA_DIR = "data"
CAPEC_DIR = os.path.join(DATA_DIR, "capec_graphs")

# Preload graphs
USER_GRAPHS = [os.path.join(DATA_DIR, f"user_graph{i}.gml") for i in [1,2]]
CANONICAL_GRAPH = os.path.join(DATA_DIR, "canonical_graph.json")
CAPEC_GRAPHS = [os.path.join(CAPEC_DIR, f) for f in os.listdir(CAPEC_DIR) if f.endswith(".gml")]

# Dummy threat scores table
THREATS = pd.DataFrame({
    "CAPEC_ID": [f"CAPEC-{i}" for i in range(1,21)],
    "Description": [f"Example threat {i}" for i in range(1,21)],
    "Score": [100-i*3 for i in range(20)]
})

@app.route("/")
def index():
    return render_template("index.html")

@app.route("/graph/<graph_type>")
def graph(graph_type):
    if graph_type == "canonical":
        path = CANONICAL_GRAPH
        G = load_json_graph(path)    # <-- Use JSON loader
    elif graph_type=="user1":
        path = USER_GRAPHS[0]
        G = load_gml_graph(path)
    elif graph_type=="user2":
        path = USER_GRAPHS[1]
        G = load_gml_graph(path)
    elif graph_type.startswith("capec"):
        idx = int(graph_type.split("_")[1])-1
        path = CAPEC_GRAPHS[idx]
        G = load_gml_graph(path)
    else:
        return "Invalid graph type", 404

    html_file = f"{graph_type}.html"
    output_path = os.path.join("static/graphs", html_file)
    visualize_graph(G, output_html=output_path)
    return send_from_directory("static/graphs", html_file)


@app.route("/threats")
def threats():
    """Return top N threats"""
    top_n = int(request.args.get("top", 5))
    df = THREATS.sort_values("Score", ascending=False).head(top_n)
    return df.to_json(orient="records")

if __name__ == "__main__":
    app.run(debug=True)
