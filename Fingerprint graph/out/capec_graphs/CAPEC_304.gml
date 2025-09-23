graph [
  directed 1
  capec_id "304"
  name "TCP Null Scan"
  abstraction "Detailed"
  status "Stable"
  description "An adversary uses a TCP NULL scan to determine if ports are closed on the target machine. This scan type is accomplished by sending TCP segments with no flags in the packet header, generating packets that are illegal based on RFC 793. The RFC 793 expected behavior is that any TCP segment with an out-of-state Flag sent to an open port is discarded, whereas segments with out-of-state flags sent to closed ports should be handled with a RST in response. This behavior should allow an attacker to scan for closed ports by sending certain types of rule-breaking packets (out of sync or disallowed by the TCB) and detect closed ports via RST packets."
  likelihood ""
  severity "Low"
  related_attack_patterns "_networkx_list_start"
  related_attack_patterns [
    capec_id "300"
    nature "ChildOf"
  ]
  prerequisites "_networkx_list_start"
  prerequisites "The adversary requires logical access to the target network. NULL scanning requires the use of raw sockets, and thus cannot be performed from some Windows systems (Windows XP SP 2, for example). On Unix and Linux, raw socket manipulations require root privileges."
  skills_required "[]"
  resources_required "_networkx_list_start"
  resources_required "This attack can be carried out via a network mapper/scanner, or via raw socket programming in a scripting language. Packet injection tools are also useful for this purpose. Depending upon the method used it may be necessary to sniff the network in order to see the response."
  consequences [
    scope "_networkx_list_start"
    scope "Confidentiality"
    impact "Other"
  ]
  consequences [
    scope "Confidentiality"
    scope "Access Control"
    scope "Authorization"
    impact "Bypass Protection Mechanism"
  ]
  mitigations "_networkx_list_start"
  mitigations "Employ a robust network defensive posture that includes a managed IDS/IPS."
  example_instances "[]"
  related_weaknesses "_networkx_list_start"
  related_weaknesses "200"
  matched_cwes "_networkx_list_start"
  matched_cwes "200"
  taxonomy_mappings "[]"
  execution_flow [
    step "1"
    phase "Experiment"
    description "An adversary sends TCP packets with no flags set and that are not associated with an existing connection to target ports."
    techniques "[]"
  ]
  execution_flow [
    step "2"
    phase "Experiment"
    description "An adversary uses the response from the target to determine the port's state. If no response is received the port is open. If a RST packet is received then the port is closed."
    techniques "[]"
  ]
  node [
    id 0
    label "send_tcp_packets"
  ]
  node [
    id 1
    label "determine_the_port_s_state"
  ]
  node [
    id 2
    label "receive_no_response"
  ]
  node [
    id 3
    label "receive_a_rst_packet"
  ]
  node [
    id 4
    label "require_logical_access_to_the_target_network"
  ]
  node [
    id 5
    label "require_root_privileges"
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
]
