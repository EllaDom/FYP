graph [
  directed 1
  capec_id "296"
  name "ICMP Information Request"
  abstraction "Detailed"
  status "Stable"
  description "An adversary sends an ICMP Information Request to a host to determine if it will respond to this deprecated mechanism. ICMP Information Requests are a deprecated message type. Information Requests were originally used for diskless machines to automatically obtain their network configuration, but this message type has been superseded by more robust protocol implementations like DHCP."
  likelihood ""
  severity "Low"
  related_attack_patterns "_networkx_list_start"
  related_attack_patterns [
    capec_id "292"
    nature "ChildOf"
  ]
  prerequisites "_networkx_list_start"
  prerequisites "The ability to send an ICMP Type 15 Information Request and receive an ICMP Type 16 Information Reply in response."
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
    label "send_an_icmp_type_13_timestamp_request"
  ]
]
