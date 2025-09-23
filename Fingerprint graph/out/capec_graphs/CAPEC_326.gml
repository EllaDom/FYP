graph [
  directed 1
  capec_id "326"
  name "TCP Initial Window Size Probe"
  abstraction "Detailed"
  status "Stable"
  description "This OS fingerprinting probe checks the initial TCP Window size. TCP stacks limit the range of sequence numbers allowable within a session to maintain the &#34;connected&#34; state within TCP protocol logic. The initial window size specifies a range of acceptable sequence numbers that will qualify as a response to an ACK packet within a session. Various operating systems use different Initial window sizes. The initial window size can be sampled by establishing an ordinary TCP connection."
  likelihood "Medium"
  severity "Low"
  related_attack_patterns "_networkx_list_start"
  related_attack_patterns [
    capec_id "312"
    nature "ChildOf"
  ]
  prerequisites "_networkx_list_start"
  prerequisites "The ability to monitor and interact with network communications.Access to at least one host, and the privileges to interface with the network interface card."
  skills_required "[]"
  resources_required "_networkx_list_start"
  resources_required "A tool capable of sending and receiving packets from a remote system."
  consequences [
    scope "_networkx_list_start"
    scope "Confidentiality"
    impact "Read Data"
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
  execution_flow "[]"
]
