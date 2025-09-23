graph [
  directed 1
  capec_id "24"
  name "Filter Failure through Buffer Overflow"
  abstraction "Detailed"
  status "Draft"
  description "In this attack, the idea is to cause an active filter to fail by causing an oversized transaction. An attacker may try to feed overly long input strings to the program in an attempt to overwhelm the filter (by causing a buffer overflow) and hoping that the filter does not fail securely (i.e. the user input is let into the system unfiltered)."
  likelihood "High"
  severity "High"
  related_attack_patterns "_networkx_list_start"
  related_attack_patterns [
    capec_id "100"
    nature "ChildOf"
  ]
  prerequisites "_networkx_list_start"
  prerequisites "Ability to control the length of data passed to an active filter."
  skills_required [
    level "Low"
    description "An attacker can simply overflow a buffer by inserting a long string into an attacker-modifiable injection vector. The result can be a DoS."
  ]
  skills_required [
    level "High"
    description "Exploiting a buffer overflow to inject malicious code into the stack of a software system or even the heap can require a higher skill level."
  ]
  resources_required "[]"
  consequences [
    scope "_networkx_list_start"
    scope "Integrity"
    impact "Modify Data"
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
    impact "Bypass Protection Mechanism"
  ]
  consequences [
    scope "_networkx_list_start"
    scope "Availability"
    impact "Unreliable Execution"
  ]
  mitigations "Make sure that ANY failure occurring in the filtering or input validation routine is properly handled and that offending input is NOT allowed to go through. Basically make sure that the vault is closed when failure occurs."
  mitigations "Pre-design: Use a language or compiler that performs automatic bounds checking."
  mitigations "Pre-design through Build: Compiler-based canary mechanisms such as StackGuard, ProPolice and the Microsoft Visual Studio /GS flag. Unless this provides automatic bounds checking, it is not a complete solution."
  mitigations "Operational: Use OS-level preventative functionality. Not a complete solution."
  mitigations "Design: Use an abstraction library to abstract away risky APIs. Not a complete solution."
  example_instances "Sending in arguments that are too long to cause the filter to fail open is one instantiation of the filter failure attack. The Taylor UUCP daemon is designed to remove hostile arguments before they can be executed. If the arguments are too long, however, the daemon fails to remove them. This leaves the door open for attack."
  example_instances "A filter is used by a web application to filter out characters that may allow the input to jump from the data plane to the control plane when data is used in a SQL statement (chaining this attack with the SQL injection attack). Leveraging a buffer overflow the attacker makes the filter fail insecurely and the tainted data is permitted to enter unfiltered into the system, subsequently causing a SQL injection."
  example_instances "Audit Truncation and Filters with Buffer Overflow. Sometimes very large transactions can be used to destroy a log file or cause partial logging failures. In this kind of attack, log processing code might be examining a transaction in real-time processing, but the oversized transaction causes a logic branch or an exception of some kind that is trapped. In other words, the transaction is still executed, but the logging or filtering mechanism still fails. This has two consequences, the first being that you can run transactions that are not logged in any way (or perhaps the log entry is completely corrupted). The second consequence is that you might slip through an active filter that otherwise would stop your attack."
  related_weaknesses "120"
  related_weaknesses "119"
  related_weaknesses "118"
  related_weaknesses "74"
  related_weaknesses "20"
  related_weaknesses "680"
  related_weaknesses "733"
  related_weaknesses "697"
  matched_cwes "119"
  matched_cwes "20"
  matched_cwes "74"
  matched_cwes "120"
  taxonomy_mappings "[]"
  execution_flow [
    step "1"
    phase "Explore"
    description "[Survey] The attacker surveys the target application, possibly as a valid and authenticated user"
    techniques "Spidering web sites for inputs that involve potential filtering"
    techniques "Brute force guessing of filtered inputs"
  ]
  execution_flow [
    step "2"
    phase "Experiment"
    description "[Attempt injections] Try to feed overly long data to the system. This can be done manually or a dynamic tool (black box) can be used to automate this. An attacker can also use a custom script for that purpose."
    techniques "Brute force attack through black box penetration test tool."
    techniques "Fuzzing of communications protocols"
    techniques "Manual testing of possible inputs with attack data."
  ]
  execution_flow [
    step "3"
    phase "Experiment"
    description "[Monitor responses] Watch for any indication of failure occurring. Carefully watch to see what happened when filter failure occurred. Did the data get in?"
    techniques "Boron tagging. Choose clear attack inputs that are easy to notice in output. In binary this is often 0xa5a5a5a5 (alternating 1s and 0s). Another obvious tag value is all zeroes, but it is not always obvious what goes wrong if the null values get into the data."
    techniques "Check Log files. An attacker with access to log files can look at the outcome of bad input."
  ]
  execution_flow [
    step "4"
    phase "Exploit"
    description "[Abuse the system through filter failure] An attacker writes a script to consistently induce the filter failure."
    techniques "DoS through filter failure. The attacker causes the system to crash or stay down because of its failure to filter properly."
    techniques "Malicious code execution. An attacker introduces a malicious payload and executes arbitrary code on the target system."
    techniques "An attacker can use the filter failure to introduce malicious data into the system and leverage a subsequent SQL injection, Cross Site Scripting, Command Injection or similar weakness if it exists."
  ]
  node [
    id 0
    label "survey_the_target_application"
  ]
  node [
    id 1
    label "try_to_feed_overly_long_data_to_the_system"
  ]
  node [
    id 2
    label "automate_this"
  ]
  node [
    id 3
    label "use_a_custom_script_for_that_purpose"
  ]
  node [
    id 4
    label "watch_to_see_what_happened_when_filter_failure_occurred"
  ]
  node [
    id 5
    label "choose_clear_attack_inputs_that_are_easy_to_notice_in_output"
  ]
  node [
    id 6
    label "alternate_1s_and_0s"
  ]
  node [
    id 7
    label "go_if_the_null_values_get_into_the_data"
  ]
  node [
    id 8
    label "check_log_files"
  ]
  node [
    id 9
    label "abuse_the_system"
  ]
  node [
    id 10
    label "craft_malicious_payload"
  ]
  node [
    id 11
    label "use_malicious_data"
  ]
  node [
    id 12
    label "send_arguments_that_are_too_long_to_cause_the_filter_to_fail_open"
  ]
  node [
    id 13
    label "design_the_taylor_uucp_daemon"
  ]
  node [
    id 14
    label "fail_if_the_arguments_are_too_long"
  ]
  node [
    id 15
    label "leave_the_door_open_for_attack"
  ]
  node [
    id 16
    label "filter_characters_that_may_allow_the_input_to_jump_from_the_data_plane_to_the_control_plane_when_data_is_used_in_a_sql_statement_chaining_this_attack_with_the_sql_injection_attack"
  ]
  node [
    id 17
    label "leverage_a_buffer"
  ]
  node [
    id 18
    label "destroy_a_log_file"
  ]
  node [
    id 19
    label "examine_a_transaction"
  ]
  node [
    id 20
    label "execute_the_transaction"
  ]
  node [
    id 21
    label "run_transactions_that_are_not_logged_in_any_way_or"
  ]
  node [
    id 22
    label "control_the_length_of_data"
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
  edge [
    source 14
    target 15
  ]
  edge [
    source 15
    target 16
  ]
  edge [
    source 16
    target 17
  ]
  edge [
    source 17
    target 18
  ]
  edge [
    source 18
    target 19
  ]
  edge [
    source 19
    target 20
  ]
  edge [
    source 20
    target 21
  ]
  edge [
    source 21
    target 22
  ]
]
