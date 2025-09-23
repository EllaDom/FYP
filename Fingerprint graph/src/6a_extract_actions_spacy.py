from pathlib import Path
import json, re
import spacy
from collections import OrderedDict

nlp = spacy.load("en_core_web_sm")

SRC_DIR = Path(__file__).parent
OUT_DIR = SRC_DIR.parent / "out"
IN_FILE = OUT_DIR / "capec_raw_flows.json"
OUT_FILE = OUT_DIR / "capec_actions_raw_cleaner.json"
SEPARATOR = "|||"

# verbs we usually don't want alone as actions (unless paired with a meaningful object)
VERB_STOPSET = {"do", "be", "have", "make", "get", "allow", "see", "occur", "place", "use", "take", "provide", "require", "include", "doe"}

# noun-phrase stopwords to avoid generic junk
NP_STOPWORDS = {"the", "this", "that", "these", "those", "various", "many", "some", "none", "resources", "resource", "things"}

def clean_token_text(s: str) -> str:
    s = s.lower()
    s = re.sub(r"[’'`\"]", "", s)
    s = re.sub(r"\s+", " ", s)
    s = re.sub(r"\W+", "_", s)
    s = re.sub(r"_+", "_", s)
    return s.strip("_")

def safe_lemma(token):
    # prefer lemma, but avoid obviously broken lemmata (like spidere)
    lem = token.lemma_.lower() if token.lemma_ else ""
    if lem and re.fullmatch(r"[a-z]+", lem) and not lem.endswith("e") or token.pos_ == "VERB" and lem.endswith("e") and token.text.lower().endswith("ing") == False:
        return lem
    # fallback to text if lemma is weird or contains non-alpha
    return token.text.lower()

def obj_text_limited(tok, max_words=5):
    # extract a compact object: get subtree words but limit length
    words = [t.text for t in tok.subtree if t.is_alpha or t.like_num or t.pos_ in ("NOUN","PROPN","ADJ")]
    if not words:
        return ""
    # trim leading/trailing determiners/stopwords
    # join and then cut to max_words
    joined = " ".join(words).strip()
    parts = joined.split()
    # try to keep last max_words (likely the head + modifiers)
    if len(parts) > max_words:
        parts = parts[-max_words:]
    return " ".join(parts)

def meaningful_np(np_text):
    t = np_text.strip().lower()
    if not t or len(t) < 4:
        return False
    # avoid tiny generic phrases
    tokens = [w for w in re.split(r"\W+", t) if w]
    if not tokens:
        return False
    if all(tok in NP_STOPWORDS for tok in tokens):
        return False
    return True

def extract_vo_phrases(text, capec_id, max_verbs_per_sent=5):
    tokens = []
    chunks = [c.strip() for c in text.split(SEPARATOR) if c.strip()]
    if len(chunks) > 1:
        print(f"[INFO] CAPEC {capec_id}: {len(chunks)} chunks")
    for chunk in chunks:
        doc = nlp(chunk)
        for sent in doc.sents:
            sdoc = nlp(sent.text.strip())
            found_verbs = 0
            local_tokens = []
            # collect verbs (allow multiple)
            for token in sdoc:
                if token.pos_ == "VERB":
                    if found_verbs >= max_verbs_per_sent:
                        break
                    verb_base = safe_lemma(token)
                    # particle (log in)
                    particle = ""
                    for ch in token.children:
                        if ch.dep_ == "prt":
                            particle = ch.text.lower()
                            break
                    # direct object or object-like child
                    dobj = None
                    for ch in token.children:
                        if ch.dep_ in ("dobj", "obj", "pobj", "attr", "dative", "xcomp", "ccomp"):
                            dobj = obj_text_limited(ch, max_words=5)
                            break
                    # if no dobj, try rights
                    if not dobj:
                        for ch in token.rights:
                            if ch.pos_ in ("NOUN","PROPN","ADJ"):
                                dobj = obj_text_limited(ch, max_words=5)
                                break
                    # construct raw string
                    if dobj and meaningful_np(dobj):
                        verb_part = f"{verb_base}_{particle}" if particle else verb_base
                        raw = f"{verb_part}_{dobj}"
                    else:
                        # only keep verb alone if it's not a weak verb
                        raw = verb_base if verb_base not in VERB_STOPSET else None

                    if raw:
                        raw_norm = clean_token_text(raw)
                        if raw_norm:
                            local_tokens.append((raw_norm, sent.text.strip()))
                    found_verbs += 1

            # fallback noun-phrases if nothing found
            if not local_tokens:
                nps = []
                for nc in sdoc.noun_chunks:
                    text_nc = nc.text.strip()
                    if meaningful_np(text_nc):
                        nps.append(text_nc)
                # pick up to 2 noun phrases
                for np_phrase in nps[:2]:
                    raw_norm = clean_token_text(np_phrase)
                    if raw_norm:
                        local_tokens.append((raw_norm, sent.text.strip()))

            # append local tokens (they may include duplicates; dedupe later)
            for r,s in local_tokens:
                tokens.append({"sentence": s, "raw_token": r})

    # deduplicate tokens preserving order
    seen = OrderedDict()
    for t in tokens:
        k = t["raw_token"]
        if k not in seen:
            seen[k] = t["sentence"]

    # prepare output seq: sentences (unique) and raw_actions (unique)
    raw_actions = list(seen.keys())
    # collect unique sentences (preserve order of first appearance)
    seen_sents = OrderedDict()
    for sent in seen.values():
        if sent not in seen_sents:
            seen_sents[sent] = True
    sentences = list(seen_sents.keys())

    return [{"sentence": s, "raw_token": r} for r,s in zip(raw_actions, seen.values())], sentences, raw_actions

def main():
    data = json.load(open(IN_FILE))
    out=[]
    total = len(data)
    for idx, e in enumerate(data, 1):
        flow_text = e.get("flow_text","")
        if not flow_text.strip():
            continue
        acts, sentences, raw_tokens = extract_vo_phrases(flow_text, e["capec_id"])
        out.append({
            "capec_id": e["capec_id"],
            "name": e.get("name"),
            "sentences": sentences,
            "raw_actions": raw_tokens
        })
        if idx % 10 == 0:
            print(f"[INFO] Processed {idx}/{total} CAPECs")
    json.dump(out, open(OUT_FILE,"w"), indent=2)
    print(f"[DONE] Wrote {len(out)} → {OUT_FILE}")

if __name__ == "__main__":
    main()
