graph [
  directed 1
  capec_id "76"
  name "Manipulating Web Input to File System Calls"
  abstraction "Detailed"
  status "Draft"
  description "An attacker manipulates inputs to the target software which the target software passes to file system calls in the OS. The goal is to gain access to, and perhaps modify, areas of the file system that the target software did not intend to be accessible."
  likelihood "High"
  severity "Very High"
  related_attack_patterns "_networkx_list_start"
  related_attack_patterns [
    capec_id "126"
    nature "ChildOf"
  ]
  prerequisites "_networkx_list_start"
  prerequisites "Program must allow for user controlled variables to be applied directly to the filesystem"
  skills_required "_networkx_list_start"
  skills_required [
    level "Low"
    description "To identify file system entry point and execute against an over-privileged system interface"
  ]
  resources_required "[]"
  consequences [
    scope "Confidentiality"
    scope "Access Control"
    scope "Authorization"
    impact "Gain Privileges"
  ]
  consequences [
    scope "_networkx_list_start"
    scope "Integrity"
    impact "Modify Data"
  ]
  mitigations "Design: Enforce principle of least privilege."
  mitigations "Design: Ensure all input is validated, and does not contain file system commands"
  mitigations "Design: Run server interfaces with a non-root account and/or utilize chroot jails or other configuration techniques to constrain privileges even if attacker gains some limited access to commands."
  mitigations "Design: For interactive user applications, consider if direct file system interface is necessary, instead consider having the application proxy communication."
  mitigations "Implementation: Perform testing such as pen-testing and vulnerability scanning to identify directories, programs, and interfaces that grant direct access to executables."
  example_instances "_networkx_list_start"
  example_instances "The attacker uses relative path traversal to access files in the application. This is an example of accessing user's password file. http://www.example.com/getProfile.jsp?filename=../../../../etc/passwd However, the target application employs regular expressions to make sure no relative path sequences are being passed through the application to the web page. The application would replace all matches from this regex with the empty string. Then an attacker creates special payloads to bypass this filter: http://www.example.com/getProfile.jsp?filename=%2e%2e/%2e%2e/%2e%2e/%2e%2e /etc/passwd When the application gets this input string, it will be the desired vector by the attacker."
  related_weaknesses "23"
  related_weaknesses "22"
  related_weaknesses "73"
  related_weaknesses "77"
  related_weaknesses "346"
  related_weaknesses "348"
  related_weaknesses "285"
  related_weaknesses "272"
  related_weaknesses "59"
  related_weaknesses "74"
  related_weaknesses "15"
  matched_cwes "74"
  matched_cwes "23"
  matched_cwes "77"
  matched_cwes "285"
  matched_cwes "73"
  matched_cwes "22"
  matched_cwes "59"
  taxonomy_mappings "[]"
  execution_flow [
    step "1"
    phase "Explore"
    description "[Fingerprinting of the operating system] In order to create a valid file injection, the attacker needs to know what the underlying OS is so that the proper file seperator is used."
    techniques "Port mapping. Identify ports that the system is listening on, and attempt to identify inputs and protocol types on those ports."
    techniques "TCP/IP Fingerprinting. The attacker uses various software to make connections or partial connections and observe idiosyncratic responses from the operating system. Using those responses, they attempt to guess the actual operating system."
    techniques "Induce errors to find informative error messages"
  ]
  execution_flow [
    step "2"
    phase "Explore"
    description "[Survey the Application to Identify User-controllable Inputs] The attacker surveys the target application to identify all user-controllable inputs, possibly as a valid and authenticated user"
    techniques "Spider web sites for all available links, entry points to the web site."
    techniques "Manually explore application and inventory all application inputs"
  ]
  execution_flow [
    step "3"
    phase "Experiment"
    description "[Vary inputs, looking for malicious results] Depending on whether the application being exploited is a remote or local one, the attacker crafts the appropriate malicious input containing the path of the targeted file or other file system control syntax to be passed to the application"
    techniques "Inject context-appropriate malicious file path using network packet injection tools (netcat, nemesis, etc.)"
    techniques "Inject context-appropriate malicious file path using web test frameworks (proxies, TamperData, custom programs, etc.) or simple HTTP requests"
    techniques "Inject context-appropriate malicious file system control syntax"
  ]
  execution_flow [
    step "4"
    phase "Exploit"
    description "[Manipulate files accessible by the application] The attacker may steal information or directly manipulate files (delete, copy, flush, etc.)"
    techniques "The attacker injects context-appropriate malicious file path to access the content of the targeted file."
    techniques "The attacker injects context-appropriate malicious file system control syntax to access the content of the targeted file."
    techniques "The attacker injects context-appropriate malicious file path to cause the application to create, delete a targeted file."
    techniques "The attacker injects context-appropriate malicious file system control syntax to cause the application to create, delete a targeted file."
    techniques "The attacker injects context-appropriate malicious file path in order to manipulate the meta-data of the targeted file."
    techniques "The attacker injects context-appropriate malicious file system control syntax in order to manipulate the meta-data of the targeted file."
  ]
  node [
    id 0
    label "identify_ports_that_the_system_is_listening_on"
  ]
  node [
    id 1
    label "make_connections_or_partial_connections"
  ]
  node [
    id 2
    label "attempt_using_those_responses"
  ]
  node [
    id 3
    label "induce_errors"
  ]
  node [
    id 4
    label "survey_the_target_application"
  ]
  node [
    id 5
    label "explore_application_and_inventory"
  ]
  node [
    id 6
    label "input_vary"
  ]
  node [
    id 7
    label "inject_command_delimiters_using_network_packet_injection_tools_netcat_nemesis_etc"
  ]
  node [
    id 8
    label "inject_command_delimiters_using_web_test_frameworks_proxies_tamperdata_custom_programs_etc"
  ]
  node [
    id 9
    label "steal_information_or_directly_manipulate_files_delete_copy_flush_etc"
  ]
  node [
    id 10
    label "inject_context_appropriate_malicious_file_path"
  ]
  node [
    id 11
    label "use_relative_path_traversal"
  ]
  node [
    id 12
    label "employ_regular_expressions_to_make_sure_no_relative_path_sequences_are_being_passed_through_the_application_to_the_web_page"
  ]
  node [
    id 13
    label "replace_all_matches"
  ]
  node [
    id 14
    label "create_special_payloads_to_bypass_this_filter_http_www_example_com_getprofile_jsp_filename_2e_2e_2e_2e_2e_2e_2e_2e_etc"
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
