graph [
  directed 1
  capec_id "313"
  name "Passive OS Fingerprinting"
  abstraction "Standard"
  status "Stable"
  description "An adversary engages in activity to detect the version or type of OS software in a an environment by passively monitoring communication between devices, nodes, or applications. Passive techniques for operating system detection send no actual probes to a target, but monitor network or client-server communication between nodes in order to identify operating systems based on observed behavior as compared to a database of known signatures or values. While passive OS fingerprinting is not usually as reliable as active methods, it is generally better able to evade detection."
  likelihood "High"
  severity "Low"
  related_attack_patterns "_networkx_list_start"
  related_attack_patterns [
    capec_id "224"
    nature "ChildOf"
  ]
  prerequisites "_networkx_list_start"
  prerequisites "The ability to monitor network communications.Access to at least one host, and the privileges to interface with the network interface card."
  skills_required "[]"
  resources_required "_networkx_list_start"
  resources_required "Any tool capable of monitoring network communications, like a packet sniffer (e.g., Wireshark)"
  consequences [
    scope "_networkx_list_start"
    scope "Confidentiality"
    impact "Read Data"
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
  taxonomy_mappings "_networkx_list_start"
  taxonomy_mappings [
    taxonomy_name "ATTACK"
    entry_id "1082"
    entry_name "System Information Discovery"
  ]
  execution_flow "[]"
  node [
    id 0
    label "monitor_network_communications"
  ]
]
