graph [
  directed 1
  capec_id "285"
  name "ICMP Echo Request Ping"
  abstraction "Detailed"
  status "Stable"
  description "An adversary sends out an ICMP Type 8 Echo Request, commonly known as a 'Ping', in order to determine if a target system is responsive. If the request is not blocked by a firewall or ACL, the target host will respond with an ICMP Type 0 Echo Reply datagram. This type of exchange is usually referred to as a 'Ping' due to the Ping utility present in almost all operating systems. Ping, as commonly implemented, allows a user to test for alive hosts, measure round-trip time, and measure the percentage of packet loss."
  likelihood "Medium"
  severity "Low"
  related_attack_patterns "_networkx_list_start"
  related_attack_patterns [
    capec_id "292"
    nature "ChildOf"
  ]
  prerequisites "_networkx_list_start"
  prerequisites "The ability to send an ICMP type 8 query (Echo Request) to a remote target and receive an ICMP type 0 message (ICMP Echo Reply) in response. Any firewalls or access control lists between the sender and receiver must allow ICMP Type 8 and ICMP Type 0 messages in order for a ping operation to succeed."
  skills_required "_networkx_list_start"
  skills_required [
    level "Low"
    description "The adversary needs to know certain linux commands for this type of attack."
  ]
  resources_required "_networkx_list_start"
  resources_required "Scanners or utilities that provide the ability to send custom ICMP queries."
  consequences "_networkx_list_start"
  consequences [
    scope "_networkx_list_start"
    scope "Confidentiality"
    impact "Other"
  ]
  mitigations "_networkx_list_start"
  mitigations "Consider configuring firewall rules to block ICMP Echo requests and prevent replies. If not practical, monitor and consider action when a system has fast and a repeated pattern of requests that move incrementally through port numbers."
  example_instances "[]"
  related_weaknesses "_networkx_list_start"
  related_weaknesses "200"
  matched_cwes "_networkx_list_start"
  matched_cwes "200"
  taxonomy_mappings "[]"
  execution_flow "[]"
  node [
    id 0
    label "send_an_icmp_type_8_query_echo_request"
  ]
  node [
    id 1
    label "allow_icmp_type_8_and_icmp_type_0_messages"
  ]
  edge [
    source 0
    target 1
  ]
]
