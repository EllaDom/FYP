graph [
  directed 1
  capec_id "84"
  name "XQuery Injection"
  abstraction "Detailed"
  status "Draft"
  description "This attack utilizes XQuery to probe and attack server systems; in a similar manner that SQL Injection allows an attacker to exploit SQL calls to RDBMS, XQuery Injection uses improperly validated data that is passed to XQuery commands to traverse and execute commands that the XQuery routines have access to. XQuery injection can be used to enumerate elements on the victim's environment, inject commands to the local host, or execute queries to remote files and data sources."
  likelihood "High"
  severity "Very High"
  related_attack_patterns "_networkx_list_start"
  related_attack_patterns [
    capec_id "250"
    nature "ChildOf"
  ]
  prerequisites "_networkx_list_start"
  prerequisites "The XQL must execute unvalidated data"
  skills_required "_networkx_list_start"
  skills_required [
    level "Low"
    description "Basic understanding of XQuery"
  ]
  resources_required "[]"
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
  mitigations "Design: Perform input allowlist validation on all XML input"
  mitigations "Implementation: Run xml parsing and query infrastructure with minimal privileges so that an attacker is limited in their ability to probe other system resources from XQL."
  example_instances "_networkx_list_start"
  example_instances "An attacker can pass XQuery expressions embedded in otherwise standard XML documents. Like SQL injection attacks, the attacker tunnels through the application entry point to target the resource access layer. The string below is an example of an attacker accessing the accounts.xml to request the service provider send all user names back. doc(accounts.xml)//user[Name='*'] The attacks that are possible through XQuery are difficult to predict, if the data is not validated prior to executing the XQL."
  related_weaknesses "74"
  related_weaknesses "707"
  matched_cwes "74"
  matched_cwes "707"
  taxonomy_mappings "_networkx_list_start"
  taxonomy_mappings [
    taxonomy_name "WASC"
    entry_id "46"
    entry_name "XQuery Injection"
  ]
  execution_flow [
    step "1"
    phase "Explore"
    description "[Survey the application for user-controllable inputs] Using a browser or an automated tool, an attacker follows all public links and actions on a web site. They record all the links, the forms, the resources accessed and all other potential entry-points for the web application."
    techniques "Use a spidering tool to follow and record all links and analyze the web pages to find entry points. Make special note of any links that include parameters in the URL."
    techniques "Use a proxy tool to record all user input entry points visited during a manual traversal of the web application."
    techniques "Use a browser to manually explore the website and analyze how it is constructed. Many browsers' plugins are available to facilitate the analysis or automate the discovery."
  ]
  execution_flow [
    step "2"
    phase "Experiment"
    description "[Determine user-controllable input susceptible to injection] Determine the user-controllable input susceptible to injection. For each user-controllable input that the attacker suspects is vulnerable to XQL injection, attempt to inject characters that have special meaning in XQL. The goal is to create an XQL query with an invalid syntax."
    techniques "Use web browser to inject input through text fields or through HTTP GET parameters."
    techniques "Use a web application debugging tool such as Tamper Data, TamperIE, WebScarab,etc. to modify HTTP POST parameters, hidden fields, non-freeform fields, etc."
    techniques "Use XML files to inject input."
    techniques "Use network-level packet injection tools such as netcat to inject input"
    techniques "Use modified client (modified by reverse engineering) to inject input."
  ]
  execution_flow [
    step "3"
    phase "Exploit"
    description "[Information Disclosure] The attacker crafts and injects an XQuery payload which is acted on by an XQL query leading to inappropriate disclosure of information."
    techniques "_networkx_list_start"
    techniques "Leveraging one of the vulnerable inputs identified during the Experiment phase, inject malicious XQuery payload. The payload aims to get information on the structure of the underlying XML database and/or the content in it."
  ]
  execution_flow [
    step "4"
    phase "Exploit"
    description "[Manipulate the data in the XML database] The attacker crafts and injects an XQuery payload which is acted on by an XQL query leading to modification of application data."
    techniques "_networkx_list_start"
    techniques "Leveraging one of the vulnerable inputs identified during the Experiment phase, inject malicious XQuery payload.. The payload tries to insert or replace data in the XML database."
  ]
  node [
    id 0
    label "survey_the_application_for_user_controllable_inputs"
  ]
  node [
    id 1
    label "record_all_the_links_the_forms"
  ]
  node [
    id 2
    label "make_special_note_of_any_links_that_include_parameters_in_the_url"
  ]
  node [
    id 3
    label "record_all_links_visited_during_a_manual_traversal_of_the_web_application"
  ]
  node [
    id 4
    label "explore_the_website"
  ]
  node [
    id 5
    label "facilitate_the_analysis"
  ]
  node [
    id 6
    label "determine_user_controllable_input_susceptible_to_injection"
  ]
  node [
    id 7
    label "inject_characters_or_keywords_that_have_special_meaning"
  ]
  node [
    id 8
    label "create_an_xql_query"
  ]
  node [
    id 9
    label "inject_input"
  ]
  node [
    id 10
    label "debug_tool_such_as_tamper_data_tamperie_webscarab_etc"
  ]
  node [
    id 11
    label "inject_an_xquery_payload_which_is_acted_on_by_an_xql_query_leading_to_inappropriate_disclosure_of_information"
  ]
  node [
    id 12
    label "leverage_one_of_the_vulnerable_inputs_identified_during_the_experiment_phase"
  ]
  node [
    id 13
    label "aim_to_get_information_on_the_structure_of_the_underlying_xml_database_and_or_the_content_in_it"
  ]
  node [
    id 14
    label "manipulate_the_data_in_the_xml_database"
  ]
  node [
    id 15
    label "pass_xquery_expressions_embedded_in_otherwise_standard_xml_documents"
  ]
  node [
    id 16
    label "tunnel_attacker"
  ]
  node [
    id 17
    label "access_the_accounts_xml"
  ]
  node [
    id 18
    label "execute_unvalidated_data"
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
    source 9
    target 9
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
    source 12
    target 14
  ]
  edge [
    source 13
    target 14
  ]
  edge [
    source 14
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
    target 17
  ]
  edge [
    source 17
    target 18
  ]
]
