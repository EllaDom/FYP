graph [
  directed 1
  capec_id "110"
  name "SQL Injection through SOAP Parameter Tampering"
  abstraction "Detailed"
  status "Draft"
  description "An attacker modifies the parameters of the SOAP message that is sent from the service consumer to the service provider to initiate a SQL injection attack. On the service provider side, the SOAP message is parsed and parameters are not properly validated before being used to access a database in a way that does not use parameter binding, thus enabling the attacker to control the structure of the executed SQL query. This pattern describes a SQL injection attack with the delivery mechanism being a SOAP message."
  likelihood "High"
  severity "Very High"
  related_attack_patterns [
    capec_id "66"
    nature "ChildOf"
  ]
  related_attack_patterns [
    capec_id "108"
    nature "CanPrecede"
  ]
  prerequisites "SOAP messages are used as a communication mechanism in the system"
  prerequisites "SOAP parameters are not properly validated at the service provider"
  prerequisites "The service provider does not properly utilize parameter binding when building SQL queries"
  skills_required [
    level "Medium"
    description "If the attacker is able to gain good understanding of the system's database schema"
  ]
  skills_required [
    level "High"
    description "If the attacker has to perform Blind SQL Injection"
  ]
  resources_required "_networkx_list_start"
  resources_required "None: No specialized resources are required to execute this type of attack."
  consequences [
    scope "_networkx_list_start"
    scope "Integrity"
    impact "Modify Data"
  ]
  consequences [
    scope "_networkx_list_start"
    scope "Availability"
    impact "Unreliable Execution"
  ]
  consequences [
    scope "_networkx_list_start"
    scope "Confidentiality"
    impact "Read Data"
  ]
  consequences [
    scope "Confidentiality"
    scope "Access Control"
    scope "Authorization"
    impact "Gain Privileges"
  ]
  consequences [
    scope "Confidentiality"
    scope "Integrity"
    scope "Availability"
    impact "Execute Unauthorized Commands"
  ]
  mitigations "Properly validate and sanitize/reject user input at the service provider."
  mitigations "Ensure that prepared statements or other mechanism that enables parameter binding is used when accessing the database in a way that would prevent the attackers' supplied data from controlling the structure of the executed query."
  mitigations "At the database level, ensure that the database user used by the application in a particular context has the minimum needed privileges to the database that are needed to perform the operation. When possible, run queries against pre-generated views rather than the tables directly."
  example_instances "_networkx_list_start"
  example_instances "An attacker uses a travel booking system that leverages SOAP communication between the client and the travel booking service. An attacker begins to tamper with the outgoing SOAP messages by modifying their parameters to include characters that would break a dynamically constructed SQL query. They notice that the system fails to respond when these malicious inputs are injected in certain parameters transferred in a SOAP message. The attacker crafts a SQL query that modifies their payment amount in the travel system's database and passes it as one of the parameters . A backend batch payment system later fetches the payment amount from the database (the modified payment amount) and sends to the credit card processor, enabling the attacker to purchase the airfare at a lower price. An attacker needs to have some knowledge of the system's database, perhaps by exploiting another weakness that results in information disclosure."
  related_weaknesses "89"
  related_weaknesses "20"
  matched_cwes "20"
  matched_cwes "89"
  taxonomy_mappings "[]"
  execution_flow [
    step "1"
    phase "Explore"
    description "[Detect Incorrect SOAP Parameter Handling] The attacker tampers with the SOAP message parameters and looks for indications that the tampering caused a change in behavior of the targeted application."
    techniques "_networkx_list_start"
    techniques "The attacker tampers with the SOAP message parameters by injecting some special characters such as single quotes, double quotes, semi columns, etc. The attacker observes system behavior."
  ]
  execution_flow [
    step "2"
    phase "Experiment"
    description "[Probe for SQL Injection vulnerability] The attacker injects SQL syntax into vulnerable SOAP parameters identified during the Explore phase to search for unfiltered execution of the SQL syntax in a query."
    techniques "[]"
  ]
  execution_flow [
    step "3"
    phase "Exploit"
    description "[Inject SQL via SOAP Parameters] The attacker injects SQL via SOAP parameters identified as vulnerable during Explore phase to launch a first or second order SQL injection attack."
    techniques "_networkx_list_start"
    techniques "An attacker performs a SQL injection attack via the usual methods leveraging SOAP parameters as the injection vector. An attacker has to be careful not to break the XML parser at the service provider which may prevent the payload getting through to the SQL query. The attacker may also look at the WSDL for the web service (if available) to better understand what is expected by the service provider."
  ]
  node [
    id 0
    label "detect_incorrect_soap_parameter_handling"
  ]
  node [
    id 1
    label "observe_system_behavior"
  ]
  node [
    id 2
    label "inject_sql_syntax_into_vulnerable_soap_parameters_identified_during_the_explore_phase_to_search_for_unfiltered_execution_of_the_sql_syntax_in_a_query"
  ]
  node [
    id 3
    label "perform_sql_injection"
  ]
  node [
    id 4
    label "perform_a_sql_injection_attack_via_the_usual_methods_leveraging_soap_parameters_as_the_injection_vector"
  ]
  node [
    id 5
    label "break_the_xml_parser"
  ]
  node [
    id 6
    label "look_to_better_understand_what_is_expected_by_the_service_provider"
  ]
  node [
    id 7
    label "leverage_soap_communication_between_the_client_and_the_travel_booking_service"
  ]
  node [
    id 8
    label "begin_to_tamper_with_the_outgoing_soap_messages_by_modifying_their_parameters_to_include_characters_that_would_break_a_dynamically_constructed_sql_query"
  ]
  node [
    id 9
    label "craft_a_sql_query_that_modifies_their_payment_amount_in_the_travel_system_s_database_and_passes_it_as_one_of_the_parameters"
  ]
  node [
    id 10
    label "fetch_the_payment_amount"
  ]
  node [
    id 11
    label "need_to_have_some_knowledge_of_the_system_s_database"
  ]
  node [
    id 12
    label "use_soap_messages"
  ]
  node [
    id 13
    label "utilize_parameter_binding"
  ]
  edge [
    source 0
    target 1
  ]
  edge [
    source 0
    target 13
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
  edge [
    source 10
    target 11
  ]
  edge [
    source 11
    target 12
  ]
  edge [
    source 12
    target 0
  ]
]
