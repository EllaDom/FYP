graph [
  directed 1
  capec_id "307"
  name "TCP RPC Scan"
  abstraction "Detailed"
  status "Stable"
  description "An adversary scans for RPC services listing on a Unix/Linux host."
  likelihood ""
  severity "Low"
  related_attack_patterns "_networkx_list_start"
  related_attack_patterns [
    capec_id "300"
    nature "ChildOf"
  ]
  prerequisites "_networkx_list_start"
  prerequisites "RPC scanning requires no special privileges when it is performed via a native system utility."
  skills_required "[]"
  resources_required "_networkx_list_start"
  resources_required "The ability to craft custom RPC datagrams for use during network reconnaissance via native OS utilities or a port scanning tool. By tailoring the bytes injected one can scan for specific RPC-registered services. Depending upon the method used it may be necessary to sniff the network in order to see the response."
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
  mitigations "Typically, an IDS/IPS system is very effective against this type of attack."
  example_instances "[]"
  related_weaknesses "_networkx_list_start"
  related_weaknesses "200"
  matched_cwes "_networkx_list_start"
  matched_cwes "200"
  taxonomy_mappings "[]"
  execution_flow [
    step "1"
    phase "Experiment"
    description "An adversary sends RCP packets to target ports."
    techniques "[]"
  ]
  execution_flow [
    step "2"
    phase "Experiment"
    description "An adversary uses the response from the target to determine which, if any, RPC service is running on that port. Responses will vary based on which RPC service is running."
    techniques "[]"
  ]
  node [
    id 0
    label "send_tcp_packets"
  ]
]
