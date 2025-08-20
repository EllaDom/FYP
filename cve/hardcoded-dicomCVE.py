import pandas as pd
import networkx as nx
import matplotlib.pyplot as plt

# === Load events ===
events_df = pd.read_csv("events.csv")

# === Example CAPEC mapping ===
capec_map = {
    "logon": "CAPEC-112",       # Brute Force / Login Abuse
    "file_write": "CAPEC-118",  # Exfiltration to Removable Media
    "multiple_logins": "CAPEC-112",
    "mass_file_access": "CAPEC-122",
}

# === Example CWE/CVE chain for DICOM slice ===
# Normally you’d pull this from NVD / CWE-CAPEC mapping,
# here I’m hardcoding a small slice for demo
cve_cwe_capec_map = {
    "CAPEC-112": [("CVE-2021-1234", "CWE-307")],  # CVE→CWE→CAPEC
    "CAPEC-118": [("CVE-2020-5678", "CWE-276")],
    "CAPEC-122": [("CVE-2019-8765", "CWE-732")],
}

# === Function to plot per-user graph with CVE slice ===
def plot_user_graph(user_id):
    user_events = events_df[events_df["user"] == user_id]
    if user_events.empty:
        print(f"No events found for user {user_id}")
        return

    G = nx.DiGraph()

    # Add user node
    G.add_node(user_id, type="user")

    for _, row in user_events.iterrows():
        activity = row["activity"]
        capec = capec_map.get(activity, None)

        # Activity node
        G.add_node(activity, type="activity")
        G.add_edge(user_id, activity)

        if capec:
            # CAPEC node
            G.add_node(capec, type="capec")
            G.add_edge(activity, capec)

            # Attach CVE→CWE→CAPEC slice if available
            if capec in cve_cwe_capec_map:
                for cve, cwe in cve_cwe_capec_map[capec]:
                    G.add_node(cve, type="cve")
                    G.add_node(cwe, type="cwe")
                    G.add_edge(cve, cwe)
                    G.add_edge(cwe, capec)

    # --- Draw ---
    pos = nx.spring_layout(G, seed=42)

    node_colors = []
    node_shapes = {"user": "o", "activity": "s", "capec": "D", "cve": "^", "cwe": "v"}
    color_map = {"user": "skyblue", "activity": "lightgreen",
                 "capec": "salmon", "cve": "orange", "cwe": "violet"}

    for n, d in G.nodes(data=True):
        node_colors.append(color_map[d["type"]])

    nx.draw(G, pos, with_labels=True,
            node_color=node_colors,
            node_size=1500,
            font_size=8)

    plt.title(f"User {user_id} – Activity to CAPEC with CVE→CWE slice")
    plt.show()

# Example usage:
plot_user_graph("ums0883")
