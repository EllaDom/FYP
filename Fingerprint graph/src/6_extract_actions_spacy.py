# extract_actions_spacy.py
import json
import re
import spacy
from pathlib import Path

nlp = spacy.load("en_core_web_sm")

SRC_DIR = Path(__file__).parent
OUT_DIR = SRC_DIR.parent / "out"
IN = OUT_DIR / "capec_raw_flows.json"
OUT = OUT_DIR / "capec_actions_raw.json"
SEPARATOR = "|||"

# Helper to clean/normalize tokens into lowercase_underscore form
def clean_token(s: str) -> str:
    if not s:
        return ""
    s = s.strip().lower()
    s = re.sub(r'\W+', '_', s)
    s = re.sub(r'_+', '_', s)
    s = s.strip('_')
    return s

def extract_vo_phrases(text, capec_id):
    tokens = []
    # pre-split by separator and drop empties
    chunks = [c.strip() for c in text.split(SEPARATOR) if c.strip()]
    if not chunks:
        return tokens

    if len(chunks) > 10:
        print(f"[INFO] CAPEC {capec_id}: {len(chunks)} chunks (large)")

    for i, chunk in enumerate(chunks, 1):
        doc = nlp(chunk)
        for sent in doc.sents:
            stext = sent.text.strip()
            if not stext:
                continue

            sdoc = nlp(stext)
            # Heuristic: find the main verb (skip auxiliaries)
            verb_tok = None
            for tok in sdoc:
                if tok.pos_ == "VERB" and tok.lemma_ not in ("be", "have", "do", "must", "use"):
                    verb_tok = tok
                    break
            if verb_tok is None:
                # fallback: pick any verb
                for tok in sdoc:
                    if tok.pos_ == "VERB":
                        verb_tok = tok
                        break

            verb = None
            dobj = None
            if verb_tok:
                verb = verb_tok.lemma_.strip()
                # try to get object or complement
                for ch in verb_tok.children:
                    if ch.dep_ in ("dobj", "obj", "pobj", "attr", "dative"):
                        dobj = " ".join([t.text for t in ch.subtree]).strip()
                        break
                if dobj is None:
                    # fallback: take xcomp/advcl/acl or noun child
                    for ch in verb_tok.children:
                        if ch.dep_ in ("xcomp", "advcl", "acl", "compound", "nsubjpass"):
                            dobj = " ".join([t.text for t in ch.subtree]).strip()
                            break

            # Only build token if we have either a non-stop verb or a meaningful object
            if verb:
                v = clean_token(verb)
                if dobj:
                    d = clean_token(dobj)
                    raw = v + ("_" + d if d else "")
                else:
                    raw = v
                # Skip trivial one-word verbs without object
                if len(raw.split('_')) > 1 or verb not in ("be", "have", "do", "must", "use"):
                    tokens.append({"sentence": stext, "raw_token": raw})

        if i % 5 == 0:
            print(f"[INFO] CAPEC {capec_id}: processed {i} chunks")

    return tokens

def main():
    data = json.load(open(IN, "r", encoding="utf-8"))
    out = []
    for idx, e in enumerate(data, 1):
        text = e.get("flow_text", "")
        if not text.strip():
            continue
        tokens = extract_vo_phrases(text, e["capec_id"])
        out.append({
            "capec_id": e["capec_id"],
            "name": e.get("name"),
            "sentences": [t["sentence"] for t in tokens],
            "raw_actions": [t["raw_token"] for t in tokens]
        })
        if idx % 10 == 0:
            print(f"[INFO] Processed {idx}/{len(data)} CAPECs")

    json.dump(out, open(OUT, "w", encoding="utf-8"), indent=2)
    print(f"[DONE] Wrote {len(out)} → {OUT}")

if __name__ == "__main__":
    main()
