import pandas as pd
import matplotlib.pyplot as plt
import seaborn as sns
import re

# ---------------- Load Events ----------------
events = pd.read_csv("events.csv")

# CAPEC mapping
ACTIVITY_TO_CAPEC = {
    "logon": "CAPEC-112",             # Brute Force / Login Abuse
    "multiple_logins": "CAPEC-112",   # Repeated Login Attempts
    "file_write": "CAPEC-118",        # Exfiltration to Removable Media
    "mass_file_access": "CAPEC-115",  # Data Harvesting / Enumeration
}

if "capec_id" not in events.columns:
    events["capec_id"] = events["activity"].map(ACTIVITY_TO_CAPEC).fillna("None")

# ---------------- Convert User IDs to Numeric ----------------
def extract_num(u):
    """Extract digits from user string, fallback=0 if none."""
    if pd.isna(u):
        return 0
    digits = re.findall(r"\d+", str(u))
    return int(digits[0]) if digits else 0

events["user_num"] = events["user"].apply(extract_num)

# ---------------- Group Users into Ranges ----------------
bin_size = 100   # e.g., users 0–99, 100–199, etc.
events["user_range_start"] = (events["user_num"] // bin_size) * bin_size
events["user_range"] = (
    events["user_range_start"].astype(str)
    + "-"
    + (events["user_range_start"] + bin_size - 1).astype(str)
)

# Count unique users in each (range, CAPEC)
agg = (
    events.groupby(["user_range", "capec_id"])
    .agg(users=("user", "nunique"))
    .reset_index()
)

# ---------------- Pivot for Heatmap ----------------
all_capecs = ["CAPEC-112", "CAPEC-115", "CAPEC-118"]  # ensure all attacks show
pivot = (
    agg.pivot_table(index="user_range", columns="capec_id", values="users", fill_value=0)
    .reindex(columns=all_capecs, fill_value=0)
)

# Ensure integer values (fix fmt="d" error)
pivot = pivot.astype(int)

# ---------------- Heatmap ----------------
plt.figure(figsize=(12, 6))
sns.heatmap(pivot, annot=True, fmt="d", cmap="YlOrRd")

plt.title("Overall Graph Overview (User Ranges × CAPEC Attacks)", fontsize=14)
plt.xlabel("CAPEC Attack Pattern")
plt.ylabel("User ID Range")
plt.xticks(rotation=30)
plt.tight_layout()
plt.savefig("overall_graph_overview.png", dpi=300)
plt.show()
