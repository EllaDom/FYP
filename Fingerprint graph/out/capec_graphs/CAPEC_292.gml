graph [
  directed 1
  capec_id "292"
  name "Host Discovery"
  abstraction "Standard"
  status "Stable"
  description "An adversary sends a probe to an IP address to determine if the host is alive. Host discovery is one of the earliest phases of network reconnaissance. The adversary usually starts with a range of IP addresses belonging to a target network and uses various methods to determine if a host is present at that IP address. Host discovery is usually referred to as 'Ping' scanning using a sonar analogy. The goal is to send a packet through to the IP address and solicit a response from the host. As such, a 'ping' can be virtually any crafted packet whatsoever, provided the adversary can identify a functional host based on its response. An attack of this nature is usually carried out with a 'ping sweep,' where a particular kind of ping is sent to a range of IP addresses."
  likelihood ""
  severity "Low"
  related_attack_patterns "_networkx_list_start"
  related_attack_patterns [
    capec_id "169"
    nature "ChildOf"
  ]
  prerequisites "_networkx_list_start"
  prerequisites "The adversary requires logical access to the target network in order to carry out host discovery."
  skills_required "[]"
  resources_required "_networkx_list_start"
  resources_required "The resources required will differ based upon the type of host discovery being performed. Usually a network scanning tool or scanning script is required due to the volume of requests that must be generated."
  consequences [
    scope "_networkx_list_start"
    scope "Confidentiality"
    impact "Other"
  ]
  consequences [
    scope "Confidentiality"
    scope "Access Control"
    scope "Authorization"
    impact "Bypass Protection Mechanism"
  ]
  mitigations "[]"
  example_instances "[]"
  related_weaknesses "_networkx_list_start"
  related_weaknesses "200"
  matched_cwes "_networkx_list_start"
  matched_cwes "200"
  taxonomy_mappings "_networkx_list_start"
  taxonomy_mappings [
    taxonomy_name "ATTACK"
    entry_id "1018"
    entry_name "Remote System Discovery"
  ]
  execution_flow "[]"
  node [
    id 0
    label "require_logical_access_to_the_target_network"
  ]
]
