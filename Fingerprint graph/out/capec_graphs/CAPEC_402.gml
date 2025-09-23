graph [
  directed 1
  capec_id "402"
  name "Bypassing ATA Password Security"
  abstraction "Detailed"
  status "Draft"
  description "An adversary exploits a weakness in ATA security on a drive to gain access to the information the drive contains without supplying the proper credentials. ATA Security is often employed to protect hard disk information from unauthorized access. The mechanism requires the user to type in a password before the BIOS is allowed access to drive contents. Some implementations of ATA security will accept the ATA command to update the password without the user having authenticated with the BIOS. This occurs because the security mechanism assumes the user has first authenticated via the BIOS prior to sending commands to the drive. Various methods exist for exploiting this flaw, the most common being installing the ATA protected drive into a system lacking ATA security features (a.k.a. hot swapping). Once the drive is installed into the new system the BIOS can be used to reset the drive password."
  likelihood ""
  severity ""
  related_attack_patterns "_networkx_list_start"
  related_attack_patterns [
    capec_id "401"
    nature "ChildOf"
  ]
  prerequisites "_networkx_list_start"
  prerequisites "Access to the system containing the ATA Drive so that the drive can be physically removed from the system."
  skills_required "[]"
  resources_required "[]"
  consequences "[]"
  mitigations "Avoid using ATA password security when possible."
  mitigations "Use full disk encryption to protect the entire contents of the drive or sensitive partitions on the drive."
  mitigations "Leverage third-party utilities that interface with self-encrypting drives (SEDs) to provide authentication, while relying on the SED itself for data encryption."
  example_instances "The A-FF Repair Station tool is a data recovery utility that can be used for ATA password removal (both High and Maximum level) and firmware area recovery. An adversary with access to this tool could reset the ATA password to bypass this security feature and unlock the hard drive. The adversary could then obtain any data contained within the drive. [REF-702]"
  example_instances "An adversary gains physical access to the targeted hard drive and installs it into a system that does not support ATA security features. Once the drive is installed in the feature-lacking system, the adversary is able to reset the hard drive password via the BIOS. As a result, the adversary is able to bypass ATA password security and access content on the drive."
  related_weaknesses "_networkx_list_start"
  related_weaknesses "285"
  matched_cwes "_networkx_list_start"
  matched_cwes "285"
  taxonomy_mappings "[]"
  execution_flow "[]"
  node [
    id 0
    label "use_that"
  ]
  node [
    id 1
    label "reset_the_ata_password"
  ]
  node [
    id 2
    label "obtain_any_data_contained_within_the_drive"
  ]
  node [
    id 3
    label "gain_physical_access_to_the_targeted_hard_drive"
  ]
  node [
    id 4
    label "instal_the_drive"
  ]
  node [
    id 5
    label "bypass_ata_password_security_and_access_content"
  ]
  node [
    id 6
    label "contain_the_ata_drive"
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
    source 5
    target 6
  ]
]
