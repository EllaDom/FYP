graph [
  directed 1
  capec_id "43"
  name "Exploiting Multiple Input Interpretation Layers"
  abstraction "Detailed"
  status "Draft"
  description "An attacker supplies the target software with input data that contains sequences of special characters designed to bypass input validation logic. This exploit relies on the target making multiples passes over the input data and processing a &#34;layer&#34; of special characters with each pass. In this manner, the attacker can disguise input that would otherwise be rejected as invalid by concealing it with layers of special/escape characters that are stripped off by subsequent processing steps. The goal is to first discover cases where the input validation layer executes before one or more parsing layers. That is, user input may go through the following logic in an application: <parser1> --> <input validator> --> <parser2>. In such cases, the attacker will need to provide input that will pass through the input validator, but after passing through parser2, will be converted into something that the input validator was supposed to stop."
  likelihood "Medium"
  severity "High"
  related_attack_patterns "_networkx_list_start"
  related_attack_patterns [
    capec_id "267"
    nature "ChildOf"
  ]
  prerequisites "User input is used to construct a command to be executed on the target system or as part of the file name."
  prerequisites "Multiple parser passes are performed on the data supplied by the user."
  skills_required "_networkx_list_start"
  skills_required [
    level "Medium"
    description "Knowledge of various escaping schemes, such as URL escape encoding and XML escape characters."
  ]
  resources_required "[]"
  consequences [
    scope "_networkx_list_start"
    scope "Integrity"
    impact "Modify Data"
  ]
  consequences [
    scope "Confidentiality"
    scope "Access Control"
    scope "Authorization"
    impact "Gain Privileges"
  ]
  consequences [
    scope "_networkx_list_start"
    scope "Confidentiality"
    impact "Read Data"
  ]
  mitigations "An iterative approach to input validation may be required to ensure that no dangerous characters are present. It may be necessary to implement redundant checking across different input validation layers. Ensure that invalid data is rejected as soon as possible and do not continue to work with it."
  mitigations "Make sure to perform input validation on canonicalized data (i.e. data that is data in its most standard form). This will help avoid tricky encodings getting past the filters."
  mitigations "Assume all input is malicious. Create an allowlist that defines all valid input to the software system based on the requirements specifications. Input that does not match against the allowlist would not be permitted to enter into the system."
  example_instances "_networkx_list_start"
  example_instances "The backslash character provides a good example of the multiple-parser issue. A backslash is used to escape characters in strings, but is also used to delimit directories on the NT file system. When performing a command injection that includes NT paths, there is usually a need to &#34;double escape&#34; the backslash. In some cases, a quadruple escape is necessary. Original String: C:\\\\winnt\\\\system32\\\\cmd.exe /c   <parsing layer>   Interim String: C:\\winnt\\system32\\cmd.exe /c   <parsing layer>   Final String: C:\winnt\system32\cmd.exe /c This diagram shows each successive layer of parsing translating the backslash character. A double backslash becomes a single as it is parsed. By using quadruple backslashes, the attacker is able to control the result in the final string. [REF-1]"
  related_weaknesses "179"
  related_weaknesses "181"
  related_weaknesses "184"
  related_weaknesses "183"
  related_weaknesses "77"
  related_weaknesses "78"
  related_weaknesses "74"
  related_weaknesses "20"
  related_weaknesses "697"
  related_weaknesses "707"
  matched_cwes "20"
  matched_cwes "78"
  matched_cwes "707"
  matched_cwes "74"
  matched_cwes "77"
  taxonomy_mappings "[]"
  execution_flow [
    step "1"
    phase "Explore"
    description "[Determine application/system inputs where bypassing input validation is desired] The attacker first needs to determine all of the application's/system's inputs where input validation is being performed and where they want to bypass it."
    techniques "_networkx_list_start"
    techniques "While using an application/system, the attacker discovers an input where validation is stopping them from performing some malicious or unauthorized actions."
  ]
  execution_flow [
    step "2"
    phase "Experiment"
    description "[Determine which character encodings are accepted by the application/system] The attacker then needs to provide various character encodings to the application/system and determine which ones are accepted. The attacker will need to observe the application's/system's response to the encoded data to determine whether the data was interpreted properly."
    techniques "Determine which escape characters are accepted by the application/system. A common escape character is the backslash character, '\'"
    techniques "Determine whether URL encoding is accepted by the application/system."
    techniques "Determine whether UTF-8 encoding is accepted by the application/system."
    techniques "Determine whether UTF-16 encoding is accepted by the application/system."
    techniques "Determine if any other encodings are accepted by the application/system."
  ]
  execution_flow [
    step "3"
    phase "Experiment"
    description "[Combine multiple encodings accepted by the application.] The attacker now combines encodings accepted by the application. The attacker may combine different encodings or apply the same encoding multiple times."
    techniques "Combine same encoding multiple times and observe its effects. For example, if special characters are encoded with a leading backslash, then the following encoding may be accepted by the application/system: &#34;\\\.&#34;. With two parsing layers, this may get converted to &#34;\.&#34; after the first parsing layer, and then, to &#34;.&#34; after the second. If the input validation layer is between the two parsing layers, then &#34;\\\.\\\.&#34; might pass a test for &#34;..&#34; but still get converted to &#34;..&#34; afterwards. This may enable directory traversal attacks."
    techniques "Combine multiple encodings and observe the effects. For example, the attacker might encode &#34;.&#34; as &#34;\.&#34;, and then, encode &#34;\.&#34; as &#34;&#38;#92;&#38;#46;&#34;, and then, encode that using URL encoding to &#34;%26%2392%3B%26%2346%3B&#34;"
  ]
  execution_flow [
    step "4"
    phase "Exploit"
    description "[Leverage ability to bypass input validation] Attacker leverages their ability to bypass input validation to gain unauthorized access to system. There are many attacks possible, and a few examples are mentioned here."
    techniques "Gain access to sensitive files."
    techniques "Perform command injection."
    techniques "Perform SQL injection."
    techniques "Perform XSS attacks."
  ]
  node [
    id 0
    label "need_to_determine_all_of_the_application_s_system_s_inputs_where_input_validation_is_being_performed_and_where_they_want_to_bypass_it"
  ]
  node [
    id 1
    label "discover_an_input_where_validation_is_stopping_them_from_performing_some_malicious_or_unauthorized_actions"
  ]
  node [
    id 2
    label "need_to_observe_the_application_s_system_s_response_to_the_encoded_data_to_determine_whether_the_data_was_interpreted_properly"
  ]
  node [
    id 3
    label "determine_if_any_other_encodings_are_accepted_by_the_application_system"
  ]
  node [
    id 4
    label "combine_encodings_accepted_by_the_application"
  ]
  node [
    id 5
    label "combine_different_encodings"
  ]
  node [
    id 6
    label "combine_same_encoding_multiple_times"
  ]
  node [
    id 7
    label "encode_certain_characters"
  ]
  node [
    id 8
    label "enable_directory_traversal_attacks"
  ]
  node [
    id 9
    label "use_url_encoding"
  ]
  node [
    id 10
    label "bypass_input_validation"
  ]
  node [
    id 11
    label "leverage_their_ability_to_bypass_input_validation_to_gain_unauthorized_access_to_system"
  ]
  node [
    id 12
    label "mention_a_few_examples"
  ]
  node [
    id 13
    label "gain_access_to_sensitive_files"
  ]
  node [
    id 14
    label "perform_command_injection"
  ]
  node [
    id 15
    label "perform_sql_injection"
  ]
  node [
    id 16
    label "perform_xss_attacks"
  ]
  node [
    id 17
    label "provide_a_good_example_of_the_multiple_parser_issue"
  ]
  node [
    id 18
    label "escape_characters"
  ]
  node [
    id 19
    label "perform_a_command_injection_that_includes_nt_paths"
  ]
  node [
    id 20
    label "show_each_successive_layer_of_parsing_translating_the_backslash_character"
  ]
  node [
    id 21
    label "become_a_single_as_it_is_parsed"
  ]
  node [
    id 22
    label "control_the_result"
  ]
  node [
    id 23
    label "construct_a_command_to_be_executed_on_the_target_system_or"
  ]
  node [
    id 24
    label "perform_multiple_parser_passes"
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
    source 5
    target 9
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
    target 5
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
  edge [
    source 22
    target 23
  ]
  edge [
    source 23
    target 24
  ]
]
