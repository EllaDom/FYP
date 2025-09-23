graph [
  directed 1
  capec_id "540"
  name "Overread Buffers"
  abstraction "Standard"
  status "Draft"
  description "An adversary attacks a target by providing input that causes an application to read beyond the boundary of a defined buffer. This typically occurs when a value influencing where to start or stop reading is set to reflect positions outside of the valid memory location of the buffer. This type of attack may result in exposure of sensitive information, a system crash, or arbitrary code execution."
  likelihood "Low"
  severity "High"
  related_attack_patterns "_networkx_list_start"
  related_attack_patterns [
    capec_id "123"
    nature "ChildOf"
  ]
  prerequisites "_networkx_list_start"
  prerequisites "For this type of attack to be successful, a few prerequisites must be met. First, the targeted software must be written in a language that enables fine grained buffer control. (e.g., c, c++) Second, the targeted software must actually perform buffer operations and inadequately perform bounds-checking on those buffer operations. Finally, the adversary must have the capability to influence the input that guides these buffer operations."
  skills_required "[]"
  resources_required "[]"
  consequences [
    scope "_networkx_list_start"
    scope "Confidentiality"
    impact "Read Data"
  ]
  consequences [
    scope "_networkx_list_start"
    scope "Availability"
    impact "Unreliable Execution"
  ]
  mitigations "[]"
  example_instances "[]"
  related_weaknesses "_networkx_list_start"
  related_weaknesses "125"
  matched_cwes "_networkx_list_start"
  matched_cwes "125"
  taxonomy_mappings "[]"
  execution_flow [
    step "1"
    phase "Explore"
    description "[Identify target application] The adversary identifies a target application or program to perform the buffer overread on. Adversaries often look for applications that accept user input and that perform manual memory management."
    techniques "[]"
  ]
  execution_flow [
    step "2"
    phase "Experiment"
    description "[Find attack vector] The adversary identifies an attack vector by looking for areas in the application where they can specify to read more data than is required."
    techniques "[]"
  ]
  execution_flow [
    step "3"
    phase "Exploit"
    description "[Overread the buffer] The adversary provides input to the application that gets it to read past the bounds of a buffer, possibly revealing sensitive information that was not intended to be given to the adversary."
    techniques "[]"
  ]
  node [
    id 0
    label "identify_target_application"
  ]
  node [
    id 1
    label "find_attack_vector"
  ]
  node [
    id 2
    label "overread_the_buffer"
  ]
  node [
    id 3
    label "meet_for_this_type_of_attack_to_be_successful"
  ]
  node [
    id 4
    label "influence_the_input_to_buffer_operations"
  ]
  edge [
    source 0
    target 0
  ]
  edge [
    source 0
    target 1
  ]
  edge [
    source 1
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
]
