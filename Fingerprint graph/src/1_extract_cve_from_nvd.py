API_KEY = "bba3d239-a4c8-4b57-a280-6fe907b44335"
HEADERS = {"apikey": API_KEY}

import requests, json, time, re
from pathlib import Path

OUT_DIR = Path("out"); OUT_DIR.mkdir(exist_ok=True)

# Expanded keywords grouped
keyword_groups = {
    "ehr": [
        "ehr", "emr", "electronic health record", "electronic medical record",
        "openemr", "openmrs", "meditech", "epic", "cerner", "allscripts",
        "eclinicalworks", "athenahealth", "nextgen", "centricity"
    ],
    "standards": [
        "hl7", "hl7 v2", "hl7 v3", "cda", "ccd", "fhir", "hapi-fhir", "hapi fhir"
    ],
    "imaging": [
        "dicom", "pacs", "pacs server", "dicom viewer", "radiology", "vna",
        "vendor neutral archive", ".dcm", "dicomweb"
    ],
    "devices": [
        "infusion pump", "syringe pump", "ventilator", "pacemaker", "implantable",
        "patient monitor", "anesthesia machine", "biosensor"
    ],
    "general": [
        "medical", "healthcare", "hospital", "clinic", "patient", "phi",
        "protected health information"
    ],
    "vendors": [
        "ge healthcare", "philips healthcare", "siemens healthineers",
        "mckesson", "carestream", "canon medical", "fujifilm", "baxter",
        "becton dickinson", "smiths medical", "capsule technologies"
    ]
}

# Simple mapping of keywords in description -> affected data
affects_map = {
    "Credentials": [
        r"\bcredential", r"\bpassword", r"\blogin", r"\bauthentication",
        r"\bsession", r"\btokens?", r"\boauth", r"\bopenid"
    ],
    "PatientRecords": [
        r"\bpatient", r"\bmedical record", r"\behr", r"\bemr",
        r"\bclinical data", r"\bdemographic", r"\bdiagnosis", r"\bchart"
    ],
    "MedicalImages": [
        r"\bdicom", r"\bpacs", r"\bradiology", r"\bct\b", r"\bmri",
        r"\bimage file", r"\bdcm", r"\bscan"
    ],
    "Prescriptions": [
        r"\bprescription", r"\bmedication", r"\bdrug", r"\brx",
        r"\bpharmacy", r"\borders?", r"\bcpoe"
    ],
    "FinancialBilling": [
        r"\bbilling", r"\binsurance", r"\bclaim", r"\bcoding",
        r"\bpayment", r"\bcharge", r"\bmedicare", r"\bmedicaid"
    ],
    "PHI": [
        r"\bphi\b", r"\bprotected health information", r"\bhipaa",
        r"\bpii", r"\bsensitive data", r"\bconfidential", r"\bprivacy"
    ],
    "ImagingWorkflows": [
        r"\bhl7", r"\bfhir", r"\bmodality", r"\brtstruct", r"\brtplan",
        r"\bdicomweb", r"\bdicom tags?"
    ],
    "DeviceTelemetry": [
        r"\bmonitor", r"\btelemetry", r"\bwearable", r"\biot",
        r"\bimplants?", r"\bbiometric"
    ],
    "AccessControl": [
        r"\brole[- ]?based", r"\bprivilege", r"\bauthorization",
        r"\baccess control", r"\bmisconfig", r"\bexpos(e|ure)"
    ]
}

def infer_affects_data(text):
    found = []
    for dtype, patterns in affects_map.items():
        for pat in patterns:
            if re.search(pat, text, re.IGNORECASE):
                found.append(dtype)
                break  # avoid duplicate hits within same category
    return found

import random

def safe_get(url, params, headers=None, retries=10):
    for i in range(retries):
        resp = requests.get(url, params=params, headers=headers)
        if resp.status_code == 429: 
            retry_after = resp.headers.get("Retry-After")
            if retry_after:
                wait = int(retry_after) + 1
            else:
                wait = (2 ** i) + random.random() 
            print(f"Rate limited (429). Sleeping {wait:.1f}s before retry...")
            time.sleep(wait)
            continue
        resp.raise_for_status()
        return resp
    raise Exception("Too many retries, still failing with 429s")

