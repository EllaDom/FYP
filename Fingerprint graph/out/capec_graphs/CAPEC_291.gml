graph [
  directed 1
  capec_id "291"
  name "DNS Zone Transfers"
  abstraction "Detailed"
  status "Stable"
  description "An attacker exploits a DNS misconfiguration that permits a ZONE transfer. Some external DNS servers will return a list of IP address and valid hostnames. Under certain conditions, it may even be possible to obtain Zone data about the organization's internal network. When successful the attacker learns valuable information about the topology of the target organization, including information about particular servers, their role within the IT structure, and possibly information about the operating systems running upon the network. This is configuration dependent behavior so it may also be required to search out multiple DNS servers while attempting to find one with ZONE transfers allowed."
  likelihood ""
  severity "Low"
  related_attack_patterns "_networkx_list_start"
  related_attack_patterns [
    capec_id "309"
    nature "ChildOf"
  ]
  prerequisites "_networkx_list_start"
  prerequisites "Access to a DNS server that allows Zone transfers."
  skills_required "[]"
  resources_required "_networkx_list_start"
  resources_required "A client application capable of interacting with the DNS server or a command-line utility or web application that automates DNS interactions."
  consequences "_networkx_list_start"
  consequences [
    scope "_networkx_list_start"
    scope "Confidentiality"
    impact "Read Data"
  ]
  mitigations "[]"
  example_instances "[]"
  related_weaknesses "_networkx_list_start"
  related_weaknesses "200"
  matched_cwes "_networkx_list_start"
  matched_cwes "200"
  taxonomy_mappings "[]"
  execution_flow "[]"
  node [
    id 0
    label "allow_zone_transfers"
  ]
]
