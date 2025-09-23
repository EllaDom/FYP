# extract_raw_flows.py
import json
from pathlib import Path

SRC_DIR = Path(__file__).parent
OUT_DIR = SRC_DIR.parent / "out"
IN_FILE = OUT_DIR / "capec_candidates_rich.json"
OUT_FILE = OUT_DIR / "capec_raw_flows.json"

SEPARATOR = " ||| "  # separator for spaCy sentence splitting

def concatenate_flow_text(e):
    texts = []

    # Execution Flow: description + techniques
    for step in e.get("execution_flow", []):
        if step.get("description"):
            texts.append(step["description"].strip())
        for t in step.get("techniques", []):
            if t.strip():
                texts.append(t.strip())

    # Example Instances
    for ex in e.get("example_instances", []):
        if ex.strip():
            texts.append(ex.strip())

    # Optionally, include prerequisites for context
    for pre in e.get("prerequisites", []):
        if pre.strip():
            texts.append(pre.strip())

    # Join with separator
    return SEPARATOR.join(texts)

def main():
    data = json.load(open(IN_FILE))
    out = []
    for e in data:
        flow_text = concatenate_flow_text(e)
        if flow_text.strip():  # skip empty flows
            out.append({
                "capec_id": e["capec_id"],
                "name": e.get("name"),
                "flow_text": flow_text
            })
    json.dump(out, open(OUT_FILE, "w"), indent=2)
    print(f"Wrote {len(out)} → {OUT_FILE}")

if __name__ == "__main__":
    main()
