graph [
  directed 1
  capec_id "668"
  name "Key Negotiation of Bluetooth Attack (KNOB)"
  abstraction "Standard"
  status "Draft"
  description "An adversary can exploit a flaw in Bluetooth key negotiation allowing them to decrypt information sent between two devices communicating via Bluetooth. The adversary uses an Adversary in the Middle setup to modify packets sent between the two devices during the authentication process, specifically the entropy bits. Knowledge of the number of entropy bits will allow the attacker to easily decrypt information passing over the line of communication."
  likelihood "Low"
  severity "High"
  related_attack_patterns [
    capec_id "115"
    nature "ChildOf"
  ]
  related_attack_patterns [
    capec_id "148"
    nature "CanPrecede"
  ]
  prerequisites "_networkx_list_start"
  prerequisites "Person in the Middle network setup."
  skills_required "_networkx_list_start"
  skills_required [
    level "Medium"
    description "Ability to modify packets."
  ]
  resources_required "_networkx_list_start"
  resources_required "Bluetooth adapter, packet capturing capabilities."
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
  consequences [
    scope "_networkx_list_start"
    scope "Integrity"
    impact "Modify Data"
  ]
  mitigations "_networkx_list_start"
  mitigations "Newer Bluetooth firmwares ensure that the KNOB is not negotaited in plaintext. Update your device."
  example_instances "_networkx_list_start"
  example_instances "Given users Alice, Bob and Charlie (Charlie being the attacker), Alice and Bob begin to agree on an encryption key when connecting. While Alice sends a message to Bob that an encryption key with 16 bytes of entropy should be used, Charlie changes this to 1 and forwards the request to Bob and continues forwarding these packets until authentication is successful."
  related_weaknesses "425"
  related_weaknesses "285"
  related_weaknesses "693"
  matched_cwes "285"
  matched_cwes "425"
  matched_cwes "693"
  taxonomy_mappings "_networkx_list_start"
  taxonomy_mappings [
    taxonomy_name "ATTACK"
    entry_id "1565.002"
    entry_name "Data Manipulation: Transmitted Data Manipulation"
  ]
  execution_flow [
    step "1"
    phase "Explore"
    description "[Discovery] Using an established Person in the Middle setup, search for Bluetooth devices beginning the authentication process."
    techniques "_networkx_list_start"
    techniques "Use packet capture tools."
  ]
  execution_flow [
    step "2"
    phase "Experiment"
    description "[Change the entropy bits] Upon recieving the initial key negotiation packet from the master, the adversary modifies the entropy bits requested to 1 to allow for easy decryption before it is forwarded."
    techniques "[]"
  ]
  execution_flow [
    step "3"
    phase "Exploit"
    description "[Capture and decrypt data] Once the entropy of encryption is known, the adversary can capture data and then decrypt on their device."
    techniques "[]"
  ]
  node [
    id 0
    label "begin_the_authentication_process"
  ]
  node [
    id 1
    label "capture_packets"
  ]
  node [
    id 2
    label "change_the_entropy_bits"
  ]
  node [
    id 3
    label "know_the_entropy_of_encryption"
  ]
  node [
    id 4
    label "get_a_user"
  ]
  node [
    id 5
    label "send_a_message"
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
]
