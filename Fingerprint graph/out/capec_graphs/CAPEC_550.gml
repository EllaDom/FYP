graph [
  directed 1
  capec_id "550"
  name "Install New Service"
  abstraction "Detailed"
  status "Draft"
  description "When an operating system starts, it also starts programs called services or daemons. Adversaries may install a new service which will be executed at startup (on a Windows system, by modifying the registry). The service name may be disguised by using a name from a related operating system or benign software. Services are usually run with elevated privileges."
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
  mitigations "Limit privileges of user accounts so new service creation can only be performed by authorized administrators."
  example_instances "[]"
  related_weaknesses "_networkx_list_start"
  related_weaknesses "284"
  matched_cwes "_networkx_list_start"
  matched_cwes "284"
  taxonomy_mappings "_networkx_list_start"
  taxonomy_mappings [
    taxonomy_name "ATTACK"
    entry_id "1543"
    entry_name "Create or Modify System Process"
  ]
  execution_flow "[]"
]
