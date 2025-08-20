import networkx as nx
import matplotlib.pyplot as plt

# ---------------- Example Data ----------------
# Normally you'd read this from events.csv with capec mapping
user_events = {
    "User1": [("Login", "CAPEC-115"), ("File Access", "CAPEC-118")],
    "User2": [("Upload", "CAPEC-118"), ("Download", "CAPEC-112")],
    "User3": [("Search", "CAPEC-115"), ("Delete", "CAPEC-112")],
}

# ---------------- Build Graph ----------------
G = nx.DiGraph()

for user, actions in user_events.items():
    # Add user node
    G.add_node(user, ntype="user")
    
    for action, capec in actions:
        action_node = f"{user}_{action}"   # Keep activity tied to user
        G.add_node(action_node, ntype="activity")
        G.add_node(capec, ntype="capec")

        # Edges: User → Activity → CAPEC
        G.add_edge(user, action_node)
        G.add_edge(action_node, capec)

# ---------------- Draw Graph ----------------
plt.figure(figsize=(10, 7))

pos = nx.spring_layout(G, seed=42, k=0.5)

# Separate node types
user_nodes = [n for n, d in G.nodes(data=True) if d["ntype"] == "user"]
act_nodes  = [n for n, d in G.nodes(data=True) if d["ntype"] == "activity"]
capec_nodes = [n for n, d in G.nodes(data=True) if d["ntype"] == "capec"]

# Draw nodes with colors
nx.draw_networkx_nodes(G, pos, nodelist=user_nodes, node_color="skyblue", node_size=800, label="Users")
nx.draw_networkx_nodes(G, pos, nodelist=act_nodes, node_color="lightgreen", node_size=700, label="Activities")
nx.draw_networkx_nodes(G, pos, nodelist=capec_nodes, node_color="salmon", node_size=800, label="CAPEC")

# Draw edges
nx.draw_networkx_edges(G, pos, arrows=True, arrowstyle="->", arrowsize=12, edge_color="gray")

# Labels
nx.draw_networkx_labels(G, pos, font_size=8, font_family="sans-serif")

# Legend
plt.legend(scatterpoints=1, loc="upper left", frameon=False)
plt.title("User → Activity → CAPEC Graph", fontsize=14)
plt.axis("off")
plt.tight_layout()
plt.savefig("user_activity_capec_graph.png", dpi=300)
plt.show()
