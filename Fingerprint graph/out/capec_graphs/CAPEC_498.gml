graph [
  directed 1
  capec_id "498"
  name "Probe iOS Screenshots"
  abstraction "Detailed"
  status "Draft"
  description "An adversary examines screenshot images created by iOS in an attempt to obtain sensitive information. This attack targets temporary screenshots created by the underlying OS while the application remains open in the background."
  likelihood ""
  severity ""
  related_attack_patterns "_networkx_list_start"
  related_attack_patterns [
    capec_id "545"
    nature "ChildOf"
  ]
  prerequisites "_networkx_list_start"
  prerequisites "This type of an attack requires physical access to a device to either excavate the image files (potentially by leveraging a Jailbreak) or view the screenshots through the multitasking switcher (by double tapping the home button on the device)."
  skills_required "[]"
  resources_required "[]"
  consequences "[]"
  mitigations "_networkx_list_start"
  mitigations "To mitigate this type of an attack, an application that may display sensitive information should clear the screen contents before a screenshot is taken. This can be accomplished by setting the key window's hidden property to YES. This code to hide the contents should be placed in both the applicationWillResignActive() and applicationDidEnterBackground() methods."
  example_instances "[]"
  related_weaknesses "_networkx_list_start"
  related_weaknesses "359"
  matched_cwes "_networkx_list_start"
  matched_cwes "359"
  taxonomy_mappings "[]"
  execution_flow "[]"
  node [
    id 0
    label "require_physical_access_to_a_device_to_either_excavate_the_image_files_potentially_by_leveraging_a_jailbreak"
  ]
]
