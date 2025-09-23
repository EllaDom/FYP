graph [
  directed 1
  capec_id "5"
  name "Blue Boxing"
  abstraction "Detailed"
  status "Obsolete"
  description "&#10;            "
  likelihood "Medium"
  severity "Very High"
  related_attack_patterns "_networkx_list_start"
  related_attack_patterns [
    capec_id "220"
    nature "ChildOf"
  ]
  prerequisites "_networkx_list_start"
  prerequisites "System must use weak authentication mechanisms for administrative functions."
  skills_required "_networkx_list_start"
  skills_required [
    level "Low"
    description "Given a vulnerable phone system, the attackers' technical vector relies on attacks that are well documented in cracker 'zines and have been around for decades."
  ]
  resources_required "_networkx_list_start"
  resources_required "CCITT-5 or other vulnerable lines, with the ability to send tones such as combined 2,400 Hz and 2,600 Hz tones to the switch"
  consequences [
    scope "_networkx_list_start"
    scope "Availability"
    impact "Resource Consumption"
  ]
  consequences [
    scope "Confidentiality"
    scope "Access Control"
    scope "Authorization"
    impact "Gain Privileges"
  ]
  mitigations "Implementation: Upgrade phone lines. Note this may be prohibitively expensive"
  mitigations "Use strong access control such as two factor access control for administrative access to the switch"
  example_instances "_networkx_list_start"
  example_instances "An adversary identifies a vulnerable CCITT-5 phone line, and sends a combination tone to the switch in order to request administrative access. Based on tone and timing parameters the request is verified for access to the switch. Once the adversary has gained control of the switch launching calls, routing calls, and a whole host of opportunities are available."
  related_weaknesses "_networkx_list_start"
  related_weaknesses "285"
  matched_cwes "_networkx_list_start"
  matched_cwes "285"
  taxonomy_mappings "[]"
  execution_flow "[]"
  node [
    id 0
    label "identify_a_vulnerable_ccitt_5_phone_line"
  ]
  node [
    id 1
    label "gain_control_of_the_switch_launching_calls"
  ]
  node [
    id 2
    label "use_weak_authentication_mechanisms"
  ]
  edge [
    source 0
    target 1
  ]
  edge [
    source 1
    target 2
  ]
]
