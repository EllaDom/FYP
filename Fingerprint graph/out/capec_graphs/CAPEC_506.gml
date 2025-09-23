graph [
  directed 1
  capec_id "506"
  name "Tapjacking"
  abstraction "Standard"
  status "Draft"
  description "An adversary, through a previously installed malicious application, displays an interface that misleads the user and convinces them to tap on an attacker desired location on the screen. This is often accomplished by overlaying one screen on top of another while giving the appearance of a single interface. There are two main techniques used to accomplish this. The first is to leverage transparent properties that allow taps on the screen to pass through the visible application to an application running in the background. The second is to strategically place a small object (e.g., a button or text field) on top of the visible screen and make it appear to be a part of the underlying application. In both cases, the user is convinced to tap on the screen but does not realize the application that they are interacting with."
  likelihood "Low"
  severity "Low"
  related_attack_patterns "_networkx_list_start"
  related_attack_patterns [
    capec_id "173"
    nature "ChildOf"
  ]
  prerequisites "_networkx_list_start"
  prerequisites "This pattern of attack requires the ability to execute a malicious application on the user's device. This malicious application is used to present the interface to the user and make the attack possible."
  skills_required "[]"
  resources_required "[]"
  consequences "[]"
  mitigations "[]"
  example_instances "[]"
  related_weaknesses "_networkx_list_start"
  related_weaknesses "1021"
  matched_cwes "_networkx_list_start"
  matched_cwes "1021"
  taxonomy_mappings "[]"
  execution_flow "[]"
  node [
    id 0
    label "install_a_purpose_built_malicious_application_onto_the_device_and_convince_the_user_to_execute_it"
  ]
  node [
    id 1
    label "present_the_interface"
  ]
  edge [
    source 0
    target 1
  ]
]
