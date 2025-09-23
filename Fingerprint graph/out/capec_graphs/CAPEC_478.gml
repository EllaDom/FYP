graph [
  directed 1
  capec_id "478"
  name "Modification of Windows Service Configuration"
  abstraction "Detailed"
  status "Usable"
  description "An adversary exploits a weakness in access control to modify the execution parameters of a Windows service. The goal of this attack is to execute a malicious binary in place of an existing service."
  likelihood "Low"
  severity "High"
  related_attack_patterns "_networkx_list_start"
  related_attack_patterns [
    capec_id "203"
    nature "ChildOf"
  ]
  prerequisites "_networkx_list_start"
  prerequisites "The adversary must have the capability to write to the Windows Registry on the targeted system."
  skills_required "[]"
  resources_required "_networkx_list_start"
  resources_required "None: No specialized resources are required to execute this type of attack."
  consequences "_networkx_list_start"
  consequences [
    scope "_networkx_list_start"
    scope "Integrity"
    impact "Execute Unauthorized Commands"
  ]
  mitigations "_networkx_list_start"
  mitigations "Ensure proper permissions are set for Registry hives to prevent users from modifying keys for system components that may lead to privilege escalation."
  example_instances "[]"
  related_weaknesses "_networkx_list_start"
  related_weaknesses "284"
  matched_cwes "_networkx_list_start"
  matched_cwes "284"
  taxonomy_mappings [
    taxonomy_name "ATTACK"
    entry_id "1574.011"
    entry_name "Hijack Execution Flow:Service Registry Permissions Weakness"
  ]
  taxonomy_mappings [
    taxonomy_name "ATTACK"
    entry_id "1543.003"
    entry_name "Create or Modify System Process:Windows Service"
  ]
  execution_flow [
    step "1"
    phase "Explore"
    description "[Determine target system] The adversary must first determine the system they wish to modify the registry of. This needs to be a windows machine as this attack only works on the windows registry."
    techniques "[]"
  ]
  execution_flow [
    step "2"
    phase "Experiment"
    description "[Gain access to the system] The adversary needs to gain access to the system in some way so that they can modify the windows registry."
    techniques "Gain physical access to a system either through shoulder surfing a password or accessing a system that is left unlocked."
    techniques "Gain remote access to a system through a variety of means."
  ]
  execution_flow [
    step "3"
    phase "Exploit"
    description "[Modify windows registry] The adversary will modify the windows registry by changing the configuration settings for a service. Specifically, the adversary will change the path settings to define a path to a malicious binary to be executed."
    techniques "[]"
  ]
  node [
    id 0
    label "identify_target"
  ]
  node [
    id 1
    label "determine_the_system_they_wish_to_modify_the_registry_of"
  ]
  node [
    id 2
    label "need_to_be_a_windows_machine_as_this_attack_only_works_on_the_windows_registry"
  ]
  node [
    id 3
    label "obtain_logical_access_to_the_system"
  ]
  node [
    id 4
    label "gain_remote_access_to_a_system"
  ]
  node [
    id 5
    label "modify_windows"
  ]
  node [
    id 6
    label "modify_the_path_variable"
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
]
