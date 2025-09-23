# 8_canonicalize_action_vocab.py
import json
from pathlib import Path
from collections import defaultdict
import re
import spacy
from sentence_transformers import SentenceTransformer
from sklearn.cluster import AgglomerativeClustering
import numpy as np

# ---------------------- Paths ----------------------
SRC_DIR = Path(__file__).parent
OUT_DIR = SRC_DIR.parent / "out"
IN_HELPER = OUT_DIR / "action_vocab_helper.json"
OUT_CANONICAL = OUT_DIR / "action_vocab_canonical.json"

# ---------------------- Load Models ----------------------
nlp = spacy.load("en_core_web_sm")  # lemmatization
embed_model = SentenceTransformer("all-MiniLM-L6-v2")  # embeddings

# ---------------------- Helper Functions ----------------------
def clean_token(token: str) -> str:
    token = token.lower()
    token = re.sub(r'\W+', '_', token)
    token = re.sub(r'_+', '_', token)
    return token.strip('_')

def preprocess_token(token: str) -> str:
    words = token.split('_')
    lemmatized = []
    for w in words:
        doc = nlp(w)
        if doc and doc[0].lemma_ not in ("be","do","have","must","use","let","try","assume","occur"):
            lemmatized.append(doc[0].lemma_)
    return "_".join(lemmatized)

# ---------------------- Load Data ----------------------
print("[INFO] Loading helper...")
helper = json.load(open(IN_HELPER, "r", encoding="utf-8"))
action_counts = helper["token_counts"]  # <- only counts needed
multiword_tokens = [tok for tok in action_counts.keys() if "_" in tok]
counts = {tok: action_counts[tok] for tok in multiword_tokens}

# ---------------------- Preprocess Tokens ----------------------
print("[INFO] Preprocessing tokens...")
preprocessed_tokens = [preprocess_token(tok) for tok in multiword_tokens]
token_map = dict(zip(multiword_tokens, preprocessed_tokens))  # original -> preprocessed

# ---------------------- Embeddings & Clustering ----------------------
print("[INFO] Computing embeddings...")
embeddings = embed_model.encode(preprocessed_tokens, convert_to_numpy=True)

print("[INFO] Clustering similar tokens...")
clustering = AgglomerativeClustering(
    n_clusters=None,
    metric="cosine",
    linkage="average",
    distance_threshold=0.25  # tweak for cluster tightness
)
labels = clustering.fit_predict(embeddings)

# ---------------------- Build Canonical Mapping ----------------------
cluster_map = defaultdict(list)
for tok, label in zip(preprocessed_tokens, labels):
    cluster_map[label].append(tok)

canonical_map = {}
for label, toks in cluster_map.items():
    # pick most frequent original token as canonical
    original_tokens = [orig for orig, pre in token_map.items() if pre in toks]
    canonical = max(original_tokens, key=lambda t: counts.get(t, 1))
    for orig in original_tokens:
        canonical_map[orig] = canonical

# ---------------------- Save Canonical Vocab ----------------------
print(f"[INFO] Saving canonical vocab → {OUT_CANONICAL}")
with open(OUT_CANONICAL, "w", encoding="utf-8") as f:
    json.dump(canonical_map, f, indent=2)

print(f"[DONE] Canonicalized {len(canonical_map)} action tokens.")
print("[INFO] Example mappings:")
for i, (k,v) in enumerate(list(canonical_map.items())[:20]):
    print(f"{k:<60} → {v}")
