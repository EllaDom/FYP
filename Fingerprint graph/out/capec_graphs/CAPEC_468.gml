graph [
  directed 1
  capec_id "468"
  name "Generic Cross-Browser Cross-Domain Theft"
  abstraction "Standard"
  status "Draft"
  description "An attacker makes use of Cascading Style Sheets (CSS) injection to steal data cross domain from the victim's browser. The attack works by abusing the standards relating to loading of CSS: 1. Send cookies on any load of CSS (including cross-domain) 2. When parsing returned CSS ignore all data that does not make sense before a valid CSS descriptor is found by the CSS parser."
  likelihood ""
  severity "Medium"
  related_attack_patterns "_networkx_list_start"
  related_attack_patterns [
    capec_id "242"
    nature "ChildOf"
  ]
  prerequisites "_networkx_list_start"
  prerequisites "No new lines can be present in the injected CSS stringProper HTML or URL escaping of the &#34; and ' characters is not presentThe attacker has control of two injection points: pre-string and post-string"
  skills_required "_networkx_list_start"
  skills_required [
    level "High"
    description "Ability to craft a CSS injection"
  ]
  resources_required "_networkx_list_start"
  resources_required "Attacker controlled site/page to render a page referencing the injected CSS string"
  consequences "[]"
  mitigations "Design: Prior to performing CSS parsing, require the CSS to start with well-formed CSS when it is a cross-domain load and the MIME type is broken. This is a browser level fix."
  mitigations "Implementation: Perform proper HTML encoding and URL escaping"
  example_instances "[]"
  related_weaknesses "707"
  related_weaknesses "149"
  related_weaknesses "177"
  related_weaknesses "838"
  matched_cwes "_networkx_list_start"
  matched_cwes "707"
  taxonomy_mappings "[]"
  execution_flow "[]"
]
