graph [
  directed 1
  capec_id "230"
  name "Serialized Data with Nested Payloads"
  abstraction "Standard"
  status "Draft"
  description "Applications often need to transform data in and out of a data format (e.g., XML and YAML) by using a parser. It may be possible for an adversary to inject data that may have an adverse effect on the parser when it is being processed. Many data format languages allow the definition of macro-like structures that can be used to simplify the creation of complex structures. By nesting these structures, causing the data to be repeatedly substituted, an adversary can cause the parser to consume more resources while processing, causing excessive memory consumption and CPU utilization."
  likelihood "Medium"
  severity "High"
  related_attack_patterns "_networkx_list_start"
  related_attack_patterns [
    capec_id "130"
    nature "ChildOf"
  ]
  prerequisites "An application's user-controllable data is expressed in a language that supports subsitution."
  prerequisites "An application does not perform sufficient validation to ensure that user-controllable data is not malicious."
  skills_required "[]"
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
  mitigations "Carefully validate and sanitize all user-controllable data prior to passing it to the data parser routine. Ensure that the resultant data is safe to pass to the data parser."
  mitigations "Perform validation on canonical data."
  mitigations "Pick a robust implementation of the data parser."
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
    description "An adversary determines the input data stream that is being processed by a data parser that supports using substitution on the victim's side."
    techniques "[]"
  ]
  execution_flow [
    step "2"
    phase "Exploit"
    description "An adversary crafts input data that may have an adverse effect on the operation of the parser when the data is parsed on the victim's system."
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
