graph [
  directed 1
  capec_id "308"
  name "UDP Scan"
  abstraction "Detailed"
  status "Stable"
  description "An adversary engages in UDP scanning to gather information about UDP port status on the target system. UDP scanning methods involve sending a UDP datagram to the target port and looking for evidence that the port is closed. Open UDP ports usually do not respond to UDP datagrams as there is no stateful mechanism within the protocol that requires building or establishing a session. Responses to UDP datagrams are therefore application specific and cannot be relied upon as a method of detecting an open port. UDP scanning relies heavily upon ICMP diagnostic messages in order to determine the status of a remote port."
  likelihood ""
  severity "Low"
  related_attack_patterns "_networkx_list_start"
  related_attack_patterns [
    capec_id "300"
    nature "ChildOf"
  ]
  prerequisites "_networkx_list_start"
  prerequisites "The ability to send UDP datagrams to a host and receive ICMP error messages from that host. In cases where particular types of ICMP messaging is disallowed, the reliability of UDP scanning drops off sharply."
  skills_required "[]"
  resources_required "_networkx_list_start"
  resources_required "The ability to craft custom UDP Packets for use during network reconnaissance. This can be accomplished via the use of a port scanner, or via socket manipulation in a programming or scripting language. Packet injection tools are also useful. It is also necessary to trap ICMP diagnostic messages during this process. Depending upon the method used it may be necessary to sniff the network in order to see the response."
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
  mitigations "Firewalls or ACLs which block egress ICMP error types effectively prevent UDP scans from returning any useful information."
  mitigations "UDP scanning is complicated by rate limiting mechanisms governing ICMP error messages."
  example_instances "[]"
  related_weaknesses "_networkx_list_start"
  related_weaknesses "200"
  matched_cwes "_networkx_list_start"
  matched_cwes "200"
  taxonomy_mappings "[]"
  execution_flow [
    step "1"
    phase "Experiment"
    description "An adversary sends UDP packets to target ports."
    techniques "[]"
  ]
  execution_flow [
    step "2"
    phase "Experiment"
    description "An adversary uses the response from the target to determine the port's state. Whether a port responds to a UDP packet is dependant on what application is listening on that port. No response does not indicate the port is not open."
    techniques "[]"
  ]
  node [
    id 0
    label "send_udp_packets"
  ]
  node [
    id 1
    label "determine_the_port_s_state"
  ]
  node [
    id 2
    label "message_icmp"
  ]
  edge [
    source 0
    target 1
  ]
  edge [
    source 0
    target 2
  ]
  edge [
    source 1
    target 0
  ]
]
