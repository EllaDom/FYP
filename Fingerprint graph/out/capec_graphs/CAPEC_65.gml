graph [
  directed 1
  capec_id "65"
  name "Sniff Application Code"
  abstraction "Detailed"
  status "Draft"
  description "An adversary passively sniffs network communications and captures application code bound for an authorized client. Once obtained, they can use it as-is, or through reverse-engineering glean sensitive information or exploit the trust relationship between the client and server. Such code may belong to a dynamic update to the client, a patch being applied to a client component or any such interaction where the client is authorized to communicate with the server."
  likelihood "Low"
  severity "High"
  related_attack_patterns [
    capec_id "157"
    nature "ChildOf"
  ]
  related_attack_patterns [
    capec_id "37"
    nature "CanPrecede"
  ]
  prerequisites "The attacker must have the ability to place themself in the communication path between the client and server."
  prerequisites "The targeted application must receive some application code from the server; for example, dynamic updates, patches, applets or scripts."
  prerequisites "The attacker must be able to employ a sniffer on the network without being detected."
  skills_required "_networkx_list_start"
  skills_required [
    level "Medium"
    description "The attacker needs to setup a sniffer for a sufficient period of time so as to capture meaningful quantities of code. The presence of the sniffer should not be detected on the network. Also if the attacker plans to employ an adversary-in-the-middle attack (CAPEC-94), the client or server must not realize this. Finally, the attacker needs to regenerate source code from binary code if the need be."
  ]
  resources_required "_networkx_list_start"
  resources_required "The Attacker needs the ability to capture communications between the client being updated and the server providing the update. In the case that encryption obscures client/server communication the attacker will either need to lift key material from the client."
  consequences [
    scope "_networkx_list_start"
    scope "Confidentiality"
    impact "Read Data"
  ]
  consequences [
    scope "Confidentiality"
    scope "Access Control"
    scope "Authorization"
    impact "Gain Privileges"
  ]
  mitigations "Design: Encrypt all communication between the client and server."
  mitigations "Implementation: Use SSL, SSH, SCP."
  mitigations "Operation: Use &#34;ifconfig/ipconfig&#34; or other tools to detect the sniffer installed in the network."
  example_instances "Attacker receives notification that the computer/OS/application has an available update, loads a network sniffing tool, and extracts update data from subsequent communication. The attacker then proceeds to reverse engineer the captured stream to gain sensitive information, such as encryption keys, validation algorithms, applications patches, etc.."
  example_instances "Plain code, such as applets or JavaScript, is also part of the executing application. If such code is transmitted unprotected, the attacker can capture the code and possibly reverse engineer it to gain sensitive information, such as encryption keys, validation algorithms and such."
  related_weaknesses "319"
  related_weaknesses "311"
  related_weaknesses "318"
  related_weaknesses "693"
  matched_cwes "693"
  matched_cwes "311"
  matched_cwes "319"
  taxonomy_mappings "_networkx_list_start"
  taxonomy_mappings [
    taxonomy_name "ATTACK"
    entry_id "1040"
    entry_name "Network Sniffing"
  ]
  execution_flow [
    step "1"
    phase "Explore"
    description "[Set up a sniffer] The adversary sets up a sniffer in the path between the server and the client and watches the traffic."
    techniques "_networkx_list_start"
    techniques "The adversary sets up a sniffer in the path between the server and the client."
  ]
  execution_flow [
    step "2"
    phase "Exploit"
    description "[Capturing Application Code Bound During Patching]adversary knows that the computer/OS/application can request new applications to install, or it periodically checks for an available update. The adversary loads the sniffer set up during Explore phase, and extracts the application code from subsequent communication. The adversary then proceeds to reverse engineer the captured code."
    techniques "adversary loads the sniffer to capture the application code bound during a dynamic update."
    techniques "The adversary proceeds to reverse engineer the captured code."
  ]
  node [
    id 0
    label "set_a_sniffer"
  ]
  node [
    id 1
    label "set_a_sniffer_in_the_path_between_the_server_and_the_client"
  ]
  node [
    id 2
    label "load_the_sniffer_set_up_during_explore_phase"
  ]
  node [
    id 3
    label "proceed_to_reverse_engineer_the_captured_code"
  ]
  node [
    id 4
    label "load_the_sniffer_to_capture_the_application_code_bound_during_a_dynamic_update"
  ]
  node [
    id 5
    label "receive_notification_that_the_computer_os_application_has_an_available_update"
  ]
  node [
    id 6
    label "proceed_to_reverse_engineer_the_captured_stream_to_gain_sensitive_information_such_as_encryption_keys_validation_algorithms_applications_patches_etc"
  ]
  node [
    id 7
    label "transmit_such_code"
  ]
  node [
    id 8
    label "place_themself"
  ]
  node [
    id 9
    label "employ_a_sniffer_on_the_network"
  ]
  edge [
    source 0
    target 1
  ]
  edge [
    source 1
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
    target 5
  ]
  edge [
    source 4
    target 3
  ]
  edge [
    source 5
    target 6
  ]
  edge [
    source 6
    target 7
  ]
  edge [
    source 7
    target 8
  ]
  edge [
    source 8
    target 9
  ]
]
