graph [
  directed 1
  capec_id "102"
  name "Session Sidejacking"
  abstraction "Detailed"
  status "Draft"
  description "Session sidejacking takes advantage of an unencrypted communication channel between a victim and target system. The attacker sniffs traffic on a network looking for session tokens in unencrypted traffic. Once a session token is captured, the attacker performs malicious actions by using the stolen token with the targeted application to impersonate the victim. This attack is a specific method of session hijacking, which is exploiting a valid session token to gain unauthorized access to a target system or information. Other methods to perform a session hijacking are session fixation, cross-site scripting, or compromising a user or server machine and stealing the session token."
  likelihood "High"
  severity "High"
  related_attack_patterns "_networkx_list_start"
  related_attack_patterns [
    capec_id "593"
    nature "ChildOf"
  ]
  prerequisites "An attacker and the victim are both using the same WiFi network."
  prerequisites "The victim has an active session with a target system."
  prerequisites "The victim is not using a secure channel to communicate with the target system (e.g. SSL, VPN, etc.)"
  prerequisites "The victim initiated communication with a target system that requires transfer of the session token or the target application uses AJAX and thereby periodically &#34;rings home&#34; asynchronously using the session token"
  skills_required "_networkx_list_start"
  skills_required [
    level "Low"
    description "Easy to use tools exist to automate this attack."
  ]
  resources_required "_networkx_list_start"
  resources_required "A packet sniffing tool, such as wireshark, can be used to capture session information."
  consequences [
    scope "Confidentiality"
    scope "Access Control"
    scope "Authorization"
    impact "Gain Privileges"
  ]
  consequences [
    scope "_networkx_list_start"
    scope "Integrity"
    impact "Modify Data"
  ]
  consequences [
    scope "_networkx_list_start"
    scope "Confidentiality"
    impact "Read Data"
  ]
  consequences [
    scope "_networkx_list_start"
    scope "Availability"
    impact "Unreliable Execution"
  ]
  mitigations "Make sure that HTTPS is used to communicate with the target system. Alternatively, use VPN if possible. It is important to ensure that all communication between the client and the server happens via an encrypted secure channel."
  mitigations "Modify the session token with each transmission and protect it with cryptography. Add the idea of request sequencing that gives the server an ability to detect replay attacks."
  example_instances "_networkx_list_start"
  example_instances "The attacker and the victim are using the same WiFi public hotspot. When the victim connects to the hotspot, they has a hosted e-mail account open. This e-mail account uses AJAX on the client side which periodically asynchronously connects to the server side and transfers, amongst other things, the user's session token to the server. The communication is supposed to happen over HTTPS. However, the configuration in the public hotspot initially disallows the HTTPS connection (or any other connection) between the victim and the hosted e-mail servers because the victim first needs to register with the hotspot. The victim does so, but their e-mail client already defaulted to using a connection without HTTPS, since it was denied access the first time. Victim's session token is now flowing unencrypted between the victim's browser and the hosted e-mail servers. The attacker leverages this opportunity to capture the session token and gain access to the victim's hosted e-mail account."
  related_weaknesses "294"
  related_weaknesses "522"
  related_weaknesses "523"
  related_weaknesses "319"
  related_weaknesses "614"
  matched_cwes "523"
  matched_cwes "319"
  matched_cwes "522"
  matched_cwes "294"
  taxonomy_mappings "[]"
  execution_flow [
    step "1"
    phase "Explore"
    description "[Detect Unprotected Session Token Transfer] The attacker sniffs on the wireless network to detect unencrypted traffic that contains session tokens."
    techniques "_networkx_list_start"
    techniques "The attacker uses a network sniffer tool like ferret or hamster to monitor the wireless traffic at a WiFi hotspot while examining it for evidence of transmittal of session tokens in unencrypted or recognizably encrypted form. An attacker applies their knowledge of the manner by which session tokens are generated and transmitted by various target systems to identify the session tokens."
  ]
  execution_flow [
    step "2"
    phase "Experiment"
    description "[Capture session token] The attacker uses sniffing tools to capture a session token from traffic."
    techniques "[]"
  ]
  execution_flow [
    step "3"
    phase "Experiment"
    description "[Insert captured session token] The attacker attempts to insert a captured session token into communication with the targeted application to confirm viability for exploitation."
    techniques "[]"
  ]
  execution_flow [
    step "4"
    phase "Exploit"
    description "[Session Token Exploitation] The attacker leverages the captured session token to interact with the targeted application in a malicious fashion, impersonating the victim."
    techniques "[]"
  ]
  node [
    id 0
    label "detect_unprotected_session_token_transfer"
  ]
  node [
    id 1
    label "sniff_to_detect_unencrypted_traffic_that_contains_session_tokens"
  ]
  node [
    id 2
    label "monitor_the_wireless_traffic"
  ]
  node [
    id 3
    label "apply_their_knowledge_of_the_manner_session_tokens_are_generated_and_by_which_transmitted_by_various_target_systems_to_identify_the_session_tokens"
  ]
  node [
    id 4
    label "capture_session"
  ]
  node [
    id 5
    label "leverage_the_captured_session_token_to_interact_with_the_targeted_application_in_a_malicious_fashion"
  ]
  node [
    id 6
    label "use_the_same_wifi_public_hotspot"
  ]
  node [
    id 7
    label "suppose_the_communication"
  ]
  node [
    id 8
    label "disallow_the_https_connection_or_any_other_connection_between_the_victim_and_the_hosted_e_mail_servers"
  ]
  node [
    id 9
    label "default_since_it_was_denied_access_the_first_time"
  ]
  node [
    id 10
    label "leverage_this_opportunity_to_capture_the_session_token_and_gain_access_to_the_victim_s_hosted_e_mail_account"
  ]
  node [
    id 11
    label "use_the_same_wifi_network"
  ]
  node [
    id 12
    label "have_an_active_session_with_the_target_system"
  ]
  node [
    id 13
    label "initiate_communication_with_a_target_system_that_requires_transfer_of_the_session_token_or"
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
  edge [
    source 5
    target 5
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
  edge [
    source 9
    target 10
  ]
  edge [
    source 10
    target 11
  ]
  edge [
    source 11
    target 12
  ]
  edge [
    source 12
    target 13
  ]
]
