graph [
  directed 1
  capec_id "561"
  name "Windows Admin Shares with Stolen Credentials"
  abstraction "Detailed"
  status "Draft"
  description "An adversary guesses or obtains (i.e. steals or purchases) legitimate Windows administrator credentials (e.g. userID/password) to access Windows Admin Shares on a local machine or within a Windows domain."
  likelihood ""
  severity ""
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
  prerequisites "The target administrative share allows remote use of local admin credentials to log into domain systems."
  prerequisites "The adversary possesses a list of known Windows administrator credentials that exist on the target domain."
  skills_required "_networkx_list_start"
  skills_required [
    level "Low"
    description "Once an adversary obtains a known Windows credential, leveraging it is trivial."
  ]
  resources_required "_networkx_list_start"
  resources_required "A list of known Windows administrator credentials for the targeted domain."
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
  mitigations "Do not reuse local administrator account credentials across systems."
  mitigations "Deny remote use of local admin credentials to log into domain systems."
  mitigations "Do not allow accounts to be a local administrator on more than one system."
  example_instances "APT32 has leveraged Windows' built-in Net utility to use Windows Administrative Shares to copy and execute remote malware. [REF-579]"
  example_instances "In May 2017, APT15 laterally moved within a Windows domain via Windows Administrative Shares to copy files to and from compromised host systems. This further allowed for the remote execution of malware. [REF-578]"
  related_weaknesses "522"
  related_weaknesses "308"
  related_weaknesses "309"
  related_weaknesses "294"
  related_weaknesses "263"
  related_weaknesses "262"
  related_weaknesses "521"
  matched_cwes "521"
  matched_cwes "522"
  matched_cwes "294"
  taxonomy_mappings "_networkx_list_start"
  taxonomy_mappings [
    taxonomy_name "ATTACK"
    entry_id "1021.002"
    entry_name "Remote Services:SMB/Windows Admin Shares"
  ]
  execution_flow [
    step "1"
    phase "Explore"
    description "[Acquire known Windows administrator credentials] The adversary must obtain known Windows administrator credentials in order to access the administrative network shares."
    techniques "An adversary purchases breached Windows administrator credentials from the dark web."
    techniques "An adversary leverages a key logger or phishing attack to steal administrator credentials as they are provided."
    techniques "An adversary conducts a sniffing attack to steal Windows administrator credentials as they are transmitted."
    techniques "An adversary gains access to a Windows domain system/files and exfiltrates Windows administrator password hashes."
    techniques "An adversary examines outward-facing configuration and properties files to discover hardcoded Windows administrator credentials."
  ]
  execution_flow [
    step "2"
    phase "Experiment"
    description "[Attempt domain authentication] Try each Windows administrator credential against the hidden network shares until the target grants access."
    techniques "_networkx_list_start"
    techniques "Manually or automatically enter each administrator credential through the target's interface."
  ]
  execution_flow [
    step "3"
    phase "Exploit"
    description "[Malware Execution] An adversary can remotely execute malware within the administrative network shares to infect other systems within the domain."
    techniques "[]"
  ]
  execution_flow [
    step "4"
    phase "Exploit"
    description "[Data Exfiltration] The adversary can remotely obtain sensitive data contained within the administrative network shares."
    techniques "[]"
  ]
  node [
    id 0
    label "breach_windows_administrator_credentials_from_the_dark_web"
  ]
  node [
    id 1
    label "leverage_a_key_logger_or_phishing_attack"
  ]
  node [
    id 2
    label "conduct_a_sniffing_attack_to_steal_credentials_as_they_are_transmitted"
  ]
  node [
    id 3
    label "gain_access_to_a_windows_domain_system_files"
  ]
  node [
    id 4
    label "examine_outward_facing_configuration_and_properties"
  ]
  node [
    id 5
    label "attempt_domain_authentication"
  ]
  node [
    id 6
    label "enter_each_credential"
  ]
  node [
    id 7
    label "execute_malicious_commands"
  ]
  node [
    id 8
    label "obtain_sensitive_data_contained_within_the_administrative_network_shares"
  ]
  node [
    id 9
    label "leverage_windows_built_in_net_utility"
  ]
  node [
    id 10
    label "move_to_copy_files_to_and_from_compromised_host_systems"
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
