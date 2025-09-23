# 7_build_action_vocab_helper.py
import json
from pathlib import Path
import collections

SRC_DIR = Path(__file__).parent
OUT_DIR = SRC_DIR.parent / "out"
IN_FILE = OUT_DIR / "capec_actions_raw.json"
OUT_FILE = OUT_DIR / "action_vocab_helper.json"

# Load CAPEC actions
with open(IN_FILE, "r", encoding="utf-8") as f:
    data = json.load(f)

cnt = collections.Counter()
capec_action_order = {}  # preserve CAPEC ID -> ordered raw_actions (multi-word only)

for e in data:
    capec_id = e["capec_id"]
    raw_actions = []
    for token in e.get("raw_actions", []):
        if "_" not in token:  # skip single-word tokens
            continue
        raw_actions.append(token)
        cnt[token] += 1
    capec_action_order[capec_id] = raw_actions

# Save full helper JSON: token -> count + CAPEC mapping
helper_dict = {
    "token_counts": dict(cnt),
    "capec_ordered_actions": capec_action_order
}

with open(OUT_FILE, "w", encoding="utf-8") as f:
    json.dump(helper_dict, f, indent=2)

print(f"[DONE] Saved helper with {len(cnt)} multi-word tokens -> {OUT_FILE}")
