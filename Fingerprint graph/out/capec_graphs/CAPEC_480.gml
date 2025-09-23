graph [
  directed 1
  capec_id "480"
  name "Escaping Virtualization"
  abstraction "Standard"
  status "Draft"
  description "An adversary gains access to an application, service, or device with the privileges of an authorized or privileged user by escaping the confines of a virtualized environment. The adversary is then able to access resources or execute unauthorized code within the host environment, generally with the privileges of the user running the virtualized process. Successfully executing an attack of this type is often the first step in executing more complex attacks."
  likelihood "Low"
  severity "Very High"
  related_attack_patterns "_networkx_list_start"
  related_attack_patterns [
    capec_id "115"
    nature "ChildOf"
  ]
  prerequisites "[]"
  skills_required "[]"
  resources_required "[]"
  consequences [
    scope "Access Control"
    scope "Authorization"
    impact "Bypass Protection Mechanism"
  ]
  consequences [
    scope "_networkx_list_start"
    scope "Authorization"
    impact "Execute Unauthorized Commands"
  ]
  consequences [
    scope "Accountability"
    scope "Authentication"
    scope "Authorization"
    scope "Non-Repudiation"
    impact "Gain Privileges"
  ]
  mitigations "Ensure virtualization software is current and up-to-date."
  mitigations "Abide by the least privilege principle to avoid assigning users more privileges than necessary."
  example_instances "[]"
  related_weaknesses "_networkx_list_start"
  related_weaknesses "693"
  matched_cwes "_networkx_list_start"
  matched_cwes "693"
  taxonomy_mappings "_networkx_list_start"
  taxonomy_mappings [
    taxonomy_name "ATTACK"
    entry_id "1611"
    entry_name "Escape to Host"
  ]
  execution_flow [
    step "1"
    phase "Explore"
    description "[Probing] The adversary probes the target application, service, or device to find a possible weakness that would allow escaping the virtualized environment."
    techniques "_networkx_list_start"
    techniques "Probing applications, services, or devices for virtualization weaknesses."
  ]
  execution_flow [
    step "2"
    phase "Experiment"
    description "[Verify the exploitable security weaknesses] Using the found weakness, the adversary attempts to escape the virtualized environment."
    techniques "_networkx_list_start"
    techniques "Using an application weakness to escape a virtualized environment"
  ]
  execution_flow [
    step "3"
    phase "Exploit"
    description "[Execute more complex attacks] Once outside of the virtualized environment, the adversary attempts to perform other more complex attacks such as accessing system resources or executing unauthorized code within the host environment."
    techniques "_networkx_list_start"
    techniques "Executing complex attacks when given higher permissions by escaping a virtualized environment"
  ]
  node [
    id 0
    label "verify_the_exploitable_security_weaknesses"
  ]
  node [
    id 1
    label "escape_a_virtualized_environment"
  ]
  node [
    id 2
    label "execute_more_complex_attacks"
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
    target 2
  ]
]
