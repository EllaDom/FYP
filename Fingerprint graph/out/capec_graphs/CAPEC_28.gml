graph [
  directed 1
  capec_id "28"
  name "Fuzzing"
  abstraction "Meta"
  status "Draft"
  description "In this attack pattern, the adversary leverages fuzzing to try to identify weaknesses in the system. Fuzzing is a software security and functionality testing method that feeds randomly constructed input to the system and looks for an indication that a failure in response to that input has occurred. Fuzzing treats the system as a black box and is totally free from any preconceptions or assumptions about the system. Fuzzing can help an attacker discover certain assumptions made about user input in the system. Fuzzing gives an attacker a quick way of potentially uncovering some of these assumptions despite not necessarily knowing anything about the internals of the system. These assumptions can then be turned against the system by specially crafting user input that may allow an attacker to achieve their goals."
  likelihood "High"
  severity "Medium"
  related_attack_patterns "[]"
  prerequisites "[]"
  skills_required "_networkx_list_start"
  skills_required [
    level "Low"
    description "There is a wide variety of fuzzing tools available."
  ]
  resources_required "_networkx_list_start"
  resources_required "Fuzzing tools."
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
    impact "Alter Execution Logic"
  ]
  mitigations "Test to ensure that the software behaves as per specification and that there are no unintended side effects. Ensure that no assumptions about the validity of data are made."
  mitigations "Use fuzz testing during the software QA process to uncover any surprises, uncover any assumptions or unexpected behavior."
  example_instances "_networkx_list_start"
  example_instances "A fuzz test reveals that when data length for a particular field exceeds certain length, the input validation filter fails and lets the user data in unfiltered. This provides an attacker with an injection vector to deliver the malicious payload into the system."
  related_weaknesses "74"
  related_weaknesses "20"
  matched_cwes "20"
  matched_cwes "74"
  taxonomy_mappings "[]"
  execution_flow [
    step "1"
    phase "Explore"
    description "[Observe communication and inputs] The fuzzing attacker observes the target system looking for inputs and communications between modules, subsystems, or systems."
    techniques "Network sniffing. Using a network sniffer such as wireshark, the attacker observes communications into and out of the target system."
    techniques "Monitor API execution. Using a tool such as ktrace, strace, APISpy, or another debugging tool, the attacker observes the system calls and API calls that are made by the target system, and the nature of their parameters."
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
    description "[Observe the outcome] Observe the outputs to the inputs fed into the system by fuzzers and see if anything interesting happens. If failure occurs, determine why that happened. Figure out the underlying assumption that was invalidated by the input."
    techniques "[]"
  ]
  execution_flow [
    step "4"
    phase "Exploit"
    description "[Craft exploit payloads] Put specially crafted input into the system that leverages the weakness identified through fuzzing and allows to achieve the goals of the attacker. Fuzzers often reveal ways to slip through the input validation filters and introduce unwanted data into the system."
    techniques "Identify and embed shell code for the target system."
    techniques "Embed higher level attack commands in the payload. (e.g., SQL, PHP, server-side includes, etc.)"
    techniques "Induce denial of service by exploiting resource leaks or bad error handling."
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
    label "figure_the_underlying_assumption_that_was_invalidated_by_the_input"
  ]
  node [
    id 8
    label "put_specially_crafted_input"
  ]
  node [
    id 9
    label "reveal_ways_to_slip_through_the_input_validation_filters_and_introduce_unwanted_data_into_the_system"
  ]
  node [
    id 10
    label "induce_denial_of_service"
  ]
  node [
    id 11
    label "provide_an_attacker_with_an_injection_vector_to_deliver_the_malicious_payload_into_the_system"
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
]
