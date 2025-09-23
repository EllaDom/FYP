graph [
  directed 1
  capec_id "287"
  name "TCP SYN Scan"
  abstraction "Detailed"
  status "Stable"
  description "An adversary uses a SYN scan to determine the status of ports on the remote target. SYN scanning is the most common type of port scanning that is used because of its many advantages and few drawbacks. As a result, novice attackers tend to overly rely on the SYN scan while performing system reconnaissance. As a scanning method, the primary advantages of SYN scanning are its universality and speed."
  likelihood ""
  severity "Low"
  related_attack_patterns "_networkx_list_start"
  related_attack_patterns [
    capec_id "300"
    nature "ChildOf"
  ]
  prerequisites "_networkx_list_start"
  prerequisites "This scan type is not possible with some operating systems (Windows XP SP 2). On Linux and Unix systems it requires root privileges to use raw sockets."
  skills_required "[]"
  resources_required "_networkx_list_start"
  resources_required "The ability to send TCP SYN segments to a host during network reconnaissance via the use of a network mapper or scanner, or via raw socket programming in a scripting language. Packet injection tools are also useful for this purpose. Depending upon the method used it may be necessary to sniff the network in order to see the response."
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
    description "An adversary sends SYN packets to ports they want to scan and checks the response without completing the TCP handshake."
    techniques "[]"
  ]
  execution_flow [
    step "2"
    phase "Experiment"
    description "An adversary uses the response from the target to determine the port's state. The adversary can determine the state of a port based on the following responses. When a SYN is sent to an open port and unfiltered port, a SYN/ACK will be generated. When a SYN packet is sent to a closed port a RST is generated, indicating the port is closed. When SYN scanning to a particular port generates no response, or when the request triggers ICMP Type 3 unreachable errors, the port is filtered."
    techniques "[]"
  ]
  node [
    id 0
    label "send_syn_packets"
  ]
  node [
    id 1
    label "determine_the_port_s_state"
  ]
  node [
    id 2
    label "determine_the_state_of_a_port_based_on_the_following_responses"
  ]
  node [
    id 3
    label "require_root_privileges"
  ]
  edge [
    source 0
    target 1
  ]
  edge [
    source 0
    target 0
  ]
  edge [
    source 0
    target 3
  ]
  edge [
    source 1
    target 2
  ]
  edge [
    source 2
    target 0
  ]
]
