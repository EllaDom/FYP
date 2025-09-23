graph [
  directed 1
  capec_id "301"
  name "TCP Connect Scan"
  abstraction "Detailed"
  status "Stable"
  description "An adversary uses full TCP connection attempts to determine if a port is open on the target system. The scanning process involves completing a 'three-way handshake' with a remote port, and reports the port as closed if the full handshake cannot be established. An advantage of TCP connect scanning is that it works against any TCP/IP stack."
  likelihood ""
  severity "Low"
  related_attack_patterns "_networkx_list_start"
  related_attack_patterns [
    capec_id "300"
    nature "ChildOf"
  ]
  prerequisites "_networkx_list_start"
  prerequisites "The adversary requires logical access to the target network. The TCP connect Scan requires the ability to connect to an available port and complete a 'three-way-handshake' This scanning technique does not require any special privileges in order to perform. This type of scan works against all TCP/IP stack implementations."
  skills_required "[]"
  resources_required "_networkx_list_start"
  resources_required "The adversary can leverage a network mapper or scanner, or perform this attack via routine socket programming in a scripting language. Packet injection tools are also useful for this purpose. Depending upon the method used it may be necessary to sniff the network to see the response."
  consequences "_networkx_list_start"
  consequences [
    scope "_networkx_list_start"
    scope "Confidentiality"
    impact "Read Data"
  ]
  mitigations "_networkx_list_start"
  mitigations "Employ a robust network defense posture that includes an IDS/IPS system."
  example_instances "[]"
  related_weaknesses "_networkx_list_start"
  related_weaknesses "200"
  matched_cwes "_networkx_list_start"
  matched_cwes "200"
  taxonomy_mappings "[]"
  execution_flow [
    step "1"
    phase "Experiment"
    description "An adversary attempts to initialize a TCP connection with with the target port."
    techniques "[]"
  ]
  execution_flow [
    step "2"
    phase "Experiment"
    description "An adversary uses the result of their TCP connection to determine the state of the target port. A successful connection indicates a port is open with a service listening on it while a failed connection indicates the port is not open."
    techniques "[]"
  ]
  node [
    id 0
    label "attempt_to_initialize_a_tcp_connection_with_with_the_target_port"
  ]
  node [
    id 1
    label "determine_the_port_s_state"
  ]
  node [
    id 2
    label "require_logical_access_to_the_target_network"
  ]
  node [
    id 3
    label "require_the_ability_to_connect_to_an_available_port_and_complete_a_three_way_handshake_this_scanning_technique_does_not_require_any_special_privileges_in_order_to_perform"
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
]
