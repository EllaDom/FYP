import json
from pathlib import Path
from collections import Counter

SRC_DIR = Path(__file__).parent
OUT_DIR = SRC_DIR.parent / "out"
INPUT_FILE = OUT_DIR / "cves_healthcare_from_api_zero_shot.json"
OUTPUT_FILE = OUT_DIR / "unique_cwes_with_counts.txt"

# Ensure output directory exists
OUT_DIR.mkdir(parents=True, exist_ok=True)

with INPUT_FILE.open("r", encoding="utf-8") as f:
    json_data = json.load(f)

cwe_counter = Counter()

# Count each CWE
for entry in json_data:
    for word in entry.get("CWE", []):
        if word and not word.lower().startswith("nvd-cve"):
            cwe_counter[word.strip()] += 1

# Calculate total count of all CWEs
total_cwes = sum(cwe_counter.values())

# Write CWEs with their counts and the total count to the output file
with OUTPUT_FILE.open("w", encoding="utf-8") as f:
    for cwe, count in sorted(cwe_counter.items()):
        f.write(f"{cwe}: {count}\n")
    f.write(f"\nTotal CWEs: {total_cwes}\n")

print(f"Wrote {len(cwe_counter)} unique CWEs with counts to {OUTPUT_FILE}")
print(f"Total count of CWEs: {total_cwes}")
