graph [
  directed 1
  capec_id "305"
  name "TCP ACK Scan"
  abstraction "Detailed"
  status "Stable"
  description "An adversary uses TCP ACK segments to gather information about firewall or ACL configuration. The purpose of this type of scan is to discover information about filter configurations rather than port state. This type of scanning is rarely useful alone, but when combined with SYN scanning, gives a more complete picture of the type of firewall rules that are present."
  likelihood ""
  severity "Low"
  related_attack_patterns "_networkx_list_start"
  related_attack_patterns [
    capec_id "300"
    nature "ChildOf"
  ]
  prerequisites "_networkx_list_start"
  prerequisites "The adversary requires logical access to the target network. ACK scanning requires the use of raw sockets, and thus cannot be performed from some Windows systems (Windows XP SP 2, for example). On Unix and Linux, raw socket manipulations require root privileges."
  skills_required "[]"
  resources_required "_networkx_list_start"
  resources_required "This attack can be achieved via the use of a network mapper or scanner, or via raw socket programming in a scripting language. Packet injection tools are also useful for this purpose. Depending upon the method used it may be necessary to sniff the network in order to see the response."
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
  mitigations "[]"
  example_instances "[]"
  related_weaknesses "_networkx_list_start"
  related_weaknesses "200"
  matched_cwes "_networkx_list_start"
  matched_cwes "200"
  taxonomy_mappings "[]"
  execution_flow [
    step "1"
    phase "Experiment"
    description "An adversary sends TCP packets with the ACK flag set and that are not associated with an existing connection to target ports."
    techniques "[]"
  ]
  execution_flow [
    step "2"
    phase "Experiment"
    description "An adversary uses the response from the target to determine the port's state. If a RST packet is received the target port is either closed or the ACK was sent out-of-sync. If no response is received, the target is likely using a stateful firewall."
    techniques "[]"
  ]
  node [
    id 0
    label "send_tcp_packets_with_the_ack_flag_set"
  ]
  node [
    id 1
    label "determine_the_port_s_state"
  ]
  node [
    id 2
    label "receive_the_target_port"
  ]
  node [
    id 3
    label "receive_no_response"
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
