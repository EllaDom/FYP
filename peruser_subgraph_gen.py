import pandas as pd
import networkx as nx
import matplotlib.pyplot as plt

# ---------------- Load Data ----------------
events = pd.read_csv("events.csv")

# CAPEC mapping
ACTIVITY_TO_CAPEC = {
    "logon": "CAPEC-112",             # Brute Force / Login Abuse
    "multiple_logins": "CAPEC-112",   # Repeated Login Attempts
    "file_write": "CAPEC-118",        # Exfiltration to Removable Media
    "mass_file_access": "CAPEC-115",  # Data Harvesting / Enumeration
}

# Add CAPEC mapping
events["capec_id"] = events["activity"].map(ACTIVITY_TO_CAPEC).fillna("None")

# ---------------- Function: Build User Subgraph ----------------
def plot_user_subgraph(user_id):
    user_events = events[events["user"] == user_id]
    if user_events.empty:
        print(f"No events found for user {user_id}")
        return

    G = nx.DiGraph()

    # Add user node
    G.add_node(user_id, type="user")

    # Add activity and CAPEC nodes
    for _, row in user_events.iterrows():
        activity_node = f"{row['activity']}"
        capec_node = row["capec_id"]

        # Add activity node
        G.add_node(activity_node, type="activity")
        G.add_edge(user_id, activity_node)

        # Add CAPEC node if not None
        if capec_node != "None":
            G.add_node(capec_node, type="capec")
            G.add_edge(activity_node, capec_node)

    # ---------------- Visualization ----------------
    pos = nx.spring_layout(G, seed=42)

    node_colors = []
    node_shapes = {"user": "o", "activity": "s", "capec": "D"}
    color_map = {"user": "skyblue", "activity": "lightgreen", "capec": "salmon"}

    # Draw each type separately for different shapes
    for ntype, shape in node_shapes.items():
        nodelist = [n for n, d in G.nodes(data=True) if d["type"] == ntype]
        nx.draw_networkx_nodes(
            G, pos,
            nodelist=nodelist,
            node_color=color_map[ntype],
            node_shape=shape,
            node_size=800,
            alpha=0.9,
        )

    nx.draw_networkx_edges(G, pos, edge_color="gray", arrows=True)
    nx.draw_networkx_labels(G, pos, font_size=8, font_weight="bold")

    plt.title(f"User {user_id} – Activity to CAPEC Mapping", fontsize=12)
    plt.axis("off")
    plt.tight_layout()
    plt.show()

# ---------------- Example Usage ----------------
plot_user_subgraph("ums0883")   # Replace with any user from events.csv
