graph [
  directed 1
  capec_id "551"
  name "Modify Existing Service"
  abstraction "Detailed"
  status "Draft"
  description "When an operating system starts, it also starts programs called services or daemons. Modifying existing services may break existing services or may enable services that are disabled/not commonly used."
  likelihood ""
  severity ""
  related_attack_patterns "_networkx_list_start"
  related_attack_patterns [
    capec_id "542"
    nature "ChildOf"
  ]
  prerequisites "[]"
  skills_required "[]"
  resources_required "[]"
  consequences "[]"
  mitigations "_networkx_list_start"
  mitigations "Limit privileges of user accounts so service changes can only be performed by authorized administrators. Also monitor any service changes that may occur inadvertently."
  example_instances "[]"
  related_weaknesses "284"
  related_weaknesses "522"
  matched_cwes "284"
  matched_cwes "522"
  taxonomy_mappings "_networkx_list_start"
  taxonomy_mappings [
    taxonomy_name "ATTACK"
    entry_id "1543"
    entry_name "Create or Modify System Process"
  ]
  execution_flow "[]"
]
