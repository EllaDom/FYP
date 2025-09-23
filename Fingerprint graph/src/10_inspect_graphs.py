import matplotlib.pyplot as plt
import networkx as nx

# Load a CAPEC graph
G = nx.read_gml("D:/Projects/FYP-I/out/capec_graphs/CAPEC_701.gml")

# Nodes (canonical action tokens)
print(list(G.nodes))

# Edges (sequence of actions)
print(list(G.edges))

# Graph-level metadata
for key, value in G.graph.items():
    print(f"{key}: {value}")

plt.figure(figsize=(12, 6))
nx.draw(G, with_labels=True, node_color="lightblue", node_size=2000, font_size=10, arrows=True)
plt.show()
