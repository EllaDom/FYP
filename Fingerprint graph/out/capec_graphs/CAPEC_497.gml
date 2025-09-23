graph [
  directed 1
  capec_id "497"
  name "File Discovery"
  abstraction "Standard"
  status "Draft"
  description "An adversary engages in probing and exploration activities to determine if common key files exists. Such files often contain configuration and security parameters of the targeted application, system or network. Using this knowledge may often pave the way for more damaging attacks."
  likelihood "High"
  severity "Very Low"
  related_attack_patterns "_networkx_list_start"
  related_attack_patterns [
    capec_id "169"
    nature "ChildOf"
  ]
  prerequisites "_networkx_list_start"
  prerequisites "The adversary must know the location of these common key files."
  skills_required "[]"
  resources_required "[]"
  consequences "_networkx_list_start"
  consequences [
    scope "_networkx_list_start"
    scope "Confidentiality"
    impact "Read Data"
  ]
  mitigations "_networkx_list_start"
  mitigations "Leverage file protection mechanisms to render these files accessible only to authorized parties."
  example_instances "[]"
  related_weaknesses "_networkx_list_start"
  related_weaknesses "200"
  matched_cwes "_networkx_list_start"
  matched_cwes "200"
  taxonomy_mappings "_networkx_list_start"
  taxonomy_mappings [
    taxonomy_name "ATTACK"
    entry_id "1083"
    entry_name "File and Directory Discovery"
  ]
  execution_flow "[]"
  node [
    id 0
    label "know_the_location_of_these_common_key_files"
  ]
]
