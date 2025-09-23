graph [
  directed 1
  capec_id "644"
  name "Use of Captured Hashes (Pass The Hash)"
  abstraction "Detailed"
  status "Stable"
  description "An adversary obtains (i.e. steals or purchases) legitimate Windows domain credential hash values to access systems within the domain that leverage the Lan Man (LM) and/or NT Lan Man (NTLM) authentication protocols."
  likelihood "Medium"
  severity "High"
  related_attack_patterns [
    capec_id "653"
    nature "ChildOf"
  ]
  related_attack_patterns [
    capec_id "151"
    nature "CanPrecede"
  ]
  related_attack_patterns [
    capec_id "165"
    nature "CanPrecede"
  ]
  related_attack_patterns [
    capec_id "549"
    nature "CanPrecede"
  ]
  related_attack_patterns [
    capec_id "545"
    nature "CanPrecede"
  ]
  prerequisites "The system/application is connected to the Windows domain."
  prerequisites "The system/application leverages the Lan Man (LM) and/or NT Lan Man (NTLM) authentication protocols."
  prerequisites "The adversary possesses known Windows credential hash value pairs that exist on the target domain."
  skills_required "_networkx_list_start"
  skills_required [
    level "Low"
    description "Once an adversary obtains a known Windows credential hash value pair, leveraging it is trivial."
  ]
  resources_required "_networkx_list_start"
  resources_required "A list of known Window credential hash value pairs for the targeted domain."
  consequences [
    scope "Confidentiality"
    scope "Access Control"
    scope "Authentication"
    impact "Gain Privileges"
  ]
  consequences [
    scope "Confidentiality"
    scope "Authorization"
    impact "Read Data"
  ]
  consequences [
    scope "_networkx_list_start"
    scope "Integrity"
    impact "Modify Data"
  ]
  mitigations "Prevent the use of Lan Man and NT Lan Man authentication on severs and apply patch KB2871997 to Windows 7 and higher systems."
  mitigations "Leverage multi-factor authentication for all authentication services and prior to granting an entity access to the domain network."
  mitigations "Monitor system and domain logs for abnormal credential access."
  mitigations "Create a strong password policy and ensure that your system enforces this policy."
  mitigations "Leverage system penetration testing and other defense in depth methods to determine vulnerable systems within a domain."
  example_instances "Adversaries exploited the Zoom video conferencing application during the 2020 COVID-19 pandemic to exfiltrate Windows domain credential hash value pairs from a target system. The attack entailed sending Universal Naming Convention (UNC) paths within the Zoom chat window of an unprotected Zoom call. If the victim clicked on the link, their Windows usernames and the corresponding Net-NTLM-v2 hashes were sent to the address contained in the link. The adversary was then able to infiltrate and laterally move within the Windows domain by passing the acquired credentials to shared network resources. This further provided adversaries with access to Outlook servers and network storage devices. [REF-575]"
  example_instances "Operation Soft Cell, which has been underway since at least 2012, leveraged a modified Mimikatz that dumped NTLM hashes. The acquired hashes were then used to authenticate to other systems within the network via Pass The Hash attacks. [REF-580]"
  related_weaknesses "522"
  related_weaknesses "836"
  related_weaknesses "308"
  related_weaknesses "294"
  related_weaknesses "308"
  matched_cwes "522"
  matched_cwes "294"
  taxonomy_mappings "_networkx_list_start"
  taxonomy_mappings [
    taxonomy_name "ATTACK"
    entry_id "1550.002"
    entry_name "Use Alternate Authentication Material:Pass The Hash"
  ]
  execution_flow [
    step "1"
    phase "Explore"
    description "[Acquire known Windows credential hash value pairs] The adversary must obtain known Windows credential hash value pairs of accounts that exist on the domain."
    techniques "An adversary purchases breached Windows credential hash value pairs from the dark web."
    techniques "An adversary conducts a sniffing attack to steal Windows credential hash value pairs as they are transmitted."
    techniques "An adversary gains access to a Windows domain system/files and exfiltrates Windows credential hash value pairs."
    techniques "An adversary examines outward-facing configuration and properties files to discover hardcoded Windows credential hash value pairs."
  ]
  execution_flow [
    step "2"
    phase "Experiment"
    description "[Attempt domain authentication] Try each Windows credential hash value pair until the target grants access."
    techniques "_networkx_list_start"
    techniques "Manually or automatically enter each Windows credential hash value pair through the target's interface."
  ]
  execution_flow [
    step "3"
    phase "Exploit"
    description "[Impersonate] An adversary can use successful experiments or authentications to impersonate an authorized user or system, or to laterally move within the domain"
    techniques "[]"
  ]
  execution_flow [
    step "4"
    phase "Exploit"
    description "[Spoofing] Malicious data can be injected into the target system or into other systems on the domain. The adversary can also pose as a legitimate domain user to perform social engineering attacks."
    techniques "[]"
  ]
  execution_flow [
    step "5"
    phase "Exploit"
    description "[Data Exfiltration] The adversary can obtain sensitive data contained within domain systems or applications."
    techniques "[]"
  ]
  node [
    id 0
    label "conduct_a_sniffing_attack_to_steal_credentials_as_they_are_transmitted"
  ]
  node [
    id 1
    label "gain_access_to_a_windows_domain_system_files"
  ]
  node [
    id 2
    label "examine_outward_facing_configuration_and_properties"
  ]
  node [
    id 3
    label "attempt_domain_authentication"
  ]
  node [
    id 4
    label "impersonate_an_authorized_user_or_system"
  ]
  node [
    id 5
    label "pose_to_perform_social_engineering_attacks"
  ]
  node [
    id 6
    label "obtain_sensitive_data_contained_within_the_system_or_application"
  ]
  node [
    id 7
    label "exploit_the_zoom_video_conferencing_application"
  ]
  node [
    id 8
    label "entail_sending_universal_naming_convention_unc_paths_within_the_zoom_chat_window_of_an_unprotected_zoom_call"
  ]
  node [
    id 9
    label "provide_adversaries_with_access_to_outlook_servers_and_network_storage_devices"
  ]
  node [
    id 10
    label "leverage_a_modified_mimikatz_that_dumped_ntlm_hashes"
  ]
  node [
    id 11
    label "connect_the_system_application"
  ]
  node [
    id 12
    label "possess_a_list_of_known_windows_administrator_credentials_that_exist_on_the_target_domain"
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
]
