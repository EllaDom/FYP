graph [
  directed 1
  capec_id "643"
  name "Identify Shared Files/Directories on System"
  abstraction "Detailed"
  status "Draft"
  description "An adversary discovers connections between systems by exploiting the target system's standard practice of revealing them in searchable, common areas. Through the identification of shared folders/drives between systems, the adversary may further their goals of locating and collecting sensitive information/files, or map potential routes for lateral movement within the network."
  likelihood "Medium"
  severity "Medium"
  related_attack_patterns [
    capec_id "309"
    nature "ChildOf"
  ]
  related_attack_patterns [
    capec_id "561"
    nature "CanPrecede"
  ]
  related_attack_patterns [
    capec_id "545"
    nature "CanPrecede"
  ]
  related_attack_patterns [
    capec_id "165"
    nature "CanPrecede"
  ]
  prerequisites "_networkx_list_start"
  prerequisites "The adversary must have obtained logical access to the system by some means (e.g., via obtained credentials or planting malware on the system)."
  skills_required "_networkx_list_start"
  skills_required [
    level "Low"
    description "Once the adversary has logical access (which can potentially require high knowledge and skill level), the adversary needs only the capability and facility to navigate the system through the OS graphical user interface or the command line. The adversary, or their malware, can simply employ a set of commands that search for shared drives on the system (e.g., net view \\remote system or net share)."
  ]
  resources_required "_networkx_list_start"
  resources_required "None: No specialized resources are required to execute this type of attack."
  consequences "_networkx_list_start"
  consequences [
    scope "_networkx_list_start"
    scope "Confidentiality"
    impact "Read Data"
  ]
  mitigations "_networkx_list_start"
  mitigations "Identify unnecessary system utilities or potentially malicious software that may contain functionality to identify network share information, and audit and/or block them by using allowlist tools."
  example_instances "[]"
  related_weaknesses "267"
  related_weaknesses "200"
  matched_cwes "_networkx_list_start"
  matched_cwes "200"
  taxonomy_mappings "_networkx_list_start"
  taxonomy_mappings [
    taxonomy_name "ATTACK"
    entry_id "1135"
    entry_name "Network Share Discovery"
  ]
  execution_flow "[]"
  node [
    id 0
    label "obtain_logical_access_to_the_system"
  ]
]
