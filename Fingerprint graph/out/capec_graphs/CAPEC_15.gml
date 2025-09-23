graph [
  directed 1
  capec_id "15"
  name "Command Delimiters"
  abstraction "Standard"
  status "Draft"
  description "An attack of this type exploits a programs' vulnerabilities that allows an attacker's commands to be concatenated onto a legitimate command with the intent of targeting other resources such as the file system or database. The system that uses a filter or denylist input validation, as opposed to allowlist validation is vulnerable to an attacker who predicts delimiters (or combinations of delimiters) not present in the filter or denylist. As with other injection attacks, the attacker uses the command delimiter payload as an entry point to tunnel through the application and activate additional attacks through SQL queries, shell commands, network scanning, and so on."
  likelihood "High"
  severity "High"
  related_attack_patterns "_networkx_list_start"
  related_attack_patterns [
    capec_id "137"
    nature "ChildOf"
  ]
  prerequisites "_networkx_list_start"
  prerequisites "Software's input validation or filtering must not detect and block presence of additional malicious command."
  skills_required "_networkx_list_start"
  skills_required [
    level "Medium"
    description "The attacker has to identify injection vector, identify the specific commands, and optionally collect the output, i.e. from an interactive session."
  ]
  resources_required "_networkx_list_start"
  resources_required "Ability to communicate synchronously or asynchronously with server. Optionally, ability to capture output directly through synchronous communication or other method such as FTP."
  consequences [
    scope "Confidentiality"
    scope "Integrity"
    scope "Availability"
    impact "Execute Unauthorized Commands"
  ]
  consequences [
    scope "_networkx_list_start"
    scope "Confidentiality"
    impact "Read Data"
  ]
  mitigations "Design: Perform allowlist validation against a positive specification for command length, type, and parameters."
  mitigations "Design: Limit program privileges, so if commands circumvent program input validation or filter routines then commands do not running under a privileged account"
  mitigations "Implementation: Perform input validation for all remote content."
  mitigations "Implementation: Use type conversions such as JDBC prepared statements."
  example_instances "_networkx_list_start"
  example_instances "By appending special characters, such as a semicolon or other commands that are executed by the target process, the attacker is able to execute a wide variety of malicious commands in the target process space, utilizing the target's inherited permissions, against any resource the host has access to. The possibilities are vast including injection attacks against RDBMS (SQL Injection), directory servers (LDAP Injection), XML documents (XPath and XQuery Injection), and command line shells. In many injection attacks, the results are converted back to strings and displayed to the client process such as a web browser without tripping any security alarms, so the network firewall does not log any out of the ordinary behavior. LDAP servers house critical identity assets such as user, profile, password, and group information that is used to authenticate and authorize users. An attacker that can query the directory at will and execute custom commands against the directory server is literally working with the keys to the kingdom in many enterprises. When user, organizational units, and other directory objects are queried by building the query string directly from user input with no validation, or other conversion, then the attacker has the ability to use any LDAP commands to query, filter, list, and crawl against the LDAP server directly in the same manner as SQL injection gives the ability to the attacker to run SQL commands on the database."
  related_weaknesses "146"
  related_weaknesses "77"
  related_weaknesses "184"
  related_weaknesses "78"
  related_weaknesses "185"
  related_weaknesses "93"
  related_weaknesses "140"
  related_weaknesses "157"
  related_weaknesses "138"
  related_weaknesses "154"
  related_weaknesses "697"
  matched_cwes "77"
  matched_cwes "78"
  taxonomy_mappings "[]"
  execution_flow [
    step "1"
    phase "Explore"
    description "[Assess Target Runtime Environment] In situations where the runtime environment is not implicitly known, the attacker makes connections to the target system and tries to determine the system's runtime environment. Knowing the environment is vital to choosing the correct delimiters."
    techniques "Port mapping using network connection-based software (e.g., nmap, nessus, etc.)"
    techniques "Port mapping by exploring the operating system (netstat, sockstat, etc.)"
    techniques "TCP/IP Fingerprinting"
    techniques "Induce errors to find informative error messages"
  ]
  execution_flow [
    step "2"
    phase "Explore"
    description "[Survey the Application] The attacker surveys the target application, possibly as a valid and authenticated user"
    techniques "Spidering web sites for all available links"
    techniques "Inventory all application inputs"
  ]
  execution_flow [
    step "3"
    phase "Experiment"
    description "[Attempt delimiters in inputs] The attacker systematically attempts variations of delimiters on known inputs, observing the application's response each time."
    techniques "Inject command delimiters using network packet injection tools (netcat, nemesis, etc.)"
    techniques "Inject command delimiters using web test frameworks (proxies, TamperData, custom programs, etc.)"
    techniques "Enter command delimiters directly in input fields."
  ]
  execution_flow [
    step "4"
    phase "Exploit"
    description "[Use malicious command delimiters] The attacker uses combinations of payload and carefully placed command delimiters to attack the software."
    techniques "[]"
  ]
  node [
    id 0
    label "know_the_runtime_environment"
  ]
  node [
    id 1
    label "know_the_environment"
  ]
  node [
    id 2
    label "explore_the_operating_system_netstat_sockstat_etc"
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
    label "input_all_application"
  ]
  node [
    id 6
    label "attempt_delimiters_in_inputs"
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
    label "enter_command_delimiters"
  ]
  node [
    id 10
    label "use_malicious_command_delimiters"
  ]
  node [
    id 11
    label "append_special_characters_such_as_a_semicolon_or_other_commands_that_are_executed_by_the_target_process"
  ]
  node [
    id 12
    label "include_injection_attacks_against_rdbms_sql_injection"
  ]
  node [
    id 13
    label "convert_the_results"
  ]
  node [
    id 14
    label "server_house_critical_identity_assets_such_as_user_profile_password_and_group_information_that_is_used_to_authenticate_and_authorize_users"
  ]
  node [
    id 15
    label "query_the_directory"
  ]
  node [
    id 16
    label "query_user_organizational_units_and_other_directory_objects"
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
  edge [
    source 9
    target 11
  ]
  edge [
    source 10
    target 9
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
]
