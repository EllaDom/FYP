graph [
  directed 1
  capec_id "136"
  name "LDAP Injection"
  abstraction "Standard"
  status "Draft"
  description "An attacker manipulates or crafts an LDAP query for the purpose of undermining the security of the target. Some applications use user input to create LDAP queries that are processed by an LDAP server. For example, a user might provide their username during authentication and the username might be inserted in an LDAP query during the authentication process. An attacker could use this input to inject additional commands into an LDAP query that could disclose sensitive information. For example, entering a * in the aforementioned query might return information about all users on the system. This attack is very similar to an SQL injection attack in that it manipulates a query to gather additional information or coerce a particular return value."
  likelihood "High"
  severity "High"
  related_attack_patterns "_networkx_list_start"
  related_attack_patterns [
    capec_id "248"
    nature "ChildOf"
  ]
  prerequisites "_networkx_list_start"
  prerequisites "The target application must accept a string as user input, fail to sanitize characters that have a special meaning in LDAP queries in the user input, and insert the user-supplied string in an LDAP query which is then processed."
  skills_required "_networkx_list_start"
  skills_required [
    level "Medium"
    description "The attacker needs to have knowledge of LDAP, especially its query syntax."
  ]
  resources_required "[]"
  consequences [
    scope "_networkx_list_start"
    scope "Availability"
    impact "Unreliable Execution"
  ]
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
    scope "Authorization"
    impact "Execute Unauthorized Commands"
  ]
  consequences [
    scope "Accountability"
    scope "Authentication"
    scope "Authorization"
    scope "Non-Repudiation"
    impact "Gain Privileges"
  ]
  consequences [
    scope "Access Control"
    scope "Authorization"
    impact "Bypass Protection Mechanism"
  ]
  mitigations "Strong input validation - All user-controllable input must be validated and filtered for illegal characters as well as LDAP content."
  mitigations "Use of custom error pages - Attackers can glean information about the nature of queries from descriptive error messages. Input validation must be coupled with customized error pages that inform about an error without disclosing information about the LDAP or application."
  example_instances "_networkx_list_start"
  example_instances "PowerDNS before 2.9.18, when running with an LDAP backend, does not properly escape LDAP queries, which allows remote attackers to cause a denial of service (failure to answer ldap questions) and possibly conduct an LDAP injection attack. See also: CVE-2005-2301"
  related_weaknesses "77"
  related_weaknesses "90"
  related_weaknesses "20"
  matched_cwes "20"
  matched_cwes "77"
  taxonomy_mappings [
    taxonomy_name "WASC"
    entry_id "29"
    entry_name "LDAP Injection"
  ]
  taxonomy_mappings [
    taxonomy_name "OWASP Attacks"
    entry_id ""
    entry_name "LDAP Injection"
  ]
  execution_flow [
    step "1"
    phase "Explore"
    description "[Survey application] The attacker takes an inventory of the entry points of the application."
    techniques "Spider web sites for all available links"
    techniques "Sniff network communications with application using a utility such as WireShark."
  ]
  execution_flow [
    step "2"
    phase "Experiment"
    description "[Determine user-controllable input susceptible to LDAP injection] For each user-controllable input that the attacker suspects is vulnerable to LDAP injection, attempt to inject characters that have special meaning in LDAP (such as a single quote character, etc.). The goal is to create a LDAP query with an invalid syntax"
    techniques "Use web browser to inject input through text fields or through HTTP GET parameters"
    techniques "Use a web application debugging tool such as Tamper Data, TamperIE, WebScarab,etc. to modify HTTP POST parameters, hidden fields, non-freeform fields, or other HTTP header."
    techniques "Use modified client (modified by reverse engineering) to inject input."
  ]
  execution_flow [
    step "3"
    phase "Experiment"
    description "[Try to exploit the LDAP injection vulnerability] After determining that a given input is vulnerable to LDAP Injection, hypothesize what the underlying query looks like. Possibly using a tool, iteratively try to add logic to the query to extract information from the LDAP, or to modify or delete information in the LDAP."
    techniques "Add logic to the LDAP query to change the meaning of that command. Automated tools could be used to generate the LDAP injection strings."
    techniques "Use a web application debugging tool such as Tamper Data, TamperIE, WebScarab,etc. to modify HTTP POST parameters, hidden fields, non-freeform fields, or other HTTP header."
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
    label "create_a_ldap_query"
  ]
  node [
    id 4
    label "inject_input"
  ]
  node [
    id 5
    label "debug_tool_such_as_tamper_data_tamperie_webscarab_etc"
  ]
  node [
    id 6
    label "try_to_exploit_the_ldap_injection_vulnerability"
  ]
  node [
    id 7
    label "try_possibly_using_a_tool"
  ]
  node [
    id 8
    label "add_logic"
  ]
  node [
    id 9
    label "accept_a_string_as_user_input"
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
    target 9
  ]
  edge [
    source 6
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
    target 6
  ]
]
