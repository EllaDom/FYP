graph [
  directed 1
  capec_id "297"
  name "TCP ACK Ping"
  abstraction "Detailed"
  status "Stable"
  description "An adversary sends a TCP segment with the ACK flag set to a remote host for the purpose of determining if the host is alive. This is one of several TCP 'ping' types. The RFC 793 expected behavior for a service is to respond with a RST 'reset' packet to any unsolicited ACK segment that is not part of an existing connection. So by sending an ACK segment to a port, the adversary can identify that the host is alive by looking for a RST packet. Typically, a remote server will respond with a RST regardless of whether a port is open or closed. In this way, TCP ACK pings cannot discover the state of a remote port because the behavior is the same in either case. The firewall will look up the ACK packet in its state-table and discard the segment because it does not correspond to any active connection. A TCP ACK Ping can be used to discover if a host is alive via RST response packets sent from the host."
  likelihood ""
  severity "Low"
  related_attack_patterns "_networkx_list_start"
  related_attack_patterns [
    capec_id "292"
    nature "ChildOf"
  ]
  prerequisites "The ability to send an ACK packet to a remote host and identify the response. Creating the ACK packet without building a full connection requires the use of raw sockets. As a result, it is not possible to send a TCP ACK ping from some systems (Windows XP SP 2) without the use of third-party packet drivers like Winpcap. On other systems (BSD, Linux) administrative privileges are required in order to write to the raw socket."
  prerequisites "The target must employ a stateless firewall that lacks a rule set that rejects unsolicited ACK packets."
  prerequisites "The adversary requires the ability to craft custom TCP ACK segments for use during network reconnaissance. Sending an ACK ping requires the ability to access &#34;raw sockets&#34; in order to create the packets with direct access to the packet header."
  skills_required "[]"
  resources_required "_networkx_list_start"
  resources_required "ACK scanning can be performed via the use of a port scanner or by raw socket manipulation using a scripting or programming language. Packet injection tools are also useful for this purpose. Depending upon the technique used it may also be necessary to sniff the network in order to see the response."
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
  mitigations "Leverage stateful firewalls that allow for the rejection of a packet that is not part of an existing connection."
  example_instances "[]"
  related_weaknesses "_networkx_list_start"
  related_weaknesses "200"
  matched_cwes "_networkx_list_start"
  matched_cwes "200"
  taxonomy_mappings "[]"
  execution_flow "[]"
  node [
    id 0
    label "send_tcp_packets_with_the_ack_flag_set"
  ]
  node [
    id 1
    label "create_the_ack"
  ]
  node [
    id 2
    label "send_a_tcp_ack_ping_from_some_systems"
  ]
  node [
    id 3
    label "require_bsd_linux_administrative_privileges"
  ]
  node [
    id 4
    label "employ_a_stateless_firewall_that_lacks_a_rule_set_that_rejects_unsolicited_ack_packets"
  ]
  node [
    id 5
    label "require_the_ability_to_craft_custom_tcp_ack_segments_for_use_during_network_reconnaissance"
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
    target 2
  ]
]
