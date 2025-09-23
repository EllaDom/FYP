import json
from pathlib import Path
from transformers import pipeline
import torch

SRC_DIR = Path(__file__).parent
OUT_DIR = SRC_DIR.parent / "out"
INPUT_FILE = OUT_DIR / "cves_healthcare_from_api_filtered.json"
OUTPUT_FILE = OUT_DIR / "cves_healthcare_from_api_zero_shot.json"

with INPUT_FILE.open("r", encoding="utf-8") as f:
    data = json.load(f)

print(f"Loaded {len(data)} CVEs for zero-shot classification.")

device = 0 if torch.cuda.is_available() else -1
classifier = pipeline("zero-shot-classification", model="facebook/bart-large-mnli", device=device)

candidate_labels = [
    "This CVE is relevant to electronic health records or healthcare systems.",
    "This CVE is NOT relevant to healthcare or EHR systems."
]

THRESHOLD = 0.7

filtered_cves = []
for i, cve in enumerate(data, 1):
    desc = cve.get("Description", "")
    result = classifier(desc, candidate_labels=candidate_labels)
    
    relevant_score = result["scores"][result["labels"].index(candidate_labels[0])]
    
    if relevant_score >= THRESHOLD:
        filtered_cves.append(cve)
    
    if i % 50 == 0 or i == len(data):
        print(f"Processed {i}/{len(data)} CVEs, kept {len(filtered_cves)} so far.")

with OUTPUT_FILE.open("w", encoding="utf-8") as f:
    json.dump(filtered_cves, f, indent=2)

print(f"Zero-shot filtering complete. {len(filtered_cves)} CVEs saved to {OUTPUT_FILE}")
