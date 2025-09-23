graph [
  directed 1
  capec_id "253"
  name "Remote Code Inclusion"
  abstraction "Standard"
  status "Draft"
  description "The attacker forces an application to load arbitrary code files from a remote location. The attacker could use this to try to load old versions of library files that have known vulnerabilities, to load malicious files that the attacker placed on the remote machine, or to otherwise change the functionality of the targeted application in unexpected ways."
  likelihood ""
  severity ""
  related_attack_patterns [
    capec_id "175"
    nature "ChildOf"
  ]
  related_attack_patterns [
    capec_id "664"
    nature "CanPrecede"
  ]
  prerequisites "_networkx_list_start"
  prerequisites "Target application server must allow remote files to be included.The malicious file must be placed on the remote machine previously."
  skills_required "[]"
  resources_required "[]"
  consequences "[]"
  mitigations "_networkx_list_start"
  mitigations "Minimize attacks by input validation and sanitization of any user data that will be used by the target application to locate a remote file to be included."
  example_instances "[]"
  related_weaknesses "_networkx_list_start"
  related_weaknesses "829"
  matched_cwes "_networkx_list_start"
  matched_cwes "829"
  taxonomy_mappings "_networkx_list_start"
  taxonomy_mappings [
    taxonomy_name "WASC"
    entry_id "05"
    entry_name "Remote File Inclusion"
  ]
  execution_flow "[]"
  node [
    id 0
    label "place_the_malicious_file"
  ]
]
