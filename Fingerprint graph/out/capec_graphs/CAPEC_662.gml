graph [
  directed 1
  capec_id "662"
  name "Adversary in the Browser (AiTB)"
  abstraction "Standard"
  status "Stable"
  description "&#10;            "
  likelihood "High"
  severity "Very High"
  related_attack_patterns "_networkx_list_start"
  related_attack_patterns [
    capec_id "94"
    nature "ChildOf"
  ]
  prerequisites "The adversary must install or convince a user to install a Trojan."
  prerequisites "There are two components communicating with each other."
  prerequisites "An attacker is able to identify the nature and mechanism of communication between the two target components."
  prerequisites "Strong mutual authentication is not used between the two target components yielding opportunity for adversarial interposition."
  prerequisites "For browser pivoting, the SeDebugPrivilege and a high-integrity process must both exist to execute this attack."
  skills_required "_networkx_list_start"
  skills_required [
    level "Medium"
    description "Tricking the victim into installing the Trojan is often the most difficult aspect of this attack. Afterwards, the remainder of this attack is fairly trivial."
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
  mitigations "Ensure software and applications are only downloaded from legitimate and reputable sources, in addition to conducting integrity checks on the downloaded component."
  mitigations "Leverage anti-malware tools, which can detect Trojan Horse malware."
  mitigations "Use strong, out-of-band mutual authentication to always fully authenticate both ends of any communications channel."
  mitigations "Limit user permissions to prevent browser pivoting."
  mitigations "Ensure browser sessions are regularly terminated and when their effective lifetime ends."
  example_instances "An adversary conducts a phishing attack and tricks a victim into installing a malicious browser plugin. The adversary then positions themself between the victim and their banking institution. The victim begins by initiating a funds transfer from their personal savings to their personal checking account. Using injected JavaScript, the adversary captures this request and modifies it to transfer an increased amount of funds to an account that they controls, before sending it to the bank. The bank processes the transfer and sends the confirmation notice back to the victim, which is instead intercepted by the adversary. The adversary modifies the confirmation to reflect the original transaction details and sends this modified message back to the victim. Upon receiving the confirmation, the victim assumes the transfer was successful and is unaware that their money has just been transferred to the adversary."
  example_instances "In 2020, the Agent Tesla malware was leveraged to conduct AiTB attacks against organizations within the gas, oil, and other energy sectors. The malware was delivered via a spearphishing campaign and has the capability to form-grab, keylog, copy clipboard data, extract credentials, and capture screenshots. [REF-630]"
  example_instances "Boy in the browser attacks are a subset of AiTB attacks. Similar to AiTB attacks, the adversary must first trick the victim into installing a Trojan, either via social engineering or drive-by-download attacks. The malware then modifies the victim's &#34;hosts&#34; file in order to reroute web traffic from an intended website to an adversary-controlled website that mimics the legitimate website. The adversary is now able to observe, intercept, and/or modify all traffic, as in a traditional Adversary in the Middle attack (CAPEC-94). BiTB attacks are low-cost, easy to execute, and more difficult to detect since the malware often removes itself once the attack has concluded. [REF-631]"
  example_instances "Man in the Mobile attacks are a subset of AiTB attacks that target mobile device users. Like AiTB attacks, an adversary convinces a victim to install a Trojan mobile application on their mobile device, often under the guise of security. Once the victim has installed the application, the adversary can capture all SMS traffic to bypass SMS-based out-of-band authentication systems. [REF-632]"
  related_weaknesses "300"
  related_weaknesses "494"
  matched_cwes "_networkx_list_start"
  matched_cwes "494"
  taxonomy_mappings [
    taxonomy_name "ATTACK"
    entry_id "1185"
    entry_name "Man in the Browser"
  ]
  taxonomy_mappings [
    taxonomy_name "OWASP Attacks"
    entry_id ""
    entry_name "Man-in-the-browser attack"
  ]
  execution_flow [
    step "1"
    phase "Experiment"
    description "The adversary tricks the victim into installing the Trojan Horse malware onto their system."
    techniques "_networkx_list_start"
    techniques "Conduct phishing attacks, drive-by malware installations, or masquerade malicious browser extensions as being legitimate."
  ]
  execution_flow [
    step "2"
    phase "Experiment"
    description "The adversary inserts themself into the communication channel initially acting as a routing proxy between the two targeted components."
    techniques "[]"
  ]
  execution_flow [
    step "3"
    phase "Exploit"
    description "The adversary observes, filters, or alters passed data of their choosing to gain access to sensitive information or to manipulate the actions of the two target components for their own purposes."
    techniques "[]"
  ]
  node [
    id 0
    label "trick_the_victim"
  ]
  node [
    id 1
    label "execute_a_phishing_attack"
  ]
  node [
    id 2
    label "insert_themself"
  ]
  node [
    id 3
    label "place_themself"
  ]
  node [
    id 4
    label "process_the_transfer"
  ]
  node [
    id 5
    label "modify_the_confirmation"
  ]
  node [
    id 6
    label "conduct_aitb_attacks_against_organizations_within_the_gas_oil_and_other_energy_sectors"
  ]
  node [
    id 7
    label "deliver_the_malware"
  ]
  node [
    id 8
    label "modify_the_victim_s_hosts_file"
  ]
  node [
    id 9
    label "target_mobile_device_users"
  ]
  node [
    id 10
    label "convince_a_victim"
  ]
  node [
    id 11
    label "instal_the_application"
  ]
  node [
    id 12
    label "determine_the_nature_and_mechanism_of_communication_between_two_components"
  ]
  node [
    id 13
    label "yield_opportunity_for_adversarial_interposition"
  ]
  node [
    id 14
    label "execute_this_type_of_attack"
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
    source 1
    target 3
  ]
  edge [
    source 2
    target 1
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
    target 0
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
  edge [
    source 13
    target 14
  ]
]
