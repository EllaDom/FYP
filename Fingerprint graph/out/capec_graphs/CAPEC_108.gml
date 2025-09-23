graph [
  directed 1
  capec_id "108"
  name "Command Line Execution through SQL Injection"
  abstraction "Detailed"
  status "Draft"
  description "An attacker uses standard SQL injection methods to inject data into the command line for execution. This could be done directly through misuse of directives such as MSSQL_xp_cmdshell or indirectly through injection of data into the database that would be interpreted as shell commands. Sometime later, an unscrupulous backend application (or could be part of the functionality of the same application) fetches the injected data stored in the database and uses this data as command line arguments without performing proper validation. The malicious data escapes that data plane by spawning new commands to be executed on the host."
  likelihood "Low"
  severity "Very High"
  related_attack_patterns "_networkx_list_start"
  related_attack_patterns [
    capec_id "66"
    nature "ChildOf"
  ]
  prerequisites "The application does not properly validate data before storing in the database"
  prerequisites "Backend application implicitly trusts the data stored in the database"
  prerequisites "Malicious data is used on the backend as a command line argument"
  skills_required "_networkx_list_start"
  skills_required [
    level "High"
    description "The attacker most likely has to be familiar with the internal functionality of the system to launch this attack. Without that knowledge, there are not many feedback mechanisms to give an attacker the indication of how to perform command injection or whether the attack is succeeding."
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
    scope "Confidentiality"
    impact "Read Data"
  ]
  consequences [
    scope "_networkx_list_start"
    scope "Availability"
    impact "Unreliable Execution"
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
  mitigations "Disable MSSQL xp_cmdshell directive on the database"
  mitigations "Properly validate the data (syntactically and semantically) before writing it to the database."
  mitigations "Do not implicitly trust the data stored in the database. Re-validate it prior to usage to make sure that it is safe to use in a given context (e.g. as a command line argument)."
  example_instances "_networkx_list_start"
  example_instances "SQL injection vulnerability in Cacti 0.8.6i and earlier, when register_argc_argv is enabled, allows remote attackers to execute arbitrary SQL commands via the (1) second or (2) third arguments to cmd.php. NOTE: this issue can be leveraged to execute arbitrary commands since the SQL query results are later used in the polling_items array and popen function (CVE-2006-6799). Reference: https://www.cve.org/CVERecord?id=CVE-2006-6799"
  related_weaknesses "89"
  related_weaknesses "74"
  related_weaknesses "20"
  related_weaknesses "78"
  related_weaknesses "114"
  matched_cwes "74"
  matched_cwes "20"
  matched_cwes "89"
  matched_cwes "78"
  taxonomy_mappings "[]"
  execution_flow [
    step "1"
    phase "Explore"
    description "[Probe for SQL Injection vulnerability] The attacker injects SQL syntax into user-controllable data inputs to search unfiltered execution of the SQL syntax in a query."
    techniques "[]"
  ]
  execution_flow [
    step "2"
    phase "Exploit"
    description "[Achieve arbitrary command execution through SQL Injection with the MSSQL_xp_cmdshell directive] The attacker leverages a SQL Injection attack to inject shell code to be executed by leveraging the xp_cmdshell directive."
    techniques "[]"
  ]
  execution_flow [
    step "3"
    phase "Exploit"
    description "[Inject malicious data in the database] Leverage SQL injection to inject data in the database that could later be used to achieve command injection if ever used as a command line argument"
    techniques "[]"
  ]
  execution_flow [
    step "4"
    phase "Exploit"
    description "[Trigger command line execution with injected arguments] The attacker causes execution of command line functionality which leverages previously injected database content as arguments."
    techniques "[]"
  ]
  node [
    id 0
    label "inject_sql_syntax_into_user_controllable_data_inputs"
  ]
  node [
    id 1
    label "execute_arbitrary_code"
  ]
  node [
    id 2
    label "inject_malicious_data_in_the_database_leverage_sql_injection_to_inject_data_in_the_database_that_could_later_be_used_to_achieve_command_injection_if_ever_used_as_a_command_line_argument"
  ]
  node [
    id 3
    label "enable_register_argc_argv"
  ]
  node [
    id 4
    label "leverage_to_execute_arbitrary_commands_since_the_sql_query_results_are_later_used_in_the_polling_items_array_and_popen_function_cve_2006_6799"
  ]
  node [
    id 5
    label "validate_data"
  ]
  node [
    id 6
    label "trust_the_data_stored_in_the_database"
  ]
  node [
    id 7
    label "use_malicious_data"
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
]
