graph [
  directed 1
  capec_id "149"
  name "Explore for Predictable Temporary File Names"
  abstraction "Detailed"
  status "Draft"
  description "An attacker explores a target to identify the names and locations of predictable temporary files for the purpose of launching further attacks against the target. This involves analyzing naming conventions and storage locations of the temporary files created by a target application. If an attacker can predict the names of temporary files they can use this information to mount other attacks, such as information gathering and symlink attacks."
  likelihood ""
  severity "Medium"
  related_attack_patterns [
    capec_id "497"
    nature "ChildOf"
  ]
  related_attack_patterns [
    capec_id "155"
    nature "CanPrecede"
  ]
  prerequisites "The targeted application must create names for temporary files using a predictable procedure, e.g. using sequentially increasing numbers."
  prerequisites "The attacker must be able to see the names of the files the target is creating."
  skills_required "[]"
  resources_required "_networkx_list_start"
  resources_required "None: No specialized resources are required to execute this type of attack."
  consequences "[]"
  mitigations "[]"
  example_instances "[]"
  related_weaknesses "_networkx_list_start"
  related_weaknesses "377"
  matched_cwes "_networkx_list_start"
  matched_cwes "377"
  taxonomy_mappings "[]"
  execution_flow "[]"
  node [
    id 0
    label "see_the_names_of_the_files_the_target_is_creating"
  ]
]
