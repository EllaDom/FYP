graph [
  directed 1
  capec_id "7"
  name "Blind SQL Injection"
  abstraction "Detailed"
  status "Draft"
  description "Blind SQL Injection results from an insufficient mitigation for SQL Injection. Although suppressing database error messages are considered best practice, the suppression alone is not sufficient to prevent SQL Injection. Blind SQL Injection is a form of SQL Injection that overcomes the lack of error messages. Without the error messages that facilitate SQL Injection, the adversary constructs input strings that probe the target through simple Boolean SQL expressions. The adversary can determine if the syntax and structure of the injection was successful based on whether the query was executed or not. Applied iteratively, the adversary determines how and where the target is vulnerable to SQL Injection."
  likelihood "High"
  severity "High"
  related_attack_patterns "_networkx_list_start"
  related_attack_patterns [
    capec_id "66"
    nature "ChildOf"
  ]
  prerequisites "SQL queries used by the application to store, retrieve or modify data."
  prerequisites "User-controllable input that is not properly validated by the application as part of SQL queries."
  skills_required "_networkx_list_start"
  skills_required [
    level "Medium"
    description "Determining the database type and version, as well as the right number and type of parameters to the query being injected in the absence of error messages requires greater skill than reverse-engineering database error messages."
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
    scope "Confidentiality"
    scope "Integrity"
    scope "Availability"
    impact "Execute Unauthorized Commands"
  ]
  mitigations "Security by Obscurity is not a solution to preventing SQL Injection. Rather than suppress error messages and exceptions, the application must handle them gracefully, returning either a custom error page or redirecting the user to a default page, without revealing any information about the database or the application internals."
  mitigations "Strong input validation - All user-controllable input must be validated and filtered for illegal characters as well as SQL content. Keywords such as UNION, SELECT or INSERT must be filtered in addition to characters such as a single-quote(') or SQL-comments (--) based on the context in which they appear."
  example_instances "An adversary may try entering something like &#34;username' AND 1=1; --&#34; in an input field. If the result is the same as when the adversary entered &#34;username&#34; in the field, then the adversary knows that the application is vulnerable to SQL Injection. The adversary can then ask yes/no questions from the database server to extract information from it. For example, the adversary can extract table names from a database using the following types of queries: &#34;username' AND ascii(lower(substring((SELECT TOP 1 name FROM sysobjects WHERE xtype='U'), 1, 1))) > 108&#34;. If the above query executes properly, then the adversary knows that the first character in a table name in the database is a letter between m and z. If it doesn't, then the adversary knows that the character must be between a and l (assuming of course that table names only contain alphabetic characters). By performing a binary search on all character positions, the adversary can determine all table names in the database. Subsequently, the adversary may execute an actual attack and send something like: &#34;username'; DROP TABLE trades; --"
  example_instances "In the PHP application TimeSheet 1.1, an adversary can successfully retrieve username and password hashes from the database using Blind SQL Injection. If the adversary is aware of the local path structure, the adversary can also remotely execute arbitrary code and write the output of the injected queries to the local path. Blind SQL Injection is possible since the application does not properly sanitize the $_POST['username'] variable in the login.php file. See also: CVE-2006-4705"
  related_weaknesses "89"
  related_weaknesses "209"
  related_weaknesses "74"
  related_weaknesses "20"
  related_weaknesses "697"
  related_weaknesses "707"
  matched_cwes "20"
  matched_cwes "89"
  matched_cwes "707"
  matched_cwes "74"
  matched_cwes "209"
  taxonomy_mappings "_networkx_list_start"
  taxonomy_mappings [
    taxonomy_name "OWASP Attacks"
    entry_id ""
    entry_name "Blind SQL Injection"
  ]
  execution_flow [
    step "1"
    phase "Explore"
    description "[Hypothesize SQL queries in application]"
    techniques "_networkx_list_start"
    techniques "Research types of SQL queries and determine which ones could be used at various places in an application."
  ]
  execution_flow [
    step "2"
    phase "Explore"
    description "[Determine how to inject information into the queries]"
    techniques "Add clauses to the SQL queries such that the query logic does not change."
    techniques "Add delays to the SQL queries in case server does not provide clear error messages (e.g. WAITFOR DELAY '0:0:10' in SQL Server or BENCHMARK(1000000000,MD5(1) in MySQL). If these can be injected into the queries, then the length of time that the server takes to respond reveals whether the query is injectable or not."
  ]
  execution_flow [
    step "3"
    phase "Experiment"
    description "[Determine user-controllable input susceptible to injection] Determine the user-controllable input susceptible to injection. For each user-controllable input that the adversary suspects is vulnerable to SQL injection, attempt to inject the values determined in the previous step. If an error does not occur, then the adversary knows that the SQL injection was successful."
    techniques "Use web browser to inject input through text fields or through HTTP GET parameters."
    techniques "Use a web application debugging tool such as Tamper Data, TamperIE, WebScarab,etc. to modify HTTP POST parameters, hidden fields, non-freeform fields, etc."
    techniques "Use network-level packet injection tools such as netcat to inject input"
    techniques "Use modified client (modified by reverse engineering) to inject input."
  ]
  execution_flow [
    step "4"
    phase "Experiment"
    description "[Determine database type] Determines the type of the database, such as MS SQL Server or Oracle or MySQL, using logical conditions as part of the injected queries"
    techniques "Try injecting a string containing char(0x31)=char(0x31) (this evaluates to 1=1 in SQL Server only)"
    techniques "Try injecting a string containing 0x313D31 (this evaluates to 1=1 in MySQL only)"
    techniques "Inject other database-specific commands into input fields susceptible to SQL Injection. The adversary can determine the type of database that is running by checking whether the query executed successfully or not (i.e. whether the adversary received a normal response from the server or not)."
  ]
  execution_flow [
    step "5"
    phase "Exploit"
    description "[Extract information about database schema] Extract information about database schema by getting the database to answer yes/no questions about the schema."
    techniques "Automatically extract database schema using a tool such as Absinthe."
    techniques "Manually perform the blind SQL Injection to extract desired information about the database schema."
  ]
  execution_flow [
    step "6"
    phase "Exploit"
    description "[Exploit SQL Injection vulnerability] Use the information obtained in the previous steps to successfully inject the database in order to bypass checks or modify, add, retrieve or delete data from the database"
    techniques "_networkx_list_start"
    techniques "Use information about how to inject commands into SQL queries as well as information about the database schema to execute attacks such as dropping tables, inserting records, etc."
  ]
  node [
    id 0
    label "create_a_sql_query"
  ]
  node [
    id 1
    label "determine_how_to_inject_information_into_the_queries"
  ]
  node [
    id 2
    label "add_clauses"
  ]
  node [
    id 3
    label "delay_the_operations"
  ]
  node [
    id 4
    label "inject_these"
  ]
  node [
    id 5
    label "determine_user_controllable_input_susceptible_to_injection"
  ]
  node [
    id 6
    label "inject_the_values_determined_in_the_previous_step"
  ]
  node [
    id 7
    label "inject_input"
  ]
  node [
    id 8
    label "debug_tool_such_as_tamper_data_tamperie_webscarab_etc"
  ]
  node [
    id 9
    label "show_a_database_type"
  ]
  node [
    id 10
    label "determine_the_type_of_the_database_such_as_ms_sql_server_or_oracle_or_mysql"
  ]
  node [
    id 11
    label "try_injecting_a_string_containing_char_0x31_char_0x31"
  ]
  node [
    id 12
    label "inject_other_database_specific_commands"
  ]
  node [
    id 13
    label "determine_the_type_of_database_that_is_running_by_checking_whether_the_query_executed_successfully_or_not"
  ]
  node [
    id 14
    label "extract_information_about_database_schema"
  ]
  node [
    id 15
    label "perform_the_blind_sql_injection"
  ]
  node [
    id 16
    label "perform_command_injection"
  ]
  node [
    id 17
    label "try_entering_something_like_username_and_1_1"
  ]
  node [
    id 18
    label "ask_no_questions_from_the_database_server"
  ]
  node [
    id 19
    label "extract_table_names"
  ]
  node [
    id 20
    label "know_if_it_does_n_t"
  ]
  node [
    id 21
    label "perform_a_binary_search_on_all_character_positions"
  ]
  node [
    id 22
    label "execute_this_type_of_attack"
  ]
  node [
    id 23
    label "retrieve_the_user_name_and_password"
  ]
  node [
    id 24
    label "execute_arbitrary_code"
  ]
  node [
    id 25
    label "sanitize_the"
  ]
  node [
    id 26
    label "validate_that"
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
    source 7
    target 9
  ]
  edge [
    source 8
    target 7
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
  edge [
    source 24
    target 25
  ]
  edge [
    source 25
    target 26
  ]
]
