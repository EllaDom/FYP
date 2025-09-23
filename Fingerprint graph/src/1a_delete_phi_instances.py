import json
from pathlib import Path

SRC_DIR = Path(__file__).parent
OUT_DIR = SRC_DIR.parent / "out"
INPUT_FILE = OUT_DIR / "cves_healthcare_from_api.json"
OUTPUT_FILE = OUT_DIR / "cves_healthcare_from_api_filtered.json"

with INPUT_FILE.open("r", encoding="utf-8") as f:
    data = json.load(f)

filtered_data = [
    cve for cve in data
    if not any(kw.lower() == "phi" for kw in cve.get("MatchedKeyword", []))
]

with OUTPUT_FILE.open("w", encoding="utf-8") as f:
    json.dump(filtered_data, f, indent=2)

print(f"Filtered {len(data) - len(filtered_data)} CVEs containing 'phi'.")
print(f"Remaining CVEs: {len(filtered_data)} → saved to {OUTPUT_FILE}")
