graph [
  directed 1
  capec_id "231"
  name "Oversized Serialized Data Payloads"
  abstraction "Standard"
  status "Draft"
  description "An adversary injects oversized serialized data payloads into a parser during data processing to produce adverse effects upon the parser such as exhausting system resources and arbitrary code execution."
  likelihood "Medium"
  severity "High"
  related_attack_patterns "_networkx_list_start"
  related_attack_patterns [
    capec_id "130"
    nature "ChildOf"
  ]
  prerequisites "An application uses an parser for serialized data to perform transformation on user-controllable data."
  prerequisites "An application does not perform sufficient validation to ensure that user-controllable data is safe for a data parser."
  skills_required [
    level "Low"
    description "Denial of service"
  ]
  skills_required [
    level "High"
    description "Arbitrary code execution"
  ]
  resources_required "[]"
  consequences [
    scope "_networkx_list_start"
    scope "Availability"
    impact "Resource Consumption"
  ]
  consequences [
    scope "_networkx_list_start"
    scope "Confidentiality"
    impact "Read Data"
  ]
  consequences [
    scope "Confidentiality"
    scope "Integrity"
    scope "Availability"
    impact "Execute Unauthorized Commands"
  ]
  consequences [
    scope "Confidentiality"
    scope "Access Control"
    scope "Authorization"
    impact "Gain Privileges"
  ]
  mitigations "Carefully validate and sanitize all user-controllable serialized data prior to passing it to the parser routine. Ensure that the resultant data is safe to pass to the parser."
  mitigations "Perform validation on canonical data."
  mitigations "Pick a robust implementation of the serialized data parser."
  mitigations "Validate data against a valid schema or DTD prior to parsing."
  example_instances "[]"
  related_weaknesses "112"
  related_weaknesses "20"
  related_weaknesses "674"
  related_weaknesses "770"
  matched_cwes "20"
  matched_cwes "112"
  taxonomy_mappings "[]"
  execution_flow [
    step "1"
    phase "Explore"
    description "An adversary determines the input data stream that is being processed by an serialized data parser on the victim's side."
    techniques "[]"
  ]
  execution_flow [
    step "2"
    phase "Experiment"
    description "An adversary crafts input data that may have an adverse effect on the operation of the data parser when the data is parsed on the victim's system."
    techniques "[]"
  ]
  node [
    id 0
    label "determine_the_input_data_stream_that_is_being_processed_by_a_data_parser_that_supports_using_substitution_on_the_victim_s_side"
  ]
  node [
    id 1
    label "input_data_that_may_have_an_adverse_effect_on_the_operation_of_the_parser_when_the_data_is_parsed_on_the_victim_s_system"
  ]
  node [
    id 2
    label "express_an_application_s_user_controllable_data"
  ]
  node [
    id 3
    label "perform_sufficient_validation"
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
