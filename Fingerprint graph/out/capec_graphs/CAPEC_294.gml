graph [
  directed 1
  capec_id "294"
  name "ICMP Address Mask Request"
  abstraction "Detailed"
  status "Stable"
  description "An adversary sends an ICMP Type 17 Address Mask Request to gather information about a target's networking configuration. ICMP Address Mask Requests are defined by RFC-950, &#34;Internet Standard Subnetting Procedure.&#34; An Address Mask Request is an ICMP type 17 message that triggers a remote system to respond with a list of its related subnets, as well as its default gateway and broadcast address via an ICMP type 18 Address Mask Reply datagram. Gathering this type of information helps the adversary plan router-based attacks as well as denial-of-service attacks against the broadcast address."
  likelihood ""
  severity "Low"
  related_attack_patterns "_networkx_list_start"
  related_attack_patterns [
    capec_id "292"
    nature "ChildOf"
  ]
  prerequisites "_networkx_list_start"
  prerequisites "The ability to send an ICMP type 17 query (Address Mask Request) to a remote target and receive an ICMP type 18 message (ICMP Address Mask Reply) in response. Generally, modern operating systems will ignore ICMP type 17 messages, however, routers will commonly respond to this request."
  skills_required "[]"
  resources_required "_networkx_list_start"
  resources_required "The ability to send custom ICMP queries. This can be accomplished via the use of various scanners or utilities."
  consequences [
    scope "_networkx_list_start"
    scope "Confidentiality"
    impact "Other"
  ]
  consequences [
    scope "Confidentiality"
    scope "Access Control"
    scope "Authorization"
    impact "Hide Activities"
  ]
  mitigations "[]"
  example_instances "[]"
  related_weaknesses "_networkx_list_start"
  related_weaknesses "200"
  matched_cwes "_networkx_list_start"
  matched_cwes "200"
  taxonomy_mappings "[]"
  execution_flow "[]"
  node [
    id 0
    label "send_an_icmp_type_17_query_address_mask_request"
  ]
  node [
    id 1
    label "ignore_icmp_type"
  ]
  edge [
    source 0
    target 1
  ]
]
