graph [
  directed 1
  capec_id "250"
  name "XML Injection"
  abstraction "Standard"
  status "Draft"
  description "An attacker utilizes crafted XML user-controllable input to probe, attack, and inject data into the XML database, using techniques similar to SQL injection. The user-controllable input can allow for unauthorized viewing of data, bypassing authentication or the front-end application for direct XML database access, and possibly altering database information."
  likelihood "High"
  severity ""
  related_attack_patterns "_networkx_list_start"
  related_attack_patterns [
    capec_id "248"
    nature "ChildOf"
  ]
  prerequisites "XML queries used to process user input and retrieve information stored in XML documents"
  prerequisites "User-controllable input not properly sanitized"
  skills_required "_networkx_list_start"
  skills_required [
    level "Low"
    description "An attacker must have knowledge of XML syntax and constructs in order to successfully leverage XML Injection"
  ]
  resources_required "_networkx_list_start"
  resources_required "None: No specialized resources are required to execute this type of attack."
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
  mitigations "Strong input validation - All user-controllable input must be validated and filtered for illegal characters as well as content that can be interpreted in the context of an XML data or a query."
  mitigations "Use of custom error pages - Attackers can glean information about the nature of queries from descriptive error messages. Input validation must be coupled with customized error pages that inform about an error without disclosing information about the database or application."
  example_instances "_networkx_list_start"
  example_instances "Consider an application that uses an XML database to authenticate its users. The application retrieves the user name and password from a request and forms an XPath expression to query the database. An attacker can successfully bypass authentication and login without valid credentials through XPath Injection. This can be achieved by injecting the query to the XML database with XPath syntax that causes the authentication check to fail. Improper validation of user-controllable input and use of a non-parameterized XPath expression enable the attacker to inject an XPath expression that causes authentication bypass."
  related_weaknesses "91"
  related_weaknesses "74"
  related_weaknesses "20"
  related_weaknesses "707"
  matched_cwes "20"
  matched_cwes "74"
  matched_cwes "91"
  matched_cwes "707"
  taxonomy_mappings "_networkx_list_start"
  taxonomy_mappings [
    taxonomy_name "WASC"
    entry_id "23"
    entry_name "XML Injection"
  ]
  execution_flow [
    step "1"
    phase "Explore"
    description "[Survey the Target] Using a browser or an automated tool, an adversary records all instances of user-controllable input used to contruct XML queries"
    techniques "Use an automated tool to record all instances of user-controllable input used to contruct XML queries."
    techniques "Use a browser to manually explore the website and analyze how the application processes inputs."
  ]
  execution_flow [
    step "2"
    phase "Experiment"
    description "[Determine the Structure of Queries] Using manual or automated means, test inputs found for XML weaknesses."
    techniques "_networkx_list_start"
    techniques "Use XML reserved characters or words, possibly with other input data to attempt to cause unexpected results and identify improper input validation."
  ]
  execution_flow [
    step "3"
    phase "Exploit"
    description "[Inject Content into XML Queries] Craft malicious content containing XML expressions that is not validated by the application and is executed as part of the XML queries."
    techniques "_networkx_list_start"
    techniques "Use the crafted input to execute unexpected queries that can disclose sensitive database information to the attacker."
  ]
  node [
    id 0
    label "survey_the_target_application"
  ]
  node [
    id 1
    label "record_all_instances_of_user_controllable_input_used_to_contruct_xml_queries"
  ]
  node [
    id 2
    label "explore_the_website"
  ]
  node [
    id 3
    label "determine_the_structure_of_queries"
  ]
  node [
    id 4
    label "execute_unexpected_queries_that_can_disclose_sensitive_database_information_to_the_attacker"
  ]
  node [
    id 5
    label "consider_an_application_that_uses_an_xml_database_to_authenticate_its_users"
  ]
  node [
    id 6
    label "retrieve_the_user_name_and_password"
  ]
  node [
    id 7
    label "bypass_authentication_and_login"
  ]
  node [
    id 8
    label "achieve_this"
  ]
  node [
    id 9
    label "enable_the_attacker"
  ]
  node [
    id 10
    label "process_user_input"
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
]
