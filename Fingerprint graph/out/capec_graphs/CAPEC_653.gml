graph [
  directed 1
  capec_id "653"
  name "Use of Known Operating System Credentials"
  abstraction "Standard"
  status "Draft"
  description "An adversary guesses or obtains (i.e. steals or purchases) legitimate operating system credentials (e.g. userID/password) to achieve authentication and to perform authorized actions on the system, under the guise of an authenticated user or service. This applies to any Operating System."
  likelihood "High"
  severity "High"
  related_attack_patterns [
    capec_id "560"
    nature "ChildOf"
  ]
  related_attack_patterns [
    capec_id "151"
    nature "CanPrecede"
  ]
  prerequisites "The system/application uses one factor password-based authentication, SSO, and/or cloud-based authentication."
  prerequisites "The system/application does not have a sound password policy that is being enforced."
  prerequisites "The system/application does not implement an effective password throttling mechanism."
  prerequisites "The adversary possesses a list of known user accounts and corresponding passwords that may exist on the target."
  skills_required "_networkx_list_start"
  skills_required [
    level "Low"
    description "Once an adversary obtains a known credential, leveraging it is trivial."
  ]
  resources_required "A list of known credentials for the targeted domain."
  resources_required "A custom script that leverages a credential list to launch an attack."
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
  mitigations "Leverage multi-factor authentication for all authentication services and prior to granting an entity access to the network."
  mitigations "Create a strong password policy and ensure that your system enforces this policy."
  mitigations "Ensure users are not reusing username/password combinations for multiple systems, applications, or services."
  mitigations "Do not reuse local administrator account credentials across systems."
  mitigations "Deny remote use of local admin credentials to log into domain systems."
  mitigations "Do not allow accounts to be a local administrator on more than one system."
  mitigations "Implement an intelligent password throttling mechanism. Care must be taken to assure that these mechanisms do not excessively enable account lockout attacks such as CAPEC-2."
  mitigations "Monitor system and domain logs for abnormal credential access."
  example_instances "Adversaries exploited the Zoom video conferencing application during the 2020 COVID-19 pandemic to exfiltrate Windows domain credentials from a target system. The attack entailed sending Universal Naming Convention (UNC) paths within the Zoom chat window of an unprotected Zoom call. If the victim clicked on the link, their Windows usernames and the corresponding Net-NTLM-v2 hashes were sent to the address contained in the link. The adversary was then able to infiltrate and laterally move within the Windows domain by passing the acquired credentials to shared network resources. This further provided adversaries with access to Outlook servers and network storage devices. [REF-575]"
  example_instances "Mimikatz, a post-exploitation Windows credential harvester, can be used to gather and exploit Windows credentials. This malware has been used in several known cyberattacks, such as the Petya Ransomeware attacks. [REF-576]"
  related_weaknesses "522"
  related_weaknesses "307"
  related_weaknesses "308"
  related_weaknesses "309"
  related_weaknesses "262"
  related_weaknesses "263"
  related_weaknesses "654"
  matched_cwes "307"
  matched_cwes "522"
  taxonomy_mappings "[]"
  execution_flow [
    step "1"
    phase "Explore"
    description "[Acquire known operating system credentials] The adversary must obtain known operating system credentials in order to access the target system, application, or service within the domain."
    techniques "An adversary purchases breached operating system username/password combinations or leaked hashed passwords from the dark web."
    techniques "An adversary leverages a key logger or phishing attack to steal user credentials as they are provided."
    techniques "An adversary conducts a sniffing attack to steal operating system credentials as they are transmitted."
    techniques "An adversary gains access to a system/files and exfiltrates password hashes."
    techniques "An adversary examines outward-facing configuration and properties files to discover hardcoded credentials."
  ]
  execution_flow [
    step "2"
    phase "Experiment"
    description "[Attempt authentication] Try each operating system credential against various systems, applications, and services within the domain until the target grants access."
    techniques "_networkx_list_start"
    techniques "Manually or automatically enter each credential through the target's interface."
  ]
  execution_flow [
    step "3"
    phase "Exploit"
    description "[Impersonate] An adversary can use successful experiments or authentications to impersonate an authorized user or system, or to laterally move within the network"
    techniques "[]"
  ]
  execution_flow [
    step "4"
    phase "Exploit"
    description "[Spoofing] Malicious data can be injected into the target system or into other systems on the network. The adversary can also pose as a legitimate user to perform social engineering attacks."
    techniques "[]"
  ]
  execution_flow [
    step "5"
    phase "Exploit"
    description "[Data Exfiltration] The adversary can obtain sensitive data contained within system files or application configuration."
    techniques "[]"
  ]
  node [
    id 0
    label "breach_username_password_combinations"
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
    label "gain_access_to_a_system_files_and_exfiltrates_password_hashes"
  ]
  node [
    id 4
    label "examine_outward_facing_configuration_and_properties"
  ]
  node [
    id 5
    label "try_each_operating_system_credential_against_various_systems_applications_and_services_within_the_domain"
  ]
  node [
    id 6
    label "enter_each_credential"
  ]
  node [
    id 7
    label "impersonate_an_authorized_user_or_system"
  ]
  node [
    id 8
    label "obtain_sensitive_data_contained_within_the_system_or_application"
  ]
  node [
    id 9
    label "exploit_the_zoom_video_conferencing_application"
  ]
  node [
    id 10
    label "entail_sending_universal_naming_convention_unc_paths_within_the_zoom_chat_window_of_an_unprotected_zoom_call"
  ]
  node [
    id 11
    label "provide_adversaries_with_access_to_outlook_servers_and_network_storage_devices"
  ]
  node [
    id 12
    label "enforce_that"
  ]
  node [
    id 13
    label "implement_an_effective_password_throttling_mechanism"
  ]
  node [
    id 14
    label "possess_a_list_of_known_user_accounts_and_corresponding_passwords_that_may_exist_on_the_target"
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
  edge [
    source 12
    target 13
  ]
  edge [
    source 13
    target 14
  ]
]
