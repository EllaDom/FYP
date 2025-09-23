graph [
  directed 1
  capec_id "261"
  name "Fuzzing for garnering other adjacent user/sensitive data"
  abstraction "Detailed"
  status "Draft"
  description "An adversary who is authorized to send queries to a target sends variants of expected queries in the hope that these modified queries might return information (directly or indirectly through error logs) beyond what the expected set of queries should provide."
  likelihood ""
  severity "Medium"
  related_attack_patterns "_networkx_list_start"
  related_attack_patterns [
    capec_id "54"
    nature "ChildOf"
  ]
  prerequisites "_networkx_list_start"
  prerequisites "The server must assume that the queries it receives follow specific templates and/or have fields or attributes that follow specific procedures. The server must process queries that it receives without adequately checking or sanitizing queries to ensure they follow these templates."
  skills_required "[]"
  resources_required "_networkx_list_start"
  resources_required "The attacker must have sufficient privileges to send queries to the targeted server. A normal client might limit the nature of these queries, so the attacker must either have a modified client or their own application which allows them to modify the expected queries."
  consequences "[]"
  mitigations "[]"
  example_instances "_networkx_list_start"
  example_instances "A client that queries an employee database might have templates such that the user only supplies the target's name and the template dictates the fields to be returned (location, position in the company, phone number, etc.). If the server does not verify that the query matches one of the expected templates, an attacker who is allowed to send normal queries could modify their query to try to return additional information. For this example, additional information might include social security numbers or salaries."
  related_weaknesses "_networkx_list_start"
  related_weaknesses "20"
  matched_cwes "_networkx_list_start"
  matched_cwes "20"
  taxonomy_mappings "[]"
  execution_flow [
    step "1"
    phase "Explore"
    description "[Observe communication and inputs] The fuzzing adversary observes the target system looking for inputs and communications between modules, subsystems, or systems."
    techniques "Network sniffing. Using a network sniffer such as wireshark, the adversary observes communications into and out of the target system."
    techniques "Monitor API execution. Using a tool such as ktrace, strace, APISpy, or another debugging tool, the adversary observes the system calls and API calls that are made by the target system, and the nature of their parameters."
    techniques "Observe inputs using web inspection tools (OWASP's WebScarab, Paros, TamperData, TamperIE, etc.)"
  ]
  execution_flow [
    step "2"
    phase "Experiment"
    description "[Generate fuzzed inputs] Given a fuzzing tool, a target input or protocol, and limits on time, complexity, and input variety, generate a list of inputs to try. Although fuzzing is random, it is not exhaustive. Parameters like length, composition, and how many variations to try are important to get the most cost-effective impact from the fuzzer."
    techniques "Boundary cases. Generate fuzz inputs that attack boundary cases of protocol fields, inputs, or other communications limits. Examples include 0xff and 0x00 for single-byte inputs. In binary situations, approach each bit of an individual field with on and off (e.g., 0x80)."
    techniques "Attempt arguments to system calls or APIs. The variations include payloads that, if they were successful, could lead to a compromise on the system."
  ]
  execution_flow [
    step "3"
    phase "Experiment"
    description "[Observe the outcome] Observe the outputs to the inputs fed into the system by fuzzers and see if there are any log or error messages that either provide user/sensitive data or give information about an expected template that could be used to produce this data."
    techniques "[]"
  ]
  execution_flow [
    step "4"
    phase "Exploit"
    description "[Craft exploit payloads] If the logs did not reveal any user/sensitive data, an adversary will attempt to make the fuzzing inputs form to an expected template"
    techniques "Create variants of expected templates that request additional information"
    techniques "Create variants that exclude limiting clauses"
    techniques "Create variants that alter fields taht identify the requester in order to subvert access controls"
    techniques "Repeat different fuzzing variants until sensitive information is divulged"
  ]
  node [
    id 0
    label "observe_communication_and_inputs"
  ]
  node [
    id 1
    label "observe_inputs_using_web_inspection_tools_owasp_s_webscarab_paros_tamperdata_tamperie_etc"
  ]
  node [
    id 2
    label "generate_fuzz_inputs_that_attack_boundary_cases_of_protocol_fields_inputs_or_other_communications_limits"
  ]
  node [
    id 3
    label "include_0xff_and_0x00_for_single_byte_inputs"
  ]
  node [
    id 4
    label "attempt_arguments"
  ]
  node [
    id 5
    label "include_payloads_that_if_they_were_successful_could_lead_to_a_compromise_on_the_system"
  ]
  node [
    id 6
    label "observe_the_outcome"
  ]
  node [
    id 7
    label "disclose_this_sensitive_data"
  ]
  node [
    id 8
    label "create_variants_of_expected_templates_that_request_additional_information"
  ]
  node [
    id 9
    label "create_variants_that_exclude_limiting_clauses"
  ]
  node [
    id 10
    label "create_variants_that_alter_fields_taht"
  ]
  node [
    id 11
    label "repeat_different_fuzzing_variants"
  ]
  node [
    id 12
    label "query_an_employee_database"
  ]
  node [
    id 13
    label "include_social_security_numbers_or_salaries"
  ]
  node [
    id 14
    label "process_queries_that_it_receives_without_adequately_checking_or_sanitizing_queries_to_ensure_they_follow_these_templates"
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
    target 13
  ]
  edge [
    source 13
    target 14
  ]
]
