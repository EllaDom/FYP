graph [
  directed 1
  capec_id "94"
  name "Adversary in the Middle (AiTM)"
  abstraction "Meta"
  status "Stable"
  description "&#10;            "
  likelihood "High"
  severity "Very High"
  related_attack_patterns [
    capec_id "151"
    nature "CanPrecede"
  ]
  related_attack_patterns [
    capec_id "668"
    nature "CanPrecede"
  ]
  prerequisites "There are two components communicating with each other."
  prerequisites "An attacker is able to identify the nature and mechanism of communication between the two target components."
  prerequisites "An attacker can eavesdrop on the communication between the target components."
  prerequisites "Strong mutual authentication is not used between the two target components yielding opportunity for attacker interposition."
  prerequisites "The communication occurs in clear (not encrypted) or with insufficient and spoofable encryption."
  skills_required "_networkx_list_start"
  skills_required [
    level "Medium"
    description "This attack can get sophisticated since the attack may use cryptography."
  ]
  resources_required "[]"
  consequences [
    scope "_networkx_list_start"
    scope "Integrity"
    impact "Modify Data"
  ]
  consequences [
    scope "Confidentiality"
    scope "Access Control"
    scope "Authorization"
    impact "Gain Privileges"
  ]
  consequences [
    scope "_networkx_list_start"
    scope "Confidentiality"
    impact "Read Data"
  ]
  mitigations "Ensure Public Keys are signed by a Certificate Authority"
  mitigations "Encrypt communications using cryptography (e.g., SSL/TLS)"
  mitigations "Use Strong mutual authentication to always fully authenticate both ends of any communications channel."
  mitigations "Exchange public keys using a secure channel"
  example_instances "_networkx_list_start"
  example_instances "In 2017, security researcher Jerry Decime discovered that Equifax mobile applications were not leveraging HTTPS in all areas. Although authentication was properly utilizing HTTPS, in addition to validating the root of trust of the server certificate, other areas of the application were using HTTP to communicate. Adversaries could then conduct MITM attacks on rogue WiFi or cellular networks and hijack the UX. This further allowed the adversaries to prompt users for sensitive data, which could then be obtained in the plaintext response. [REF-636]"
  related_weaknesses "300"
  related_weaknesses "290"
  related_weaknesses "593"
  related_weaknesses "287"
  related_weaknesses "294"
  matched_cwes "287"
  matched_cwes "294"
  matched_cwes "290"
  taxonomy_mappings [
    taxonomy_name "ATTACK"
    entry_id "1557"
    entry_name "Adversary-in-the-Middle"
  ]
  taxonomy_mappings [
    taxonomy_name "OWASP Attacks"
    entry_id ""
    entry_name "Man-in-the-middle attack"
  ]
  execution_flow [
    step "1"
    phase "Explore"
    description "[Determine Communication Mechanism] The adversary determines the nature and mechanism of communication between two components, looking for opportunities to exploit."
    techniques "Perform a sniffing attack and observe communication to determine a communication protocol."
    techniques "Look for application documentation that might describe a communication mechanism used by a target."
  ]
  execution_flow [
    step "2"
    phase "Experiment"
    description "[Position In Between Targets] The adversary inserts themself into the communication channel initially acting as a routing proxy between the two targeted components."
    techniques "Install spyware on a client that will intercept outgoing packets and route them to their destination as well as route incoming packets back to the client."
    techniques "Exploit a weakness in an encrypted communication mechanism to gain access to traffic. Look for outdated mechanisms such as SSL."
  ]
  execution_flow [
    step "3"
    phase "Exploit"
    description "[Use Intercepted Data Maliciously] The adversary observes, filters, or alters passed data of its choosing to gain access to sensitive information or to manipulate the actions of the two target components for their own purposes."
    techniques "_networkx_list_start"
    techniques "Prevent some messages from reaching their destination, causing a denial of service."
  ]
  node [
    id 0
    label "determine_the_nature_and_mechanism_of_communication_between_two_components"
  ]
  node [
    id 1
    label "conduct_a_sniffing_attack"
  ]
  node [
    id 2
    label "insert_themself"
  ]
  node [
    id 3
    label "intercept_outgoing_packets"
  ]
  node [
    id 4
    label "exploit_a_weakness_in_an_encrypted_communication_mechanism_to_gain_access_to_traffic"
  ]
  node [
    id 5
    label "prevent_some_messages"
  ]
  node [
    id 6
    label "utilize_https"
  ]
  node [
    id 7
    label "conduct_mitm_attacks_on_rogue_wifi_or_cellular_networks"
  ]
  node [
    id 8
    label "yield_opportunity_for_attacker_interposition"
  ]
  edge [
    source 0
    target 1
  ]
  edge [
    source 0
    target 8
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
    target 6
  ]
  edge [
    source 6
    target 7
  ]
  edge [
    source 7
    target 0
  ]
]
