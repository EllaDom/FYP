graph [
  directed 1
  capec_id "183"
  name "IMAP/SMTP Command Injection"
  abstraction "Standard"
  status "Draft"
  description "An adversary exploits weaknesses in input validation on web-mail servers to execute commands on the IMAP/SMTP server. Web-mail servers often sit between the Internet and the IMAP or SMTP mail server. User requests are received by the web-mail servers which then query the back-end mail server for the requested information and return this response to the user. In an IMAP/SMTP command injection attack, mail-server commands are embedded in parts of the request sent to the web-mail server. If the web-mail server fails to adequately sanitize these requests, these commands are then sent to the back-end mail server when it is queried by the web-mail server, where the commands are then executed. This attack can be especially dangerous since administrators may assume that the back-end server is protected against direct Internet access and therefore may not secure it adequately against the execution of malicious commands."
  likelihood ""
  severity "Medium"
  related_attack_patterns "_networkx_list_start"
  related_attack_patterns [
    capec_id "248"
    nature "ChildOf"
  ]
  prerequisites "The target environment must consist of a web-mail server that the attacker can query and a back-end mail server. The back-end mail server need not be directly accessible to the attacker."
  prerequisites "The web-mail server must fail to adequately sanitize fields received from users and passed on to the back-end mail server."
  prerequisites "The back-end mail server must not be adequately secured against receiving malicious commands from the web-mail server."
  skills_required "[]"
  resources_required "_networkx_list_start"
  resources_required "None: No specialized resources are required to execute this type of attack. However, in most cases, the attacker will need to be a recognized user of the web-mail server."
  consequences "[]"
  mitigations "[]"
  example_instances "[]"
  related_weaknesses "_networkx_list_start"
  related_weaknesses "77"
  matched_cwes "_networkx_list_start"
  matched_cwes "77"
  taxonomy_mappings "[]"
  execution_flow [
    step "1"
    phase "Explore"
    description "[Identify Target Web-Mail Server] The adversary first identifies the web-mail server they wish to exploit."
    techniques "[]"
  ]
  execution_flow [
    step "2"
    phase "Experiment"
    description "[Identify Vulnerable Parameters] Once the adversary has identified a web-mail server, they identify any vulnerable parameters by altering their values in requests. The adversary knows that the parameter is vulnerable if the web-mail server returns an error of any sort. Ideally, the adversary is looking for a descriptive error message."
    techniques "Assign a null value to a parameter being used by the web-mail server and observe the response."
    techniques "Assign a random value to a parameter being used by the web-mail server and observe the response."
    techniques "Add additional values to a parameter being used by the web-mail server and observe the response."
    techniques "Add non standard special characters (i.e.: \, ', &#34;, @, #, !, |) to a parameter being used by the web-mail server and observe the response."
    techniques "Eliminate a parameter being used by the web-mail server and observe the response."
  ]
  execution_flow [
    step "3"
    phase "Experiment"
    description "[Determine Level of Injection] After identifying all vulnerable parameters, the adversary determines what level of injection is possible."
    techniques "Evaluate error messages to determine what IMAP/SMTP command is being executed for the vulnerable parameter. Sometimes the actually query will be placed in the error message."
    techniques "If there aren't descriptive error messages, the adversary will analyze the affected functionality to deduce the possible commands that could be being used by the mail-server."
  ]
  execution_flow [
    step "4"
    phase "Exploit"
    description "[Inject IMAP/SMTP Commands] The adversary manipulates the vulnerable parameters to inject an IMAP/SMTP command and execute it on the mail-server."
    techniques "Structure the injection as a header, body, and footer. The header contains the ending of the expected message, the body contains the injection of the new command, and the footer contains the beginning of the expected command."
    techniques "Each part of the injection payload needs to be terminated with the CRLF (%0d%0a) sequence."
  ]
  node [
    id 0
    label "identify_target_web_mail_server"
  ]
  node [
    id 1
    label "identify_the_web_mail_server_they_wish_to_exploit"
  ]
  node [
    id 2
    label "determine_vulnerable_interface"
  ]
  node [
    id 3
    label "assign_a_null_value"
  ]
  node [
    id 4
    label "assign_a_random_value"
  ]
  node [
    id 5
    label "add_additional_values"
  ]
  node [
    id 6
    label "add_standard_special_characters_i_e"
  ]
  node [
    id 7
    label "eliminate_a_parameter_being_used_by_the_web_mail_server"
  ]
  node [
    id 8
    label "evaluate_error_messages"
  ]
  node [
    id 9
    label "place_the_actually_query"
  ]
  node [
    id 10
    label "analyze_the_affected_functionality_to_deduce_the_possible_commands_that_could_be_being_used_by_the_mail_server"
  ]
  node [
    id 11
    label "manipulate_the_vulnerable_parameters"
  ]
  node [
    id 12
    label "contain_the_ending_of_the_expected_message"
  ]
  node [
    id 13
    label "need_to_be_terminated_with_the_crlf_0d_0a_sequence"
  ]
  node [
    id 14
    label "fail_to_adequately_sanitize_fields_received_from_users_and_passed_on_to_the_back_end_mail_server"
  ]
  node [
    id 15
    label "secure_the_back_end_mail_server"
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
    source 2
    target 8
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
    target 2
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
]
