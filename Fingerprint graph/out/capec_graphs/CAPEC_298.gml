graph [
  directed 1
  capec_id "298"
  name "UDP Ping"
  abstraction "Detailed"
  status "Stable"
  description "An adversary sends a UDP datagram to the remote host to determine if the host is alive. If a UDP datagram is sent to an open UDP port there is very often no response, so a typical strategy for using a UDP ping is to send the datagram to a random high port on the target. The goal is to solicit an 'ICMP port unreachable' message from the target, indicating that the host is alive. UDP pings are useful because some firewalls are not configured to block UDP datagrams sent to strange or typically unused ports, like ports in the 65K range. Additionally, while some firewalls may filter incoming ICMP, weaknesses in firewall rule-sets may allow certain types of ICMP (host unreachable, port unreachable) which are useful for UDP ping attempts."
  likelihood ""
  severity "Low"
  related_attack_patterns "_networkx_list_start"
  related_attack_patterns [
    capec_id "292"
    nature "ChildOf"
  ]
  prerequisites "The adversary requires the ability to send a UDP datagram to a remote host and receive a response."
  prerequisites "The adversary requires the ability to craft custom UDP Packets for use during network reconnaissance."
  prerequisites "The target's firewall must not be configured to block egress ICMP messages."
  skills_required "[]"
  resources_required "_networkx_list_start"
  resources_required "UDP pings can be performed via the use of a port scanner or by raw socket manipulation using a scripting or programming language. Packet injection tools are also useful for this purpose. Depending upon the technique used it may also be necessary to sniff the network in order to see the response."
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
  mitigations "Configure your firewall to block egress ICMP messages."
  example_instances "[]"
  related_weaknesses "_networkx_list_start"
  related_weaknesses "200"
  matched_cwes "_networkx_list_start"
  matched_cwes "200"
  taxonomy_mappings "[]"
  execution_flow "[]"
  node [
    id 0
    label "require_the_ability_to_send_a_udp_datagram_to_a_remote_host_and_receive_a_response"
  ]
  node [
    id 1
    label "require_the_ability_to_craft_custom_tcp_ack_segments_for_use_during_network_reconnaissance"
  ]
  node [
    id 2
    label "configure_the_target_s_firewall"
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
