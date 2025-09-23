import xml.etree.ElementTree as ET
import json
from pathlib import Path

SRC_DIR = Path(__file__).parent
OUT_DIR = SRC_DIR.parent / "out"
IN_DIR = SRC_DIR.parent / "data"
CAPEC_FILE = IN_DIR / "capec_v3.9.xml"
CWE_FILE = OUT_DIR / "unique_cwes.txt"
OUT_FILE = OUT_DIR / "capec_candidates_rich.json"

ns = {'capec': 'http://capec.mitre.org/capec-3', 'xhtml': 'http://www.w3.org/1999/xhtml'}

def get_all_text(node):
    """Recursively get all text from an element, including children, concatenated and stripped."""
    if node is None:
        return ''
    texts = []
    if node.text and node.text.strip():
        texts.append(node.text.strip())
    for child in node:
        texts.append(get_all_text(child))
        if child.tail and child.tail.strip():
            texts.append(child.tail.strip())
    return ' '.join(texts).strip()

def parse():
    # Load CWE whitelist
    cw = set([x.strip().replace('CWE-', '') for x in open(CWE_FILE).read().splitlines() if x.strip()])

    # Parse XML
    tree = ET.parse(CAPEC_FILE)
    root = tree.getroot()

    candidates = []

    for ap in root.findall('.//capec:Attack_Pattern', ns):
        capec_id = ap.get('ID') or ap.findtext('capec:ID', default=None, namespaces=ns)
        name = ap.get('Name') or ap.findtext('capec:Name', default=None, namespaces=ns)
        abstraction = ap.get('Abstraction', '')
        status = ap.get('Status', '')
        likelihood = ap.findtext('capec:Likelihood_Of_Attack', default='', namespaces=ns)
        severity = ap.findtext('capec:Typical_Severity', default='', namespaces=ns)
        description = ap.findtext('capec:Description', default='', namespaces=ns)

        # Related Attack Patterns
        related_attack_patterns = []
        for rap in ap.findall('.//capec:Related_Attack_Pattern', ns) + ap.findall('.//Related_Attack_Pattern'):
            rap_id = rap.get('CAPEC_ID')
            nature = rap.get('Nature', '')
            if rap_id:
                related_attack_patterns.append({'capec_id': rap_id, 'nature': nature})

        # Execution Flow
        exec_flow = []
        for step in ap.findall('.//capec:Attack_Step', ns):
            stepnum = step.findtext('capec:Step', default='', namespaces=ns)
            phase = step.findtext('capec:Phase', default='', namespaces=ns)
            desc = step.findtext('capec:Description', default='', namespaces=ns)
            techs = [t.text.strip() for t in step.findall('capec:Technique', ns) if t.text and t.text.strip()]
            exec_flow.append({'step': stepnum, 'phase': phase, 'description': desc, 'techniques': techs})

        # Prerequisites
        prerequisites = [get_all_text(p) for p in ap.findall('.//capec:Prerequisite', ns) + ap.findall('.//Prerequisite')]

        # Skills Required
        skills = []
        for skill in ap.findall('.//capec:Skill', ns) + ap.findall('.//Skill'):
            level = skill.get('Level', '')
            text = get_all_text(skill)
            skills.append({'level': level, 'description': text})

        # Resources Required
        resources = [get_all_text(r) for r in ap.findall('.//capec:Resource', ns) + ap.findall('.//Resource')]

        # Consequences
        consequences = []
        for cons in ap.findall('.//capec:Consequence', ns) + ap.findall('.//Consequence'):
            scopes = [s.text.strip() for s in cons.findall('capec:Scope', ns) + cons.findall('Scope') if s.text and s.text.strip()]
            impact = cons.findtext('capec:Impact', default='', namespaces=ns)
            consequences.append({'scope': scopes, 'impact': impact})

        # Mitigations
        mitigations = [get_all_text(m) for m in ap.findall('.//capec:Mitigation', ns) + ap.findall('.//Mitigation')]

        # Example Instances
        examples = [get_all_text(e) for e in ap.findall('.//capec:Example', ns) + ap.findall('.//Example')]

        # Related Weaknesses
        rels = [rw.get('CWE_ID') or rw.get('CWE-ID') for rw in ap.findall('.//capec:Related_Weakness', ns) + ap.findall('.//Related_Weakness') if rw.get('CWE_ID') or rw.get('CWE-ID')]
        matched = list(set(rels) & cw)
        if not matched:
            print(f"[DEBUG] CAPEC {capec_id} has CWEs {rels} but none in whitelist")

        # Taxonomy Mappings
        taxonomy_mappings = []
        for tm in ap.findall('.//capec:Taxonomy_Mapping', ns) + ap.findall('.//Taxonomy_Mapping'):
            taxonomy_name = tm.get('Taxonomy_Name')
            entry_id = tm.findtext('capec:Entry_ID', default='', namespaces=ns)
            entry_name = tm.findtext('capec:Entry_Name', default='', namespaces=ns)
            taxonomy_mappings.append({'taxonomy_name': taxonomy_name, 'entry_id': entry_id, 'entry_name': entry_name})

        if matched:
            candidates.append({
                'capec_id': capec_id,
                'name': name,
                'abstraction': abstraction,
                'status': status,
                'description': description,
                'likelihood': likelihood,
                'severity': severity,
                'related_attack_patterns': related_attack_patterns,
                'execution_flow': exec_flow,
                'prerequisites': prerequisites,
                'skills_required': skills,
                'resources_required': resources,
                'consequences': consequences,
                'mitigations': mitigations,
                'example_instances': examples,
                'related_weaknesses': rels,
                'matched_cwes': matched,
                'taxonomy_mappings': taxonomy_mappings
            })

    json.dump(candidates, open(OUT_FILE, "w"), indent=2)
    print(f"Wrote {len(candidates)} CAPEC candidates → {OUT_FILE}")

if __name__ == "__main__":
    parse()
