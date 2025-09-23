graph [
  directed 1
  capec_id "175"
  name "Code Inclusion"
  abstraction "Meta"
  status "Stable"
  description "An adversary exploits a weakness on the target to force arbitrary code to be retrieved locally or from a remote location and executed. This differs from code injection in that code injection involves the direct inclusion of code while code inclusion involves the addition or replacement of a reference to a code file, which is subsequently loaded by the target and used as part of the code of some application."
  likelihood "Medium"
  severity "Very High"
  related_attack_patterns "[]"
  prerequisites "The target application must include external code/libraries that are executed when the application runs and the adversary must be able to influence the specific files that get included."
  prerequisites "The victim must run the targeted application, possibly using the crafted parameters that the adversary uses to identify the code to include."
  skills_required "[]"
  resources_required "_networkx_list_start"
  resources_required "The adversary may need the capability to host code modules if they wish their own code files to be included."
  consequences "[]"
  mitigations "[]"
  example_instances "_networkx_list_start"
  example_instances "One example of this type of attack pattern is PHP file include attacks where the parameter of an include() function is set by a variable that an attacker is able to control. The result is that arbitrary code could be loaded into the PHP application and executed."
  related_weaknesses "_networkx_list_start"
  related_weaknesses "829"
  matched_cwes "_networkx_list_start"
  matched_cwes "829"
  taxonomy_mappings "[]"
  execution_flow "[]"
  node [
    id 0
    label "include_attacks_where_the_parameter_of_an_include_function_is_set_by_a_variable_that_an_attacker_is_able_to_control"
  ]
  node [
    id 1
    label "load_arbitrary_code"
  ]
  node [
    id 2
    label "include_external_code_libraries_that_are_executed_when_the_application_runs_and"
  ]
  node [
    id 3
    label "run_the_targeted_application"
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
