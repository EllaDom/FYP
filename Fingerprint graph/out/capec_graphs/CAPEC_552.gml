graph [
  directed 1
  capec_id "552"
  name "Install Rootkit "
  abstraction "Detailed"
  status "Draft"
  description "An adversary exploits a weakness in authentication to install malware that alters the functionality and information provide by targeted operating system API calls. Often referred to as rootkits, it is often used to hide the presence of programs, files, network connections, services, drivers, and other system components."
  likelihood "Medium"
  severity "High"
  related_attack_patterns "_networkx_list_start"
  related_attack_patterns [
    capec_id "542"
    nature "ChildOf"
  ]
  prerequisites "[]"
  skills_required "[]"
  resources_required "[]"
  consequences "[]"
  mitigations "_networkx_list_start"
  mitigations "Prevent adversary access to privileged accounts necessary to install rootkits."
  example_instances "A rootkit may take the form of a hypervisor. A hypervisor is a software layer that sits between the operating system and the processor. It presents a virtual running environment to the operating system. An example of a common hypervisor is Xen. Because a hypervisor operates at a level below the operating system it can hide its existence from the operating system."
  example_instances "Similar to a rootkit, a bootkit is a malware variant that modifies the boot sectors of a hard drive, including the Master Boot Record (MBR) and Volume Boot Record (VBR). Adversaries may use bootkits to persist on systems at a layer below the operating system, which may make it difficult to perform full remediation unless an organization suspects one was used and can act accordingly."
  related_weaknesses "_networkx_list_start"
  related_weaknesses "284"
  matched_cwes "_networkx_list_start"
  matched_cwes "284"
  taxonomy_mappings [
    taxonomy_name "ATTACK"
    entry_id "1014"
    entry_name "Rootkit"
  ]
  taxonomy_mappings [
    taxonomy_name "ATTACK"
    entry_id "1542.003"
    entry_name "Pre-OS Boot:Bootkit"
  ]
  taxonomy_mappings [
    taxonomy_name "ATTACK"
    entry_id "1547.006"
    entry_name "Boot or Logon Autostart Execution:Kernel Modules and Extensions"
  ]
  execution_flow "[]"
  node [
    id 0
    label "take_the_form_of_a_hypervisor"
  ]
  node [
    id 1
    label "present_a_virtual_running_environment"
  ]
  node [
    id 2
    label "modify_the_boot_sectors_of_a_hard_drive"
  ]
  edge [
    source 0
    target 1
  ]
  edge [
    source 1
    target 2
  ]
]
