from pyvis.network import Network
import networkx as nx
import os
import json

def load_gml_graph(path):
    return nx.read_gml(path)

def visualize_graph(G, output_html="graph.html"):
    net = Network(height="600px", width="100%", notebook=False, directed=True)
    
    # Color nodes by type
    color_map = {'action': '#FF5733', 'context': '#33FF57', 'outcome': '#3375FF'}
    
    for node, data in G.nodes(data=True):
        node_type = data.get('type', 'unknown')
        color = color_map.get(node_type, 'gray')
        label = data.get('label', str(node))
        net.add_node(node, label=label, color=color, title=f"Type: {node_type}")

    for source, target, data in G.edges(data=True):
        net.add_edge(source, target, title=data.get('relation', ''))

    net.show_buttons(filter_=['physics'])
    os.makedirs(os.path.dirname(output_html), exist_ok=True)
    net.write_html(output_html)
    
def load_json_graph(path):
    """Load a canonical graph from JSON into a NetworkX DiGraph"""
    with open(path, 'r') as f:
        data = json.load(f)

    G = nx.DiGraph()
    
    for node in data.get("nodes", []):
        node_id = node["id"]

        # Prevent conflicts
        node_copy = dict(node)  
        node_copy.pop("id", None)     # remove id, already used
        node_copy.pop("label", None)  # remove label to avoid clash

        label = node.get("label", node_id)
        node_type = node.get("event_type", "unknown")

        G.add_node(node_id, label=label, type=node_type, **node_copy)

    for edge in data.get("edges", []):
        source = edge["source"]
        target = edge["target"]
        relation = edge.get("relation", "")
        G.add_edge(source, target, relation=relation)

    return G

