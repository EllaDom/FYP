graph [
  directed 1
  capec_id "667"
  name "Bluetooth Impersonation AttackS (BIAS)"
  abstraction "Detailed"
  status "Draft"
  description "An adversary disguises the MAC address of their Bluetooth enabled device to one for which there exists an active and trusted connection and authenticates successfully. The adversary can then perform malicious actions on the target Bluetooth device depending on the target&#8217;s capabilities."
  likelihood "Medium"
  severity "High"
  related_attack_patterns "_networkx_list_start"
  related_attack_patterns [
    capec_id "616"
    nature "ChildOf"
  ]
  prerequisites "_networkx_list_start"
  prerequisites "Knowledge of a target device's list of trusted connections."
  skills_required [
    level "Low"
    description "Adversaries must be capable of using command line Linux tools."
  ]
  skills_required [
    level "Low"
    description "Adversaries must be in close proximity to Bluetooth devices."
  ]
  resources_required "[]"
  consequences [
    scope "_networkx_list_start"
    scope "Integrity"
    impact ""
  ]
  consequences [
    scope "_networkx_list_start"
    scope "Confidentiality"
    impact ""
  ]
  mitigations "Disable Bluetooth in public places."
  mitigations "Verify incoming Bluetooth connections; do not automatically trust."
  mitigations "Change default PIN passwords and always use one when connecting."
  example_instances "[]"
  related_weaknesses "_networkx_list_start"
  related_weaknesses "290"
  matched_cwes "_networkx_list_start"
  matched_cwes "290"
  taxonomy_mappings "[]"
  execution_flow [
    step "1"
    phase "Explore"
    description "[Find disguise and target] The adversary starts the Bluetooth service on the attacking device and searches for nearby listening devices."
    techniques "Knowledge of a trusted MAC address."
    techniques "Scanning for devices other than the target that may be trusted."
  ]
  execution_flow [
    step "2"
    phase "Experiment"
    description "[Disguise] Using the MAC address of the device the adversary wants to impersonate, they may use a tool such as spooftooth or macchanger to spoof their Bluetooth address and attempt to authenticate with the target."
    techniques "[]"
  ]
  execution_flow [
    step "3"
    phase "Exploit"
    description "[Use device capabilities to accomplish goal] Finally, if authenticated successfully the adversary can perform tasks/information gathering dependent on the target's capabilities and connections."
    techniques "[]"
  ]
  node [
    id 0
    label "find_disguise_and_target"
  ]
  node [
    id 1
    label "start_the_bluetooth_service_on_the_attacking_device_and_searches_for_nearby_listening_devices"
  ]
  node [
    id 2
    label "want_to_impersonate"
  ]
  node [
    id 3
    label "accomplish_goal"
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
]
