graph [
  directed 1
  capec_id "676"
  name "NoSQL Injection"
  abstraction "Standard"
  status "Stable"
  description "&#10;            "
  likelihood "High"
  severity "High"
  related_attack_patterns "_networkx_list_start"
  related_attack_patterns [
    capec_id "248"
    nature "ChildOf"
  ]
  prerequisites "Awareness of the technology stack being leveraged by the target application."
  prerequisites "NoSQL queries used by the application to store, retrieve, or modify data."
  prerequisites "User-controllable input that is not properly validated by the application as part of NoSQL queries."
  prerequisites "Target potentially susceptible to operator replacement attacks."
  skills_required [
    level "Low"
    description "For keyword and JavaScript injection attacks, it is fairly simple for someone with basic NoSQL knowledge to perform NoSQL injection, once the target's technology stack has been determined."
  ]
  skills_required [
    level "Medium"
    description "For operator replacement attacks, the adversary must also have knowledge of HTTP Parameter Pollution attacks and how to conduct them."
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
  mitigations "Strong input validation - All user-controllable input must be validated and filtered for illegal characters as well as relevant NoSQL and JavaScript content. NoSQL-specific keywords, such as $ne, $eq or $gt for MongoDB, must be filtered in addition to characters such as a single-quote(') or semicolons (;) based on the context in which they appear. Validation should also extend to expected types."
  mitigations "If possible, leverage safe APIs (e.g., PyMongo and Flask-PyMongo for Python and MongoDB) for queries as opposed to building queries from strings."
  mitigations "Ensure the most recent version of a NoSQL database and it's corresponding API are used by the application."
  mitigations "Use of custom error pages - Adversaries can glean information about the nature of queries from descriptive error messages. Input validation must be coupled with customized error pages that inform about an error without disclosing information about the database or application."
  mitigations "Exercise the principle of Least Privilege with regards to application accounts to minimize damage if a NoSQL injection attack is successful."
  mitigations "If using MongoDB, disable server-side JavaScript execution and leverage a sanitization module such as &#34;mongo-sanitize&#34;."
  mitigations "If using PHP with MongoDB, ensure all special query operators (starting with $) use single quotes to prevent operator replacement attacks."
  mitigations "Additional mitigations will depend on the NoSQL database, API, and programming language leveraged by the application."
  example_instances "The following examples primarily cite MongoDB, PHP, and NodeJS attacks due to their prominence and popularity. However, please note that these attacks are not exclusive to this NoSQL instance, programming language, or runtime framework. Within NodeJS, Login Bypass attacks are possible via MongoDB if user-input is not properly validated and sanitized [REF-670]. //NodeJS with Express.js db.collection('users').find({ &#34;user&#34;: req.query.user,  &#34;password&#34;: req.query.password });  The above code works fine if the user were to submit a query like the following: https://example.org/login?user=patrick&#38;password=1234  But an adversary could submit a malicious query such as the below, which would be interpreted by the code as follows: https://example.org/login?user=patrick&#38;password[$ne]= //NodeJS with Express.js db.collection('users').find({ &#34;user&#34;: bob,  &#34;password&#34;: {&#34;&#38;ne&#34;: &#34;&#34;} }); This will result in a Login Bypass attack, as the query will succeed for all values where Bob's password is not an empty string."
  example_instances "MongoDB instances are also vulnerable to JavaScript Injection Attacks when user input is not properly validated and sanitized. //PHP with MongoDB db.collection.find({$where: function() { return (this.username == $username) } } );  If the user properly specifies a username, then this code will execute as intended. However, an adversary can inject JavaScript into the &#34;$username&#34; variable to achieve a NoSQL Injection attack as follows: //PHP with MongoDB db.collection.find({$where: function() { return (this.username == 'foo'; sleep(5000) ) } } ); This will result in the server sleeping for 5 seconds if the attack was successful. An adversary could supply a larger value to deny service to the application."
  example_instances "If leveraging PHP with MongoDB, operator replacement attacks are possible if special query operators are not properly addressed. The below example from OWASP's &#34;Test for NoSQL Injection&#34; displays a simple case of how this could occur.[REF-668] db.myCollection.find({$where: function() { return obj.credits - obj.debits < 0; } } );  Even though the above query does not depend on any user input, it is vulnerable to a NoSQL injection attack via operator replacement on the &#34;$where&#34; keyword. In this case, the adversary could exploit MongoDB in the following manner: $where: function() { //arbitrary JavaScript here }"
  related_weaknesses "943"
  related_weaknesses "1286"
  matched_cwes "_networkx_list_start"
  matched_cwes "1286"
  taxonomy_mappings "[]"
  execution_flow [
    step "1"
    phase "Explore"
    description "[Survey target application] Due to the number of NoSQL databases available and the numerous language/API combinations of each, the adversary must first survey the target application to learn what technologies are being leveraged and how they interact with user-driven data."
    techniques "Determine the technology stack leveraged by the target application, such as the application server, drivers, frameworks, APIs, and databases being utilized."
    techniques "Identify areas of the application that interact with user input and may be involved with NoSQL queries."
  ]
  execution_flow [
    step "2"
    phase "Experiment"
    description "[Identify user-controllable input susceptible to injection] After identifying the technology stack being used and where user-driven input is leveraged, determine the user-controllable input susceptible to injection such as authentication or search forms. For each user-controllable input that the adversary suspects is vulnerable to NoSQL injection, attempt to inject characters or keywords that have special meaning in the given NoSQL database or language (e.g., &#34;$ne&#34; for MongoDB or &#34;$exists&#34; for PHP/MongoDB), or JavaScript that can be executed within the application. The goal is to create a NoSQL query with an invalid syntax."
    techniques "Use web browser to inject input through text fields or through HTTP GET parameters."
    techniques "Use a web application debugging tool such as Tamper Data, TamperIE, WebScarab,etc. to modify HTTP POST parameters, hidden fields, non-freeform fields, etc."
    techniques "Use network-level packet injection tools such as netcat to inject input"
    techniques "Use modified client (modified by reverse engineering) to inject input."
  ]
  execution_flow [
    step "3"
    phase "Experiment"
    description "[Experiment with NoSQL Injection vulnerabilities] After determining that a given input is vulnerable to NoSQL Injection, hypothesize what the underlying query looks like. Iteratively try to add logic to the query to extract information from the database, modify/delete information in the database, or execute commands on the server."
    techniques "Use public resources such as OWASP's &#34;Testing for NoSQL Injection&#34; [REF-668] or Null Sweep's &#34;NoSQL Injection Cheatsheet&#34; [REF-669] and try different approaches for adding logic to NoSQL queries."
    techniques "Iteratively add logic to the NoSQL query and use detailed error messages from the server to debug the query."
    techniques "Attempt an HTTP Parameter Pollution attack to replace language-specific keywords, such as &#34;where&#34; within PHP [CAPEC-460]."
  ]
  execution_flow [
    step "4"
    phase "Exploit"
    description "[Exploit NoSQL Injection vulnerability] After refining and adding various logic to NoSQL queries, craft and execute the underlying NoSQL query that will be used to attack the target system."
    techniques "_networkx_list_start"
    techniques "Craft and Execute underlying NoSQL query"
  ]
  node [
    id 0
    label "survey_the_target_application"
  ]
  node [
    id 1
    label "determine_the_technology_stack_leveraged_by_the_target_application_such_as_the_application_server_drivers_frameworks_apis_and_databases_being_utilized"
  ]
  node [
    id 2
    label "identify_areas_of_the_application_that_interact_with_user_input_and_may_be_involved_with_nosql_queries"
  ]
  node [
    id 3
    label "determine_user_controllable_input_susceptible_to_injection"
  ]
  node [
    id 4
    label "inject_characters_or_keywords_that_have_special_meaning"
  ]
  node [
    id 5
    label "create_a_nosql_query"
  ]
  node [
    id 6
    label "inject_input"
  ]
  node [
    id 7
    label "debug_tool_such_as_tamper_data_tamperie_webscarab_etc"
  ]
  node [
    id 8
    label "try_to_add_logic_to_the_query_to_extract_information_from_the_database_or_to_modify_or_delete_information_in_the_database"
  ]
  node [
    id 9
    label "try_different_approaches_for_adding_logic_to_nosql_queries"
  ]
  node [
    id 10
    label "add_logic"
  ]
  node [
    id 11
    label "attempt_an_http_parameter_pollution_attack"
  ]
  node [
    id 12
    label "validate_user_input"
  ]
  node [
    id 13
    label "work_if_the_user_were_to_submit_a_query_like_the_following"
  ]
  node [
    id 14
    label "specify_a_username"
  ]
  node [
    id 15
    label "inject_arbitrary_javascript_code"
  ]
  node [
    id 16
    label "supply_a_larger_value"
  ]
  node [
    id 17
    label "leverage_php"
  ]
  node [
    id 18
    label "display_a_simple_case_of_how_this_could_occur_ref_668_db_mycollection_find_where_function"
  ]
  node [
    id 19
    label "exploit_mongodb"
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
    source 6
    target 7
  ]
  edge [
    source 6
    target 8
  ]
  edge [
    source 7
    target 6
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
    source 12
    target 14
  ]
  edge [
    source 13
    target 12
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
