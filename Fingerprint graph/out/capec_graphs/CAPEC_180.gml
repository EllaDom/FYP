graph [
  directed 1
  capec_id "180"
  name "Exploiting Incorrectly Configured Access Control Security Levels"
  abstraction "Standard"
  status "Draft"
  description "An attacker exploits a weakness in the configuration of access controls and is able to bypass the intended protection that these measures guard against and thereby obtain unauthorized access to the system or network. Sensitive functionality should always be protected with access controls. However configuring all but the most trivial access control systems can be very complicated and there are many opportunities for mistakes. If an attacker can learn of incorrectly configured access security settings, they may be able to exploit this in an attack."
  likelihood "High"
  severity "Medium"
  related_attack_patterns [
    capec_id "122"
    nature "ChildOf"
  ]
  related_attack_patterns [
    capec_id "17"
    nature "CanPrecede"
  ]
  prerequisites "_networkx_list_start"
  prerequisites "The target must apply access controls, but incorrectly configure them. However, not all incorrect configurations can be exploited by an attacker. If the incorrect configuration applies too little security to some functionality, then the attacker may be able to exploit it if the access control would be the only thing preventing an attacker's access and it no longer does so. If the incorrect configuration applies too much security, it must prevent legitimate activity and the attacker must be able to force others to require this activity.."
  skills_required "_networkx_list_start"
  skills_required [
    level "Low"
    description "In order to discover unrestricted resources, the attacker does not need special tools or skills. They only have to observe the resources or access mechanisms invoked as each action is performed and then try and access those access mechanisms directly."
  ]
  resources_required "_networkx_list_start"
  resources_required "None: No specialized resources are required to execute this type of attack."
  consequences [
    scope "_networkx_list_start"
    scope "Integrity"
    impact "Modify Data"
  ]
  consequences [
    scope "_networkx_list_start"
    scope "Confidentiality"
    impact "Read Data"
  ]
  consequences [
    scope "_networkx_list_start"
    scope "Authorization"
    impact "Execute Unauthorized Commands"
  ]
  consequences [
    scope "_networkx_list_start"
    scope "Authorization"
    impact "Gain Privileges"
  ]
  consequences [
    scope "Access Control"
    scope "Authorization"
    impact "Bypass Protection Mechanism"
  ]
  consequences [
    scope "_networkx_list_start"
    scope "Availability"
    impact "Unreliable Execution"
  ]
  mitigations "_networkx_list_start"
  mitigations "Design: Configure the access control correctly."
  example_instances "_networkx_list_start"
  example_instances "For example, an incorrectly configured Web server, may allow unauthorized access to it, thus threaten the security of the Web application."
  related_weaknesses "732"
  related_weaknesses "1190"
  related_weaknesses "1191"
  related_weaknesses "1193"
  related_weaknesses "1220"
  related_weaknesses "1268"
  related_weaknesses "1280"
  related_weaknesses "1297"
  related_weaknesses "1311"
  related_weaknesses "1315"
  related_weaknesses "1318"
  related_weaknesses "1320"
  related_weaknesses "1321"
  matched_cwes "1191"
  matched_cwes "732"
  matched_cwes "1220"
  taxonomy_mappings "_networkx_list_start"
  taxonomy_mappings [
    taxonomy_name "ATTACK"
    entry_id "1574.010"
    entry_name "Hijack Execution Flow: Services File Permissions Weaknesses"
  ]
  execution_flow [
    step "1"
    phase "Explore"
    description "[Survey] The attacker surveys the target application, possibly as a valid and authenticated user."
    techniques "Spider the web site for all available links."
    techniques "Brute force to guess all function names/action with different privileges."
  ]
  execution_flow [
    step "2"
    phase "Experiment"
    description "[Identify weak points in access control configurations] The attacker probes the access control for functions and data identified in the Explore phase to identify potential weaknesses in how the access controls are configured."
    techniques "The attacker attempts authenticated access to targeted functions and data."
    techniques "The attacker attempts unauthenticated access to targeted functions and data."
    techniques "The attacker attempts indirect and side channel access to targeted functions and data."
  ]
  execution_flow [
    step "3"
    phase "Exploit"
    description "[Access the function or data bypassing the access control] The attacker executes the function or accesses the data identified in the Explore phase bypassing the access control."
    techniques "_networkx_list_start"
    techniques "The attacker executes the function or accesses the data not authorized to them."
  ]
  node [
    id 0
    label "survey_the_target_application"
  ]
  node [
    id 1
    label "spider_the_web_site_for_all_available_links"
  ]
  node [
    id 2
    label "guess_all_function_names"
  ]
  node [
    id 3
    label "identify_weak_points_in_access_control_configurations"
  ]
  node [
    id 4
    label "probe_the_access_control_for_functions_and_data_identified_in_the_explore_phase"
  ]
  node [
    id 5
    label "authenticate_access_to_targeted_functions_and_data"
  ]
  node [
    id 6
    label "attempt_indirect_and_side_channel_access_to_targeted_functions_and_data"
  ]
  node [
    id 7
    label "access_the_function_or_data_bypassing_the_access_control"
  ]
  node [
    id 8
    label "execute_the_function"
  ]
  node [
    id 9
    label "apply_access_controls"
  ]
  node [
    id 10
    label "exploit_not_all_incorrect_configurations"
  ]
  node [
    id 11
    label "apply_too_little_security"
  ]
  edge [
    source 0
    target 1
  ]
  edge [
    source 1
    target 2
  ]
  edge [
    source 2
    target 3
  ]
  edge [
    source 3
    target 4
  ]
  edge [
    source 4
    target 5
  ]
  edge [
    source 5
    target 5
  ]
  edge [
    source 5
    target 6
  ]
  edge [
    source 6
    target 7
  ]
  edge [
    source 7
    target 8
  ]
  edge [
    source 8
    target 8
  ]
  edge [
    source 8
    target 9
  ]
  edge [
    source 9
    target 10
  ]
  edge [
    source 10
    target 11
  ]
  edge [
    source 11
    target 11
  ]
]
