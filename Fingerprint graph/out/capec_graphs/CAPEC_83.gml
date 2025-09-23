graph [
  directed 1
  capec_id "83"
  name "XPath Injection"
  abstraction "Detailed"
  status "Draft"
  description "An attacker can craft special user-controllable input consisting of XPath expressions to inject the XML database and bypass authentication or glean information that they normally would not be able to. XPath Injection enables an attacker to talk directly to the XML database, thus bypassing the application completely. XPath Injection results from the failure of an application to properly sanitize input used as part of dynamic XPath expressions used to query an XML database."
  likelihood "High"
  severity "High"
  related_attack_patterns "_networkx_list_start"
  related_attack_patterns [
    capec_id "250"
    nature "ChildOf"
  ]
  prerequisites "XPath queries used to retrieve information stored in XML documents"
  prerequisites "User-controllable input not properly sanitized before being used as part of XPath queries"
  skills_required "_networkx_list_start"
  skills_required [
    level "Low"
    description "XPath Injection shares the same basic premises with SQL Injection. An attacker must have knowledge of XPath syntax and constructs in order to successfully leverage XPath Injection"
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
  mitigations "Strong input validation - All user-controllable input must be validated and filtered for illegal characters as well as content that can be interpreted in the context of an XPath expression. Characters such as a single-quote(') or operators such as or (|), and (&#38;) and such should be filtered if the application does not expect them in the context in which they appear. If such content cannot be filtered, it must at least be properly escaped to avoid them being interpreted as part of XPath expressions."
  mitigations "Use of parameterized XPath queries - Parameterization causes the input to be restricted to certain domains, such as strings or integers, and any input outside such domains is considered invalid and the query fails."
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
  taxonomy_mappings [
    taxonomy_name "WASC"
    entry_id "39"
    entry_name "XPath Injection"
  ]
  taxonomy_mappings [
    taxonomy_name "OWASP Attacks"
    entry_id ""
    entry_name "Blind XPath Injection"
  ]
  taxonomy_mappings [
    taxonomy_name "OWASP Attacks"
    entry_id ""
    entry_name "XPATH Injection"
  ]
  execution_flow [
    step "1"
    phase "Explore"
    description "[Survey the target] Using a browser or an automated tool, an adversary records all instances of user-controllable input used to contruct XPath queries."
    techniques "Use an automated tool to record all instances of user-controllable input used to contruct XPath queries."
    techniques "Use a browser to manually explore the website and analyze how the application processes inputs."
  ]
  execution_flow [
    step "2"
    phase "Explore"
    description "[Determine the tructure of queries] Using manual or automated means, test inputs found for XPath weaknesses."
    techniques "Use an automated tool automatically probe the inputs for XPath weaknesses."
    techniques "Manually probe the inputs using characters such as single quote (') that can cause XPath-releated errors, thus indicating an XPath weakness."
  ]
  execution_flow [
    step "3"
    phase "Exploit"
    description "[Inject content into XPath query] Craft malicious content containing XPath expressions that is not validated by the application and is executed as part of the XPath queries."
    techniques "Use the crafted input to execute unexpected queries that can disclose sensitive database information to the attacker."
    techniques "Use a combination of single quote (') and boolean expressions such as &#34;or 1=1&#34; to manipulate XPath logic."
    techniques "Use XPath functions in the malicious content such as &#34;string-length&#34;, &#34;substring&#34;, or &#34;count&#34; to gain information about the XML document structure being used."
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
    label "determine_the_tructure_of_queries"
  ]
  node [
    id 4
    label "probe_the_inputs_for_xpath_weaknesses"
  ]
  node [
    id 5
    label "craft_malicious_content_containing_xpath_expressions_that_is_not_validated_by_the_application_and_is_executed_as_part_of_the_xpath_queries"
  ]
  node [
    id 6
    label "execute_unexpected_queries_that_can_disclose_sensitive_database_information_to_the_attacker"
  ]
  node [
    id 7
    label "manipulate_xpath_logic"
  ]
  node [
    id 8
    label "substre_to_gain_information_about_the_xml_document_structure_being_used"
  ]
  node [
    id 9
    label "consider_an_application_that_uses_an_xml_database_to_authenticate_its_users"
  ]
  node [
    id 10
    label "retrieve_the_user_name_and_password"
  ]
  node [
    id 11
    label "bypass_authentication_and_login"
  ]
  node [
    id 12
    label "achieve_this"
  ]
  node [
    id 13
    label "enable_the_attacker"
  ]
  node [
    id 14
    label "retrieve_information_stored_in_xml_documents"
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
