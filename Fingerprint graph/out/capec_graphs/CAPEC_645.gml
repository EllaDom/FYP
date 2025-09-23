graph [
  directed 1
  capec_id "645"
  name "Use of Captured Tickets (Pass The Ticket)"
  abstraction "Detailed"
  status "Stable"
  description "An adversary uses stolen Kerberos tickets to access systems/resources that leverage the Kerberos authentication protocol. The Kerberos authentication protocol centers around a ticketing system which is used to request/grant access to services and to then access the requested services. An adversary can obtain any one of these tickets (e.g. Service Ticket, Ticket Granting Ticket, Silver Ticket, or Golden Ticket) to authenticate to a system/resource without needing the account's credentials. Depending on the ticket obtained, the adversary may be able to access a particular resource or generate TGTs for any account within an Active Directory Domain."
  likelihood "Low"
  severity "High"
  related_attack_patterns [
    capec_id "652"
    nature "ChildOf"
  ]
  related_attack_patterns [
    capec_id "151"
    nature "CanPrecede"
  ]
  prerequisites "The adversary needs physical access to the victim system."
  prerequisites "The use of a third-party credential harvesting tool."
  skills_required [
    level "Low"
    description "Determine if Kerberos authentication is used on the server."
  ]
  skills_required [
    level "High"
    description "The adversary uses a third-party tool to obtain the necessary tickets to execute the attack."
  ]
  resources_required "[]"
  consequences "_networkx_list_start"
  consequences [
    scope "_networkx_list_start"
    scope "Integrity"
    impact "Gain Privileges"
  ]
  mitigations "Reset the built-in KRBTGT account password twice to invalidate the existence of any current Golden Tickets and any tickets derived from them."
  mitigations "Monitor system and domain logs for abnormal access."
  example_instances "_networkx_list_start"
  example_instances "Bronze Butler (also known as Tick), has been shown to leverage forged Kerberos Ticket Granting Tickets (TGTs) and Ticket Granting Service (TGS) tickets to maintain administrative access on a number of systems. [REF-584]"
  related_weaknesses "522"
  related_weaknesses "294"
  related_weaknesses "308"
  matched_cwes "522"
  matched_cwes "294"
  taxonomy_mappings "_networkx_list_start"
  taxonomy_mappings [
    taxonomy_name "ATTACK"
    entry_id "1550.003"
    entry_name "Use Alternate Authentication Material:Pass The Ticket"
  ]
  execution_flow "[]"
  node [
    id 0
    label "need_physical_access_to_the_victim_system"
  ]
]
