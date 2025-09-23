graph [
  directed 1
  capec_id "560"
  name "Use of Known Domain Credentials"
  abstraction "Meta"
  status "Stable"
  description "&#10;            "
  likelihood "High"
  severity "High"
  related_attack_patterns "_networkx_list_start"
  related_attack_patterns [
    capec_id "151"
    nature "CanPrecede"
  ]
  prerequisites "The system/application uses one factor password based authentication, SSO, and/or cloud-based authentication."
  prerequisites "The system/application does not have a sound password policy that is being enforced."
  prerequisites "The system/application does not implement an effective password throttling mechanism."
  prerequisites "The adversary possesses a list of known user accounts and corresponding passwords that may exist on the target."
  skills_required "_networkx_list_start"
  skills_required [
    level "Low"
    description "Once an adversary obtains a known credential, leveraging it is trivial."
  ]
  resources_required "A list of known credentials."
  resources_required "A custom script that leverages the credential list to launch an attack."
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
  mitigations "Leverage multi-factor authentication for all authentication services and prior to granting an entity access to the domain network."
  mitigations "Create a strong password policy and ensure that your system enforces this policy."
  mitigations "Ensure users are not reusing username/password combinations for multiple systems, applications, or services."
  mitigations "Do not reuse local administrator account credentials across systems."
  mitigations "Deny remote use of local admin credentials to log into domain systems."
  mitigations "Do not allow accounts to be a local administrator on more than one system."
  mitigations "Implement an intelligent password throttling mechanism. Care must be taken to assure that these mechanisms do not excessively enable account lockout attacks such as CAPEC-2."
  mitigations "Monitor system and domain logs for abnormal credential access."
  example_instances "Throughout 2015 and 2016, APT28 &#8212; also known as Pawn Storm, Sednit, Fancy Bear, Sofacy, and STRONTIUM &#8212; leveraged stolen credentials to infiltrate the Democratic National Committee (DNC), the United States Army, the World Anti-Doping Agency (WADA), the Court of Arbitration for Sport (TAS-CAS), and more. In most cases, the legitimate credentials were obtained via calculated spearphishing, tabnabbing, and DNS attacks targeted at corporate webmail systems. APT28 also executed several watering hole attacks, in addition to exploiting several zero-day vulnerabilities within Flash and Windows. The stolen credentials were then utilized to maintain authenticated access, laterally move within the local network, and exfiltrate sensitive information including DNC emails and personal medical records of numerous athletes. [REF-571]"
  example_instances "In early 2019, FIN6 exploited stolen credentials from an organization within the engineering industry to laterally move within an environment via the Windows&#8217; Remote Desktop Protocol (RDP). Multiple servers were subsequently infected with malware to create malware distribution servers, which were used to distribute the LockerGoga ransomware. [REF-573]"
  related_weaknesses "522"
  related_weaknesses "307"
  related_weaknesses "308"
  related_weaknesses "309"
  related_weaknesses "262"
  related_weaknesses "263"
  related_weaknesses "654"
  related_weaknesses "1273"
  matched_cwes "307"
  matched_cwes "522"
  taxonomy_mappings "_networkx_list_start"
  taxonomy_mappings [
    taxonomy_name "ATTACK"
    entry_id "1078"
    entry_name "Valid Accounts"
  ]
  execution_flow [
    step "1"
    phase "Explore"
    description "[Acquire known credentials] The adversary must obtain known credentials in order to access the target system, application, or service."
    techniques "An adversary purchases breached username/password combinations or leaked hashed passwords from the dark web."
    techniques "An adversary leverages a key logger or phishing attack to steal user credentials as they are provided."
    techniques "An adversary conducts a sniffing attack to steal credentials as they are transmitted."
    techniques "An adversary gains access to a database and exfiltrates password hashes."
    techniques "An adversary examines outward-facing configuration and properties files to discover hardcoded credentials."
  ]
  execution_flow [
    step "2"
    phase "Explore"
    description "[Determine target's password policy] Determine the password policies of the target system/application to determine if the known credentials fit within the specified criteria."
    techniques "Determine minimum and maximum allowed password lengths."
    techniques "Determine format of allowed passwords (whether they are required or allowed to contain numbers, special characters, etc., or whether they are allowed to contain words from the dictionary)."
    techniques "Determine account lockout policy (a strict account lockout policy will prevent brute force attacks if multiple passwords are known for a single user account)."
  ]
  execution_flow [
    step "3"
    phase "Experiment"
    description "[Attempt authentication] Try each credential until the target grants access."
    techniques "_networkx_list_start"
    techniques "Manually or automatically enter each credential through the target's interface."
  ]
  execution_flow [
    step "4"
    phase "Exploit"
    description "[Impersonate] An adversary can use successful experiments or authentications to impersonate an authorized user or system, or to laterally move within a system or application"
    techniques "[]"
  ]
  execution_flow [
    step "5"
    phase "Exploit"
    description "[Spoofing] Malicious data can be injected into the target system or into a victim user's system by an adversary. The adversary can also pose as a legitimate user to perform social engineering attacks."
    techniques "[]"
  ]
  execution_flow [
    step "6"
    phase "Exploit"
    description "[Data Exfiltration] The adversary can obtain sensitive data contained within the system or application."
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
    label "gain_access_to_a_database"
  ]
  node [
    id 4
    label "examine_outward_facing_configuration_and_properties"
  ]
  node [
    id 5
    label "determine_the_password_policies_of_the_target_application_system"
  ]
  node [
    id 6
    label "determine_minimum_and_maximum_allowed_password_lengths"
  ]
  node [
    id 7
    label "determine_account"
  ]
  node [
    id 8
    label "enter_each_credential"
  ]
  node [
    id 9
    label "impersonate_an_authorized_user_or_system"
  ]
  node [
    id 10
    label "obtain_sensitive_data_contained_within_the_system_or_application"
  ]
  node [
    id 11
    label "know_to_infiltrate_the_democratic_national_committee_dnc"
  ]
  node [
    id 12
    label "obtain_the_legitimate_credentials"
  ]
  node [
    id 13
    label "execute_several_watering_hole_attacks"
  ]
  node [
    id 14
    label "exploit_stolen_credentials"
  ]
  node [
    id 15
    label "infect_multiple_servers"
  ]
  node [
    id 16
    label "enforce_that"
  ]
  node [
    id 17
    label "implement_an_effective_password_throttling_mechanism"
  ]
  node [
    id 18
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
  edge [
    source 14
    target 15
  ]
  edge [
    source 15
    target 16
  ]
  edge [
    source 16
    target 17
  ]
  edge [
    source 17
    target 18
  ]
]
