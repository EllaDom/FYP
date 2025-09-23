graph [
  directed 1
  capec_id "157"
  name "Sniffing Attacks"
  abstraction "Standard"
  status "Draft"
  description "In this attack pattern, the adversary intercepts information transmitted between two third parties. The adversary must be able to observe, read, and/or hear the communication traffic, but not necessarily block the communication or change its content. Any transmission medium can theoretically be sniffed if the adversary can examine the contents between the sender and recipient. Sniffing Attacks are similar to Adversary-In-The-Middle attacks (CAPEC-94), but are entirely passive. AiTM attacks are predominantly active and often alter the content of the communications themselves."
  likelihood ""
  severity "Medium"
  related_attack_patterns [
    capec_id "117"
    nature "ChildOf"
  ]
  related_attack_patterns [
    capec_id "652"
    nature "CanPrecede"
  ]
  prerequisites "_networkx_list_start"
  prerequisites "The target data stream must be transmitted on a medium to which the adversary has access."
  skills_required "[]"
  resources_required "_networkx_list_start"
  resources_required "The adversary must be able to intercept the transmissions containing the data of interest. Depending on the medium of transmission and the path the data takes between the sender and recipient, the adversary may require special equipment and/or require that this equipment be placed in specific locations (e.g., a network sniffing tool)"
  consequences "_networkx_list_start"
  consequences [
    scope "_networkx_list_start"
    scope "Confidentiality"
    impact "Read Data"
  ]
  mitigations "_networkx_list_start"
  mitigations "Encrypt sensitive information when transmitted on insecure mediums to prevent interception."
  example_instances "[]"
  related_weaknesses "_networkx_list_start"
  related_weaknesses "311"
  matched_cwes "_networkx_list_start"
  matched_cwes "311"
  taxonomy_mappings "[]"
  execution_flow [
    step "1"
    phase "Explore"
    description "[Determine Communication Mechanism] The adversary determines the nature and mechanism of communication between two components, looking for opportunities to exploit."
    techniques "_networkx_list_start"
    techniques "Look for application documentation that might describe a communication mechanism used by a target."
  ]
  execution_flow [
    step "2"
    phase "Experiment"
    description "[Position In Between Targets] The adversary positions themselves somewhere in the middle of the two components. If the communication is encrypted, the adversary will need to act as a proxy and route traffic between the components, exploiting a flaw in the encryption mechanism. Otherwise, the adversary can just observe the communication at either end."
    techniques "Use Wireshark or some other packet capturing tool to capture traffic on a network."
    techniques "Install spyware on a client that will intercept outgoing packets and route them to their destination as well as route incoming packets back to the client."
    techniques "Exploit a weakness in an encrypted communication mechanism to gain access to traffic. Look for outdated mechanisms such as SSL."
  ]
  execution_flow [
    step "3"
    phase "Exploit"
    description "[Listen to Communication] The adversary observes communication, but does not alter or block it. The adversary gains access to sensitive information and can potentially utilize this information in a malicious way."
    techniques "[]"
  ]
  node [
    id 0
    label "determine_the_nature_and_mechanism_of_communication_between_two_components"
  ]
  node [
    id 1
    label "position_themselves"
  ]
  node [
    id 2
    label "encrypt_the_communication"
  ]
  node [
    id 3
    label "observe_communication_and_inputs"
  ]
  node [
    id 4
    label "capture_traffic"
  ]
  node [
    id 5
    label "intercept_outgoing_packets"
  ]
  node [
    id 6
    label "exploit_a_weakness_in_an_encrypted_communication_mechanism_to_gain_access_to_traffic"
  ]
  node [
    id 7
    label "gain_access_to_sensitive_information"
  ]
  node [
    id 8
    label "transmit_data"
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
    source 3
    target 7
  ]
  edge [
    source 4
    target 5
  ]
  edge [
    source 5
    target 6
  ]
  edge [
    source 6
    target 3
  ]
  edge [
    source 7
    target 8
  ]
]
