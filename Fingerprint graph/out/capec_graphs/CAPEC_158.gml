graph [
  directed 1
  capec_id "158"
  name "Sniffing Network Traffic"
  abstraction "Detailed"
  status "Draft"
  description "In this attack pattern, the adversary monitors network traffic between nodes of a public or multicast network in an attempt to capture sensitive information at the protocol level. Network sniffing applications can reveal TCP/IP, DNS, Ethernet, and other low-level network communication information. The adversary takes a passive role in this attack pattern and simply observes and analyzes the traffic. The adversary may precipitate or indirectly influence the content of the observed transaction, but is never the intended recipient of the target information."
  likelihood ""
  severity "Medium"
  related_attack_patterns "_networkx_list_start"
  related_attack_patterns [
    capec_id "157"
    nature "ChildOf"
  ]
  prerequisites "The target must be communicating on a network protocol visible by a network sniffing application."
  prerequisites "The adversary must obtain a logical position on the network from intercepting target network traffic is possible. Depending on the network topology, traffic sniffing may be simple or challenging. If both the target sender and target recipient are members of a single subnet, the adversary must also be on that subnet in order to see their traffic communication."
  skills_required "_networkx_list_start"
  skills_required [
    level "Low"
    description "Adversaries can obtain and set up open-source network sniffing tools easily."
  ]
  resources_required "_networkx_list_start"
  resources_required "A tool with the capability of presenting network communication traffic (e.g., Wireshark, tcpdump, Cain and Abel, etc.)."
  consequences "_networkx_list_start"
  consequences [
    scope "_networkx_list_start"
    scope "Confidentiality"
    impact "Read Data"
  ]
  mitigations "Obfuscate network traffic through encryption to prevent its readability by network sniffers."
  mitigations "Employ appropriate levels of segmentation to your network in accordance with best practices."
  example_instances "[]"
  related_weaknesses "_networkx_list_start"
  related_weaknesses "311"
  matched_cwes "_networkx_list_start"
  matched_cwes "311"
  taxonomy_mappings [
    taxonomy_name "ATTACK"
    entry_id "1040"
    entry_name "Network Sniffing"
  ]
  taxonomy_mappings [
    taxonomy_name "ATTACK"
    entry_id "1111"
    entry_name "Multi-Factor Authentication Interception"
  ]
  execution_flow "[]"
  node [
    id 0
    label "obtain_a_logical_position_on_the_network"
  ]
]
