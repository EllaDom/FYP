graph [
  directed 1
  capec_id "187"
  name "Malicious Automated Software Update via Redirection"
  abstraction "Detailed"
  status "Draft"
  description "An attacker exploits two layers of weaknesses in server or client software for automated update mechanisms to undermine the integrity of the target code-base. The first weakness involves a failure to properly authenticate a server as a source of update or patch content. This type of weakness typically results from authentication mechanisms which can be defeated, allowing a hostile server to satisfy the criteria that establish a trust relationship. The second weakness is a systemic failure to validate the identity and integrity of code downloaded from a remote location, hence the inability to distinguish malicious code from a legitimate update."
  likelihood "High"
  severity "High"
  related_attack_patterns "_networkx_list_start"
  related_attack_patterns [
    capec_id "186"
    nature "ChildOf"
  ]
  prerequisites "[]"
  skills_required "[]"
  resources_required "[]"
  consequences "_networkx_list_start"
  consequences [
    scope "Access Control"
    scope "Availability"
    scope "Confidentiality"
    impact "Execute Unauthorized Commands"
  ]
  mitigations "[]"
  example_instances "[]"
  related_weaknesses "_networkx_list_start"
  related_weaknesses "494"
  matched_cwes "_networkx_list_start"
  matched_cwes "494"
  taxonomy_mappings "_networkx_list_start"
  taxonomy_mappings [
    taxonomy_name "ATTACK"
    entry_id "1072"
    entry_name "Software Deployment Tools"
  ]
  execution_flow "[]"
]