def fetch_all_for_keyword(keyword):
    url = "https://services.nvd.nist.gov/rest/json/cves/2.0"
    start_index = 0
    results = []
    while True:
        params = {
            "keywordSearch": keyword,
            "startIndex": start_index,
            "resultsPerPage": 2000
        }
        resp = safe_get(url, params, headers=HEADERS)
        data = resp.json()
        vulns = data.get("vulnerabilities", [])
        if not vulns:
            break

        for item in vulns:
            cve = item["cve"]
            descs = [d["value"] for d in cve.get("descriptions", []) if d["lang"] == "en"]
            desc = descs[0] if descs else ""

            weaknesses = []
            for w in cve.get("weaknesses", []):
                for d in w.get("description", []):
                    if d["lang"] == "en":
                        weaknesses.append(d["value"])
            refs = [r["url"] for r in cve.get("references", [])]

            # Capture affected products from configurations
            products = []
            for config in cve.get("configurations", []):
                for node in config.get("nodes", []):
                    for match in node.get("cpeMatch", []):
                        cpe = match.get("criteria")
                        if cpe:
                            products.append(cpe)

            cvss = cve.get("metrics", {}).get("cvssMetricV31") or cve.get("metrics", {}).get("cvssMetricV30")
            if cvss:
                cvss_data = cvss[0]["cvssData"]
                base_score = cvss_data.get("baseScore")
                vector = cvss_data.get("vectorString")
                severity = cvss[0].get("baseSeverity")
            else:
                base_score, vector, severity = None, None, None

            affects = infer_affects_data(desc + " " + " ".join(refs))

            if any(keyword.lower() in str(p).lower() for p in products):
                confidence = "high"
                source_type = "CPE"
            elif keyword.lower() in desc.lower():
                confidence = "medium"
                source_type = "DescriptionKeyword"
            else:
                confidence = "low"
                source_type = "Other"

            # Easiest false positive filter: require keyword in desc or in product CPE
            if keyword.lower() not in desc.lower() and not any(keyword.lower() in str(p).lower() for p in products):
                continue

            results.append({
                "CVE_ID": cve["id"],
                "Published": cve.get("published"),
                "LastModified": cve.get("lastModified"),
                "Description": desc,
                "CWE": weaknesses,
                "CVSSv3_BaseScore": base_score,
                "CVSSv3_Vector": vector,
                "Severity": severity,
                "Products": products,
                "MatchedKeyword": [keyword],
                "AffectsData": affects,
                "Confidence": confidence,
                "SourceType": source_type
            })
        start_index += len(vulns)
        if start_index >= data.get("totalResults", 0):
            break
        time.sleep(1)  # polite to NVD servers
    return results

all_results = []
for group, kws in keyword_groups.items():
    for kw in kws:
        print(f"Fetching CVEs for keyword group {group}, keyword: {kw}")
        res = fetch_all_for_keyword(kw)
        print(f"  Found {len(res)} CVEs")
        all_results.extend(res)

# Deduplicate by CVE_ID but merge matched keywords and products
unique = {}
for r in all_results:
    if r["CVE_ID"] not in unique:
        unique[r["CVE_ID"]] = r
    else:
        existing = unique[r["CVE_ID"]]

        # Merge MatchedKeyword (ensure list)
        if not isinstance(existing["MatchedKeyword"], list):
            existing["MatchedKeyword"] = [existing["MatchedKeyword"]]
        if not isinstance(r["MatchedKeyword"], list):
            r["MatchedKeyword"] = [r["MatchedKeyword"]]
        existing["MatchedKeyword"] = list(set(existing["MatchedKeyword"] + r["MatchedKeyword"]))

        # Merge Products
        existing["Products"] = list(set(existing.get("Products", []) + r.get("Products", [])))

        # Merge AffectsData
        existing["AffectsData"] = list(set(existing.get("AffectsData", []) + r.get("AffectsData", [])))

all_results = list(unique.values())

out_file = OUT_DIR / "cves_healthcare_from_api.json"
with out_file.open("w", encoding="utf-8") as f:
    json.dump(all_results, f, indent=2)

print(f"Extracted {len(all_results)} unique healthcare CVEs → {out_file}")
