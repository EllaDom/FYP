graph [
  directed 1
  capec_id "665"
  name "Exploitation of Thunderbolt Protection Flaws"
  abstraction "Detailed"
  status "Stable"
  description "&#10;            "
  likelihood "Low"
  severity "Very High"
  related_attack_patterns [
    capec_id "276"
    nature "ChildOf"
  ]
  related_attack_patterns [
    capec_id "390"
    nature "CanFollow"
  ]
  related_attack_patterns [
    capec_id "458"
    nature "PeerOf"
  ]
  related_attack_patterns [
    capec_id "148"
    nature "PeerOf"
  ]
  related_attack_patterns [
    capec_id "151"
    nature "PeerOf"
  ]
  prerequisites "_networkx_list_start"
  prerequisites "The adversary needs at least a few minutes of physical access to a system with an open Thunderbolt port, version 3 or lower, and an external thunderbolt device controlled by the adversary with maliciously crafted software and firmware, via an SPI Programming device, to exploit weaknesses in security protections."
  skills_required [
    level "High"
    description "Detailed knowledge on various system motherboards, PCI Express Domain, SPI, and Thunderbolt Protocol in order to interface with internal system components via external devices."
  ]
  skills_required [
    level "High"
    description "Detailed knowledge on OS/Kernel memory address space, Direct Memory Access (DMA) mapping, Input-Output Memory Management Units (IOMMUs), and vendor memory protections for data leakage."
  ]
  skills_required [
    level "High"
    description "Detailed knowledge on scripting and SPI programming in order to configure and modify Thunderbolt controller firmware and software configurations."
  ]
  resources_required "SPI Programming device capable of modifying/configuring or replacing the firmware of Thunderbolt device stored on SPI Flash of target Thunderbolt controller, as well as modification/spoofing of adversary-controlled Thunderbolt controller."
  resources_required "Precrafted scripts/tools capable of implementing the modification and replacement of Thunderbolt Firmware."
  resources_required "Thunderbolt-enabled computing device capable of interfacing with target Thunderbolt device and extracting/dumping data and memory contents of target device."
  consequences [
    scope "_networkx_list_start"
    scope "Access Control"
    impact "Bypass Protection Mechanism"
  ]
  consequences [
    scope "_networkx_list_start"
    scope "Confidentiality"
    impact "Read Data"
  ]
  consequences [
    scope "_networkx_list_start"
    scope "Integrity"
    impact "Modify Data"
  ]
  consequences [
    scope "_networkx_list_start"
    scope "Authorization"
    impact "Execute Unauthorized Commands"
  ]
  mitigations "Implementation: Kernel Direct Memory Access Protection"
  mitigations "Configuration: Enable UEFI option USB Passthrough mode - Thunderbolt 3 system port operates as USB 3.1 Type C interface"
  mitigations "Configuration: Enable UEFI option DisplayPort mode - Thunderbolt 3 system port operates as video-only DP interface"
  mitigations "Configuration: Enable UEFI option Mixed USB/DisplayPort mode - Thunderbolt 3 system port operates as USB 3.1 Type C interface with support for DP mode"
  mitigations "Configuration: Set Security Level to SL3 for Thunderbolt 2 system port"
  mitigations "Configuration: Disable PCIe tunneling to set Security Level to SL3"
  mitigations "Configuration: Disable Boot Camp upon MacOS systems"
  example_instances "_networkx_list_start"
  example_instances "An adversary steals a password protected laptop that contains a Thunderbolt 3 enabled port, from a work environment. The adversary uses a screw driver to remove the back panel of the laptop and connects a SPI Programming device to the Thunderbolt Host Controller SPI Flash of the stolen victim device to interface with it on the adversary's own Thunderbolt enabled device via Thunderbolt cables. The SPI Programming device is utilized to execute scripts/tools from the adversary's own system to copy, parse, and modify the victim's Thunderbolt firmware stored on SPI Flash. The device UUID value is obtained, by computing the appropriate offset based upon Thunderbolt firmware version and the OS of victim device, from the DROM section of victim Thunderbolt host controller firmware image. The firmware image is written to adversary Thunderbolt host controller SPI flash to clone and spoof victim device identity. The adversary reboots the victim device, with the victim device identifying the Thunderbolt connection of the adversary's Thunderbolt device as itself and enables PCIe tunneling. The adversary finally transfers the hard drive and memory contents of victim device across Thunderbolt connection."
  related_weaknesses "345"
  related_weaknesses "353"
  related_weaknesses "288"
  related_weaknesses "1188"
  related_weaknesses "862"
  matched_cwes "288"
  matched_cwes "345"
  matched_cwes "862"
  matched_cwes "1188"
  taxonomy_mappings [
    taxonomy_name "ATTACK"
    entry_id "1211"
    entry_name "Exploitation for Defensive Evasion"
  ]
  taxonomy_mappings [
    taxonomy_name "ATTACK"
    entry_id "1542.002"
    entry_name "Pre-OS Boot: Component Firmware"
  ]
  taxonomy_mappings [
    taxonomy_name "ATTACK"
    entry_id "1556"
    entry_name "Modify Authentication Process"
  ]
  execution_flow [
    step "1"
    phase "Explore"
    description "[Survey physical victim environment and potential Thunderbolt system targets] The adversary monitors the target's physical environment to identify systems with Thunderbolt interfaces, identify potential weaknesses in physical security in addition to periods of nonattendance by the victim over their Thunderbolt interface equipped devices, and when the devices are in locked or sleep state."
    techniques "[]"
  ]
  execution_flow [
    step "2"
    phase "Explore"
    description "[Evaluate the target system and its Thunderbolt interface] The adversary determines the device's operating system, Thunderbolt interface version, and any implemented Thunderbolt protections to plan the attack."
    techniques "[]"
  ]
  execution_flow [
    step "1"
    phase "Experiment"
    description "[Obtain and/or clone firmware image] The adversary physically manipulates Thunderbolt enabled devices to acquire the firmware image from the target and/or adversary Thunderbolt host controller's SPI (Serial Peripheral Interface) flash."
    techniques "Disassemble victim and/or adversary device enclosure with basic tools to gain access to Thunderbolt controller SPI flash by connecting adversary SPI programmer."
    techniques "Adversary connects SPI programmer to adversary-controlled Thunderbolt enabled device to obtain/clone victim thunderbolt controller firmware image through tools/scripts."
    techniques "Clone firmware image with SPI programmer and tools/scripts on adversary-controlled device."
  ]
  execution_flow [
    step "2"
    phase "Experiment"
    description "[Parse and locate relevant firmware data structures and information based upon Thunderbolt controller model, firmware version, and other information] The acquired victim and/or adversary firmware image is parsed for specific data and other relevant identifiers required for exploitation, based upon the victim device information and firmware version."
    techniques "Utilize pre-crafted tools/scripts to parse and locate desired firmware data and modify it."
    techniques "Locate DROM (Device Read Only Memory) data structure section and calculate/determine appropriate offset to replicate victim device UUID."
    techniques "Locate ACL (Access Control List) data structure and calculate/determine appropriate offsets to identify victim device UUID."
    techniques "Locate data structure containing challenge-response key information between appropriate offsets."
  ]
  execution_flow [
    step "3"
    phase "Experiment"
    description "[Disable Thunderbolt security and prevent future Thunderbolt security modifications (if necessary)] The adversary overrides the target device's Thunderbolt Security Level to &#34;None&#34; (SL0) and/or enables block protections upon the SPI flash to prevent the ability for the victim to perform and/or recognize future Thunderbolt security modifications as well as update the Thunderbolt firmware."
    techniques "_networkx_list_start"
    techniques "The adversary-controlled Thunderbolt device, connected to SPI programmer and victim device via Thunderbolt ports, is utilized to execute commands within tools/scripts to disable SPI flash protections, modify Thunderbolt Security Level, and enable malicious SPI flash protections."
  ]
  execution_flow [
    step "4"
    phase "Experiment"
    description "[Modify/replace victim Thunderbolt firmware image] The modified victim and/or adversary thunderbolt firmware image is written to attacker SPI flash."
    techniques "[]"
  ]
  execution_flow [
    step "1"
    phase "Exploit"
    description "[Connect adversary-controlled thunderbolt enabled device to victim device and verify successful execution of malicious actions] The adversary needs to determine if their exploitation of selected vulnerabilities had the intended effects upon victim device."
    techniques "Observe victim device identify adversary device as the victim device and enables PCIe tunneling."
    techniques "Resume victim device from sleep, connect adversary-controlled device and observe security is disabled and Thunderbolt connectivity is restored with PCIe tunneling being enabled."
    techniques "Observe that in UEFI or Thunderbolt Management Tool/UI that the Security Level does not match adversary modified Security Level of &#34;None&#34; (SL0)"
    techniques "Observe after installation of Firmware update that within Thunderbolt Management UI the &#34;NVM version&#34; is unchanged/same prior to the prompt of successful Firmware update/installation."
  ]
  execution_flow [
    step "2"
    phase "Exploit"
    description "[Exfiltration of desired data from victim device to adversary device] Utilize PCIe tunneling to transfer desired data and information from victim device across Thunderbolt connection."
    techniques "[]"
  ]
  node [
    id 0
    label "monitor_the_target_s_physical_environment"
  ]
  node [
    id 1
    label "evaluate_the_target_system_and_its_thunderbolt_interface"
  ]
  node [
    id 2
    label "determine_the_device_s_operating_system_thunderbolt_interface_version_and_any_implemented_thunderbolt_protections_to_plan_the_attack"
  ]
  node [
    id 3
    label "gain_access_to_thunderbolt_controller_spi_flash"
  ]
  node [
    id 4
    label "connect_spi_programmer"
  ]
  node [
    id 5
    label "determine_appropriate_offset_to_replicate_victim_device_uuid"
  ]
  node [
    id 6
    label "contain_challenge_response_key_information_between_appropriate_offsets"
  ]
  node [
    id 7
    label "prevent_future_thunderbolt_security_modifications"
  ]
  node [
    id 8
    label "need_to_determine_if_their_exploitation_of_selected_vulnerabilities_had_the_intended_effects_upon_victim_device"
  ]
  node [
    id 9
    label "resume_victim_device"
  ]
  node [
    id 10
    label "remove_the_back_panel_of_the_laptop"
  ]
  node [
    id 11
    label "obtain_the_device_uuid_value"
  ]
  node [
    id 12
    label "write_the_firmware_image"
  ]
  node [
    id 13
    label "transfer_the_hard_drive_and_memory_contents_of_victim_device"
  ]
  node [
    id 14
    label "need_at_least_a_few_minutes_of_physical_access_to_a_system_with_an_open_thunderbolt_port"
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
    target 4
  ]
  edge [
    source 4
    target 5
  ]
  edge [
    source 4
    target 11
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
    target 7
  ]
  edge [
    source 7
    target 8
  ]
  edge [
    source 8
    target 9
  ]
  edge [
    source 9
    target 10
  ]
  edge [
    source 9
    target 13
  ]
  edge [
    source 10
    target 4
  ]
  edge [
    source 11
    target 12
  ]
  edge [
    source 12
    target 9
  ]
  edge [
    source 13
    target 14
  ]
]
