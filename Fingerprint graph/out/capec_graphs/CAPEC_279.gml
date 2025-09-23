graph [
  directed 1
  capec_id "279"
  name "SOAP Manipulation"
  abstraction "Detailed"
  status "Draft"
  description "Simple Object Access Protocol (SOAP) is used as a communication protocol between a client and server to invoke web services on the server. It is an XML-based protocol, and therefore suffers from many of the same shortcomings as other XML-based protocols. Adversaries can make use of these shortcomings and manipulate the content of SOAP paramters, leading to undesirable behavior on the server and allowing the adversary to carry out a number of further attacks."
  likelihood "Medium"
  severity "High"
  related_attack_patterns [
    capec_id "278"
    nature "ChildOf"
  ]
  related_attack_patterns [
    capec_id "110"
    nature "CanPrecede"
  ]
  related_attack_patterns [
    capec_id "228"
    nature "CanPrecede"
  ]
  prerequisites "An application uses SOAP-based web service api."
  prerequisites "An application does not perform sufficient input validation to ensure that user-controllable data is safe for an XML parser."
  prerequisites "The targeted server either fails to verify that data in SOAP messages conforms to the appropriate XML schema, or it fails to correctly handle the complete range of data allowed by the schema."
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
  mitigations "[]"
  example_instances "[]"
  related_weaknesses "_networkx_list_start"
  related_weaknesses "707"
  matched_cwes "_networkx_list_start"
  matched_cwes "707"
  taxonomy_mappings "[]"
  execution_flow [
    step "1"
    phase "Exploit"
    description "[Find target application] The adversary needs to identify an application that uses SOAP as a communication protocol."
    techniques "_networkx_list_start"
    techniques "Observe HTTP traffic to an application and look for SOAP headers."
  ]
  execution_flow [
    step "2"
    phase "Experiment"
    description "[Detect Incorrect SOAP Parameter Handling] The adversary tampers with the SOAP message parameters and looks for indications that the tampering caused a change in behavior of the targeted application."
    techniques "Send more data than would seem reasonable for a field and see if the server complains."
    techniques "Send nonsense data in a field that expects a certain subset, such as product names or sequence numbers, and see if the server complains."
    techniques "Send XML metacharacters as data and see how the server responds."
  ]
  execution_flow [
    step "3"
    phase "Exploit"
    description "[Manipulate SOAP parameters] The adversary manipulates SOAP parameters in a way that causes undesirable behavior for the server. This can result in denial of service, information disclosure, arbitrary code exection, and more."
    techniques "Create a recursive XML payload that will take up all of the memory on the server when parsed, resulting in a denial of service. This is known as the billion laughs attack."
    techniques "Insert XML metacharacters into data fields that could cause the server to go into an error state when parsing. This could lead to a denial of service."
    techniques "Insert a large amount of data into a field that should have a character limit, causing a buffer overflow."
  ]
  node [
    id 0
    label "identify_target_application"
  ]
  node [
    id 1
    label "need_to_identify_an_application_that_uses_soap_as_a_communication_protocol"
  ]
  node [
    id 2
    label "continue_the_monitoring_of_http_traffic"
  ]
  node [
    id 3
    label "detect_incorrect_soap_parameter_handling"
  ]
  node [
    id 4
    label "send_more_data"
  ]
  node [
    id 5
    label "send_xml_metacharacters"
  ]
  node [
    id 6
    label "manipulate_soap_parameters"
  ]
  node [
    id 7
    label "create_a_recursive_xml_payload_that_will_take_up_all_of_the_memory_on_the_server_when_parsed_resulting_in_a_denial_of_service"
  ]
  node [
    id 8
    label "know_this"
  ]
  node [
    id 9
    label "overflow_the_buffer"
  ]
  node [
    id 10
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
  edge [
    source 3
    target 4
  ]
  edge [
    source 4
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
  edge [
    source 6
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
]
