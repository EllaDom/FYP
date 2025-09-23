import json
from pathlib import Path

# Paths
SRC_DIR = Path(__file__).parent
OUT_DIR = SRC_DIR.parent / "out"
ORIGINAL_FILE = OUT_DIR / "cves_healthcare_from_api_filtered.json"
ZERO_SHOT_FILE = OUT_DIR / "cves_healthcare_from_api_zero_shot.json"

# Load JSON files
with ORIGINAL_FILE.open("r", encoding="utf-8") as f:
    original = json.load(f)

with ZERO_SHOT_FILE.open("r", encoding="utf-8") as f:
    zero_shot = json.load(f)

# Build set of CVE_IDs that remain after zero-shot
kept_ids = {cve["CVE_ID"] for cve in zero_shot}

# List dropped CVEs
dropped_cves = [
    {"CVE_ID": cve["CVE_ID"], "Description": cve["Description"]}
    for cve in original
    if cve["CVE_ID"] not in kept_ids
]

# Print dropped CVEs
print(f"Dropped {len(dropped_cves)} CVEs:")
for cve in dropped_cves:
    print(f"{cve['CVE_ID']}: {cve['Description'][:120]}{'...' if len(cve['Description'])>120 else ''}")

# Optional: save dropped CVEs to a file
DROPPED_FILE = OUT_DIR / "cves_dropped_by_zero_shot.json"
with DROPPED_FILE.open("w", encoding="utf-8") as f:
    json.dump(dropped_cves, f, indent=2)

print(f"Dropped CVEs saved to {DROPPED_FILE}")
