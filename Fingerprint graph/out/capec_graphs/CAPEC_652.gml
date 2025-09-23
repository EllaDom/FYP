graph [
  directed 1
  capec_id "652"
  name "Use of Known Kerberos Credentials"
  abstraction "Standard"
  status "Draft"
  description "An adversary obtains (i.e. steals or purchases) legitimate Kerberos credentials (e.g. Kerberos service account userID/password or Kerberos Tickets) with the goal of achieving authenticated access to additional systems, applications, or services within the domain."
  likelihood "Medium"
  severity "High"
  related_attack_patterns [
    capec_id "560"
    nature "ChildOf"
  ]
  related_attack_patterns [
    capec_id "151"
    nature "CanPrecede"
  ]
  prerequisites "The system/application leverages Kerberos authentication."
  prerequisites "The system/application uses one factor password-based authentication, SSO, and/or cloud-based authentication for Kerberos service accounts."
  prerequisites "The system/application does not have a sound password policy that is being enforced for Kerberos service accounts."
  prerequisites "The system/application does not implement an effective password throttling mechanism for authenticating to Kerberos service accounts."
  prerequisites "The targeted network allows for network sniffing attacks to succeed."
  skills_required "_networkx_list_start"
  skills_required [
    level "Low"
    description "Once an adversary obtains a known Kerberos credential, leveraging it is trivial."
  ]
  resources_required "_networkx_list_start"
  resources_required "A valid Kerberos ticket or a known Kerberos service account credential."
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
  mitigations "Create a strong password policy and ensure that your system enforces this policy for Kerberos service accounts."
  mitigations "Ensure Kerberos service accounts are not reusing username/password combinations for multiple systems, applications, or services."
  mitigations "Do not reuse Kerberos service account credentials across systems."
  mitigations "Deny remote use of Kerberos service account credentials to log into domain systems."
  mitigations "Do not allow Kerberos service accounts to be a local administrator on more than one system."
  mitigations "Enable at least AES Kerberos encryption for tickets."
  mitigations "Monitor system and domain logs for abnormal credential access."
  example_instances "Bronze Butler (also known as Tick), has been shown to leverage forged Kerberos Ticket Granting Tickets (TGTs) and Ticket Granting Service (TGS) tickets to maintain administrative access on a number of systems. [REF-584]"
  example_instances "PowerSploit's Invoke-Kerberoast module can be leveraged to request Ticket Granting Service (TGS) tickets and return crackable ticket hashes. [REF-585] [REF-586]"
  related_weaknesses "522"
  related_weaknesses "307"
  related_weaknesses "308"
  related_weaknesses "309"
  related_weaknesses "262"
  related_weaknesses "263"
  related_weaknesses "654"
  related_weaknesses "294"
  related_weaknesses "836"
  matched_cwes "307"
  matched_cwes "522"
  matched_cwes "294"
  taxonomy_mappings "_networkx_list_start"
  taxonomy_mappings [
    taxonomy_name "ATTACK"
    entry_id "1558"
    entry_name "Steal or Forge Kerberos Tickets"
  ]
  execution_flow [
    step "1"
    phase "Explore"
    description "[Acquire known Kerberos credentials] The adversary must obtain known Kerberos credentials in order to access the target system, application, or service within the domain."
    techniques "An adversary purchases breached Kerberos service account username/password combinations or leaked hashed passwords from the dark web."
    techniques "An adversary guesses the credentials to a weak Kerberos service account."
    techniques "An adversary conducts a sniffing attack to steal Kerberos tickets as they are transmitted."
    techniques "An adversary conducts a Kerberoasting attack."
  ]
  execution_flow [
    step "2"
    phase "Experiment"
    description "[Attempt Kerberos authentication] Try each Kerberos credential against various resources within the domain until the target grants access."
    techniques "Manually or automatically enter each Kerberos service account credential through the target's interface."
    techniques "Attempt a Pass the Ticket attack."
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
    label "breach_kerberos_service_account_username_password_combinations"
  ]
  node [
    id 1
    label "guess_the_credentials"
  ]
  node [
    id 2
    label "conduct_a_sniffing_attack"
  ]
  node [
    id 3
    label "conduct_a_kerberoasting_attack"
  ]
  node [
    id 4
    label "attempt_kerberos"
  ]
  node [
    id 5
    label "attempt_a_pass_the_ticket_attack"
  ]
  node [
    id 6
    label "impersonate_an_authorized_user_or_system"
  ]
  node [
    id 7
    label "pose_to_perform_social_engineering_attacks"
  ]
  node [
    id 8
    label "obtain_sensitive_data_contained_within_the_system_or_application"
  ]
  node [
    id 9
    label "request_ticket_granting_service_tgs_tickets"
  ]
  node [
    id 10
    label "enforce_that"
  ]
  node [
    id 11
    label "implement_an_effective_password_throttling_mechanism_for_authenticating_to_kerberos_service_accounts"
  ]
  node [
    id 12
    label "allow_for_network_sniffing_attacks_to_succeed"
  ]
  edge [
    source 0
    target 1
  ]
  edge [
    source 0
    target 5
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
    target 0
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
