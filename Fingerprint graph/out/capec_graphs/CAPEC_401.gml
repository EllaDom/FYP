graph [
  directed 1
  capec_id "401"
  name "Physically Hacking Hardware"
  abstraction "Standard"
  status "Stable"
  description "An adversary exploits a weakness in access control to gain access to currently installed hardware and precedes to implement changes or secretly replace a hardware component which undermines the system's integrity for the purpose of carrying out an attack."
  likelihood "Low"
  severity "High"
  related_attack_patterns "_networkx_list_start"
  related_attack_patterns [
    capec_id "440"
    nature "ChildOf"
  ]
  prerequisites "[]"
  skills_required "[]"
  resources_required "[]"
  consequences "[]"
  mitigations "[]"
  example_instances "_networkx_list_start"
  example_instances "A malicious subcontractor or subcontractor's employee that is responsible for system maintenance secretly replaces a hard drive with one containing malicious code that will allow for backdoor access once deployed."
  related_weaknesses "_networkx_list_start"
  related_weaknesses "1263"
  matched_cwes "_networkx_list_start"
  matched_cwes "1263"
  taxonomy_mappings "[]"
  execution_flow "[]"
  node [
    id 0
    label "replace_a_hard_drive_with_one_containing_malicious_code_that_will_allow_for_backdoor_access_once_deployed"
  ]
]
