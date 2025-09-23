graph [
  directed 1
  capec_id "191"
  name "Read Sensitive Constants Within an Executable"
  abstraction "Detailed"
  status "Draft"
  description "&#10;            "
  likelihood ""
  severity "Low"
  related_attack_patterns "_networkx_list_start"
  related_attack_patterns [
    capec_id "167"
    nature "ChildOf"
  ]
  prerequisites "_networkx_list_start"
  prerequisites "Access to a binary or executable such that it can be analyzed by various utilities."
  skills_required "[]"
  resources_required "_networkx_list_start"
  resources_required "Binary analysis programs such as 'strings' or 'grep', or hex editors."
  consequences "[]"
  mitigations "[]"
  example_instances "[]"
  related_weaknesses "_networkx_list_start"
  related_weaknesses "798"
  matched_cwes "_networkx_list_start"
  matched_cwes "798"
  taxonomy_mappings "_networkx_list_start"
  taxonomy_mappings [
    taxonomy_name "ATTACK"
    entry_id "1552.001"
    entry_name "Unsecured Credentials:Credentials in files"
  ]
  execution_flow "[]"
  node [
    id 0
    label "analyze_it"
  ]
]
