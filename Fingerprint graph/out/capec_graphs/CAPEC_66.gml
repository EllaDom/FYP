graph [
  directed 1
  capec_id "66"
  name "SQL Injection"
  abstraction "Standard"
  status "Draft"
  description "This attack exploits target software that constructs SQL statements based on user input. An attacker crafts input strings so that when the target software constructs SQL statements based on the input, the resulting SQL statement performs actions other than those the application intended. SQL Injection results from failure of the application to appropriately validate input."
  likelihood "High"
  severity "High"
  related_attack_patterns "_networkx_list_start"
  related_attack_patterns [
    capec_id "248"
    nature "ChildOf"
  ]
  prerequisites "SQL queries used by the application to store, retrieve or modify data."
  prerequisites "User-controllable input that is not properly validated by the application as part of SQL queries."
  skills_required "_networkx_list_start"
  skills_required [
    level "Low"
    description "It is fairly simple for someone with basic SQL knowledge to perform SQL injection, in general. In certain instances, however, specific knowledge of the database employed may be required."
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
  consequences [
    scope "Confidentiality"
    scope "Access Control"
    scope "Authorization"
    impact "Gain Privileges"
  ]
  mitigations "Strong input validation - All user-controllable input must be validated and filtered for illegal characters as well as SQL content. Keywords such as UNION, SELECT or INSERT must be filtered in addition to characters such as a single-quote(') or SQL-comments (--) based on the context in which they appear."
  mitigations "Use of parameterized queries or stored procedures - Parameterization causes the input to be restricted to certain domains, such as strings or integers, and any input outside such domains is considered invalid and the query fails. Note that SQL Injection is possible even in the presence of stored procedures if the eventual query is constructed dynamically."
  mitigations "Use of custom error pages - Attackers can glean information about the nature of queries from descriptive error messages. Input validation must be coupled with customized error pages that inform about an error without disclosing information about the database or application."
  example_instances "_networkx_list_start"
  example_instances "With PHP-Nuke versions 7.9 and earlier, an attacker can successfully access and modify data, including sensitive contents such as usernames and password hashes, and compromise the application through SQL Injection. The protection mechanism against SQL Injection employs a denylist approach to input validation. However, because of an improper denylist, it is possible to inject content such as &#34;foo'/**/UNION&#34; or &#34;foo UNION/**/&#34; to bypass validation and glean sensitive information from the database. See also: CVE-2006-5525"
  related_weaknesses "89"
  related_weaknesses "1286"
  matched_cwes "1286"
  matched_cwes "89"
  taxonomy_mappings [
    taxonomy_name "WASC"
    entry_id "19"
    entry_name "SQL Injection"
  ]
  taxonomy_mappings [
    taxonomy_name "OWASP Attacks"
    entry_id ""
    entry_name "SQL Injection"
  ]
  execution_flow [
    step "1"
    phase "Explore"
    description "[Survey application] The attacker first takes an inventory of the functionality exposed by the application."
    techniques "Spider web sites for all available links"
    techniques "Sniff network communications with application using a utility such as WireShark."
  ]
  execution_flow [
    step "2"
    phase "Experiment"
    description "[Determine user-controllable input susceptible to injection] Determine the user-controllable input susceptible to injection. For each user-controllable input that the attacker suspects is vulnerable to SQL injection, attempt to inject characters that have special meaning in SQL (such as a single quote character, a double quote character, two hyphens, a parenthesis, etc.). The goal is to create a SQL query with an invalid syntax."
    techniques "Use web browser to inject input through text fields or through HTTP GET parameters."
    techniques "Use a web application debugging tool such as Tamper Data, TamperIE, WebScarab,etc. to modify HTTP POST parameters, hidden fields, non-freeform fields, etc."
    techniques "Use network-level packet injection tools such as netcat to inject input"
    techniques "Use modified client (modified by reverse engineering) to inject input."
  ]
  execution_flow [
    step "3"
    phase "Experiment"
    description "[Experiment with SQL Injection vulnerabilities] After determining that a given input is vulnerable to SQL Injection, hypothesize what the underlying query looks like. Iteratively try to add logic to the query to extract information from the database, or to modify or delete information in the database."
    techniques "Use public resources such as &#34;SQL Injection Cheat Sheet&#34; at http://ferruh.mavituna.com/makale/sql-injection-cheatsheet/, and try different approaches for adding logic to SQL queries."
    techniques "Add logic to query, and use detailed error messages from the server to debug the query. For example, if adding a single quote to a query causes an error message, try : &#34;' OR 1=1; --&#34;, or something else that would syntactically complete a hypothesized query. Iteratively refine the query."
    techniques "Use &#34;Blind SQL Injection&#34; techniques to extract information about the database schema."
    techniques "If a denial of service attack is the goal, try stacking queries. This does not work on all platforms (most notably, it does not work on Oracle or MySQL). Examples of inputs to try include: &#34;'; DROP TABLE SYSOBJECTS; --&#34; and &#34;'); DROP TABLE SYSOBJECTS; --&#34;. These particular queries will likely not work because the SYSOBJECTS table is generally protected."
  ]
  execution_flow [
    step "4"
    phase "Exploit"
    description "[Exploit SQL Injection vulnerability] After refining and adding various logic to SQL queries, craft and execute the underlying SQL query that will be used to attack the target system. The goal is to reveal, modify, and/or delete database data, using the knowledge obtained in the previous step. This could entail crafting and executing multiple SQL queries if a denial of service attack is the intent."
    techniques "_networkx_list_start"
    techniques "Craft and Execute underlying SQL query"
  ]
  node [
    id 0
    label "take_an_inventory_of_the_entry_points_of_the_application"
  ]
  node [
    id 1
    label "use_a_utility_such_as_wireshark"
  ]
  node [
    id 2
    label "determine_user_controllable_input_susceptible_to_injection"
  ]
  node [
    id 3
    label "inject_characters_that_have_special_meaning_in_sql_such_as_a_single_quote_character_a_double_quote_character_two_hyphens_a_parenthesis_etc"
  ]
  node [
    id 4
    label "create_a_sql_query"
  ]
  node [
    id 5
    label "inject_input"
  ]
  node [
    id 6
    label "debug_tool_such_as_tamper_data_tamperie_webscarab_etc"
  ]
  node [
    id 7
    label "vulnerabilitie_after_determining_that_a_given_input_is_vulnerable_to_sql_injection_hypothesize_the_underlying_query_looks_what_like"
  ]
  node [
    id 8
    label "try_to_add_logic_to_the_query_to_extract_information_from_the_database_or_to_modify_or_delete_information_in_the_database"
  ]
  node [
    id 9
    label "try_different_approaches_for_adding_logic_to_sql_queries"
  ]
  node [
    id 10
    label "add_logic"
  ]
  node [
    id 11
    label "add_a_single_quote"
  ]
  node [
    id 12
    label "refine_the_query"
  ]
  node [
    id 13
    label "extract_information_about_database_schema"
  ]
  node [
    id 14
    label "try_if_a_denial_of_service_attack_is_the_goal"
  ]
  node [
    id 15
    label "work_most_notably_it_does_not_work_on_oracle_or_mysql"
  ]
  node [
    id 16
    label "work_because_the_sysobjects_table_is_generally_protected"
  ]
  node [
    id 17
    label "entail_crafting_and_executing_multiple_sql_queries"
  ]
  node [
    id 18
    label "employ_a_denylist_approach"
  ]
  node [
    id 19
    label "inject_content_such_as_foo_union_or_foo_union_to_bypass_validation_and_glean_sensitive_information_from_the_database"
  ]
  node [
    id 20
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
    source 5
    target 7
  ]
  edge [
    source 6
    target 5
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
]
