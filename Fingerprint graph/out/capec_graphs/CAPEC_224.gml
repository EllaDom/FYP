graph [
  directed 1
  capec_id "224"
  name "Fingerprinting"
  abstraction "Meta"
  status "Stable"
  description "An adversary compares output from a target system to known indicators that uniquely identify specific details about the target. Most commonly, fingerprinting is done to determine operating system and application versions. Fingerprinting can be done passively as well as actively. Fingerprinting by itself is not usually detrimental to the target. However, the information gathered through fingerprinting often enables an adversary to discover existing weaknesses in the target."
  likelihood "High"
  severity "Very Low"
  related_attack_patterns "[]"
  prerequisites "_networkx_list_start"
  prerequisites "A means by which to interact with the target system directly."
  skills_required "_networkx_list_start"
  skills_required [
    level "Medium"
    description "Some fingerprinting activity requires very specific knowledge of how different operating systems respond to various TCP/IP requests. Application fingerprinting can be as easy as envoking the application with the correct command line argument, or mouse clicking in the appropriate place on the screen."
  ]
  resources_required "_networkx_list_start"
  resources_required "If on a network, the adversary needs a tool capable of viewing network communications at the packet level and with header information, like Mitmproxy, Wireshark, or Fiddler."
  consequences "_networkx_list_start"
  consequences [
    scope "_networkx_list_start"
    scope "Confidentiality"
    impact "Read Data"
  ]
  mitigations "_networkx_list_start"
  mitigations "While some information is shared by systems automatically based on standards and protocols, remove potentially sensitive information that is not necessary for the application's functionality as much as possible."
  example_instances "[]"
  related_weaknesses "_networkx_list_start"
  related_weaknesses "200"
  matched_cwes "_networkx_list_start"
  matched_cwes "200"
  taxonomy_mappings "_networkx_list_start"
  taxonomy_mappings [
    taxonomy_name "WASC"
    entry_id "45"
    entry_name "Fingerprinting"
  ]
  execution_flow "[]"
]
