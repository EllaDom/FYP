graph [
  directed 1
  capec_id "647"
  name "Collect Data from Registries"
  abstraction "Detailed"
  status "Draft"
  description "An adversary exploits a weakness in authorization to gather system-specific data and sensitive information within a registry (e.g., Windows Registry, Mac plist). These contain information about the system configuration, software, operating system, and security. The adversary can leverage information gathered in order to carry out further attacks."
  likelihood "Medium"
  severity "Medium"
  related_attack_patterns "_networkx_list_start"
  related_attack_patterns [
    capec_id "150"
    nature "ChildOf"
  ]
  prerequisites "The adversary must have obtained logical access to the system by some means (e.g., via obtained credentials or planting malware on the system)."
  prerequisites "The adversary must have capability to navigate the operating system to peruse the registry."
  skills_required "_networkx_list_start"
  skills_required [
    level "Low"
    description "Once the adversary has logical access (which can potentially require high knowledge and skill level), the adversary needs only the capability and facility to navigate the system through the OS graphical user interface or the command line."
  ]
  resources_required "_networkx_list_start"
  resources_required "None: No specialized resources are required to execute this type of attack."
  consequences "_networkx_list_start"
  consequences [
    scope "_networkx_list_start"
    scope "Confidentiality"
    impact "Read Data"
  ]
  mitigations "Employ a robust and layered defensive posture in order to prevent unauthorized users on your system."
  mitigations "Employ robust identification and audit/blocking via using an allowlist of applications on your system. Unnecessary applications, utilities, and configurations will have a presence in the system registry that can be leveraged by an adversary through this attack pattern."
  example_instances "[]"
  related_weaknesses "_networkx_list_start"
  related_weaknesses "285"
  matched_cwes "_networkx_list_start"
  matched_cwes "285"
  taxonomy_mappings [
    taxonomy_name "ATTACK"
    entry_id "1005"
    entry_name "Data from Local System"
  ]
  taxonomy_mappings [
    taxonomy_name "ATTACK"
    entry_id "1012"
    entry_name "Query Registry"
  ]
  taxonomy_mappings [
    taxonomy_name "ATTACK"
    entry_id "1552.002"
    entry_name "Unsecured Credentials: Credentials in Registry"
  ]
  execution_flow [
    step "1"
    phase "Explore"
    description "[Gain logical access to system] An adversary must first gain logical access to the system it wants to gather registry information from,"
    techniques "Obtain user account credentials and access the system"
    techniques "Plant malware on the system that will give remote logical access to the adversary"
  ]
  execution_flow [
    step "2"
    phase "Experiment"
    description "[Determine if the permissions are correct] Once logical access is gained, an adversary will determine if they have the proper permissions, or are authorized, to view registry information. If they do not, they will need to escalate privileges on the system through other means"
    techniques "[]"
  ]
  execution_flow [
    step "3"
    phase "Experiment"
    description "[Peruse registry for information] Once an adversary has access to a registry, they will gather all system-specific data and sensitive information that they deem useful."
    techniques "[]"
  ]
  execution_flow [
    step "4"
    phase "Exploit"
    description "[Follow-up attack] Use any information or weaknesses found to carry out a follow-up attack"
    techniques "[]"
  ]
  node [
    id 0
    label "obtain_logical_access_to_the_system"
  ]
  node [
    id 1
    label "gain_logical_access_to_the_system_it_wants_to_gather_registry_information_from"
  ]
  node [
    id 2
    label "obtain_the_legitimate_credentials"
  ]
  node [
    id 3
    label "give_remote_logical_access_to_the_adversary"
  ]
  node [
    id 4
    label "need_if_they_do_not"
  ]
  node [
    id 5
    label "gather_all_system_specific_data_and_sensitive_information_that_they_deem_useful"
  ]
  node [
    id 6
    label "navigate_the_operating_system"
  ]
  edge [
    source 0
    target 1
  ]
  edge [
    source 0
    target 6
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
    target 0
  ]
]
