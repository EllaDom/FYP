graph [
  directed 1
  capec_id "509"
  name "Kerberoasting"
  abstraction "Detailed"
  status "Stable"
  description "Through the exploitation of how service accounts leverage Kerberos authentication with Service Principal Names (SPNs), the adversary obtains and subsequently cracks the hashed credentials of a service account target to exploit its privileges. The Kerberos authentication protocol centers around a ticketing system which is used to request/grant access to services and to then access the requested services. As an authenticated user, the adversary may request Active Directory and obtain a service ticket with portions encrypted via RC4 with the private key of the authenticated account. By extracting the local ticket and saving it disk, the adversary can brute force the hashed value to reveal the target account credentials."
  likelihood ""
  severity "High"
  related_attack_patterns [
    capec_id "652"
    nature "ChildOf"
  ]
  related_attack_patterns [
    capec_id "151"
    nature "CanPrecede"
  ]
  prerequisites "The adversary requires access as an authenticated user on the system. This attack pattern relates to elevating privileges."
  prerequisites "The adversary requires use of a third-party credential harvesting tool (e.g., Mimikatz)."
  prerequisites "The adversary requires a brute force tool."
  skills_required "_networkx_list_start"
  skills_required [
    level "Medium"
    description ""
  ]
  resources_required "[]"
  consequences "_networkx_list_start"
  consequences [
    scope "_networkx_list_start"
    scope "Confidentiality"
    impact "Gain Privileges"
  ]
  mitigations "Monitor system and domain logs for abnormal access."
  mitigations "Employ a robust password policy for service accounts. Passwords should be of adequate length and complexity, and they should expire after a period of time."
  mitigations "Employ the principle of least privilege: limit service accounts privileges to what is required for functionality and no more."
  mitigations "Enable AES Kerberos encryption (or another stronger encryption algorithm), rather than RC4, where possible."
  example_instances "_networkx_list_start"
  example_instances "PowerSploit's Invoke-Kerberoast module can be leveraged to request Ticket Granting Service (TGS) tickets and return crackable ticket hashes. [REF-585] [REF-586]"
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
    entry_id "1558.003"
    entry_name "Steal or Forge Kerberos Tickets:Kerberoasting"
  ]
  execution_flow [
    step "1"
    phase "Explore"
    description "Scan for user accounts with set SPN values"
    techniques "_networkx_list_start"
    techniques "These can be found via Powershell or LDAP queries, as well as enumerating startup name accounts and other means."
  ]
  execution_flow [
    step "2"
    phase "Explore"
    description "Request service tickets"
    techniques "_networkx_list_start"
    techniques "Using user account's SPN value, request other service tickets from Active Directory"
  ]
  execution_flow [
    step "3"
    phase "Experiment"
    description "Extract ticket and save to disk"
    techniques "_networkx_list_start"
    techniques "Certain tools like Mimikatz can extract local tickets and save them to memory/disk."
  ]
  execution_flow [
    step "4"
    phase "Exploit"
    description "Crack the encrypted ticket to harvest plain text credentials"
    techniques "_networkx_list_start"
    techniques "Leverage a brute force application/script on the hashed value offline until cracked. The shorter the password, the easier it is to crack."
  ]
  node [
    id 0
    label "find_this"
  ]
  node [
    id 1
    label "request_other_service_tickets_from_active_directory"
  ]
  node [
    id 2
    label "extract_ticket"
  ]
  node [
    id 3
    label "crack_the_encrypted_ticket"
  ]
  node [
    id 4
    label "leverage_a_brute_force_application_script_on_the_hashed_value"
  ]
  node [
    id 5
    label "request_ticket_granting_service_tgs_tickets"
  ]
  node [
    id 6
    label "require_access_as_an_authenticated_user_on_the_system"
  ]
  node [
    id 7
    label "require_use_of_a_third_party_credential_harvesting_tool"
  ]
  node [
    id 8
    label "require_a_brute_force_tool"
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
]
