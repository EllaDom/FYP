graph [
  directed 1
  capec_id "181"
  name "Flash File Overlay"
  abstraction "Detailed"
  status "Draft"
  description "An attacker creates a transparent overlay using flash in order to intercept user actions for the purpose of performing a clickjacking attack. In this technique, the Flash file provides a transparent overlay over HTML content. Because the Flash application is on top of the content, user actions, such as clicks, are caught by the Flash application rather than the underlying HTML. The action is then interpreted by the overlay to perform the actions the attacker wishes."
  likelihood ""
  severity "Medium"
  related_attack_patterns "_networkx_list_start"
  related_attack_patterns [
    capec_id "103"
    nature "ChildOf"
  ]
  prerequisites "The victim must be tricked into navigating to the attackers' decoy site and performing the actions on the decoy page."
  prerequisites "The victim's browser must support invisible Flash overlays."
  skills_required "[]"
  resources_required "_networkx_list_start"
  resources_required "The attacker must be able to force the Flash overlay over the decoy content."
  consequences "[]"
  mitigations "[]"
  example_instances "[]"
  related_weaknesses "_networkx_list_start"
  related_weaknesses "1021"
  matched_cwes "_networkx_list_start"
  matched_cwes "1021"
  taxonomy_mappings "[]"
  execution_flow "[]"
  node [
    id 0
    label "trick_the_victim"
  ]
  node [
    id 1
    label "support_invisible_flash_overlays"
  ]
  edge [
    source 0
    target 1
  ]
]
