graph [
  directed 1
  capec_id "135"
  name "Format String Injection"
  abstraction "Standard"
  status "Draft"
  description "An adversary includes formatting characters in a string input field on the target application. Most applications assume that users will provide static text and may respond unpredictably to the presence of formatting character. For example, in certain functions of the C programming languages such as printf, the formatting character %s will print the contents of a memory location expecting this location to identify a string and the formatting character %n prints the number of DWORD written in the memory. An adversary can use this to read or write to memory locations or files, or simply to manipulate the value of the resulting text in unexpected ways. Reading or writing memory may result in program crashes and writing memory could result in the execution of arbitrary code if the adversary can write to the program stack."
  likelihood "High"
  severity "High"
  related_attack_patterns "_networkx_list_start"
  related_attack_patterns [
    capec_id "137"
    nature "ChildOf"
  ]
  prerequisites "_networkx_list_start"
  prerequisites "The target application must accept a strings as user input, fail to sanitize string formatting characters in the user input, and process this string using functions that interpret string formatting characters."
  skills_required "_networkx_list_start"
  skills_required [
    level "High"
    description "In order to discover format string vulnerabilities it takes only low skill, however, converting this discovery into a working exploit requires advanced knowledge on the part of the adversary."
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
    scope "Access Control"
    impact "Gain Privileges"
  ]
  consequences [
    scope "_networkx_list_start"
    scope "Integrity"
    impact "Execute Unauthorized Commands"
  ]
  consequences [
    scope "_networkx_list_start"
    scope "Access Control"
    impact "Bypass Protection Mechanism"
  ]
  mitigations "Limit the usage of formatting string functions."
  mitigations "Strong input validation - All user-controllable input must be validated and filtered for illegal formatting characters."
  example_instances "_networkx_list_start"
  example_instances "Untrusted search path vulnerability in the add_filename_to_string function in intl/gettext/loadmsgcat.c for Elinks 0.11.1 allows local users to cause Elinks to use an untrusted gettext message catalog (.po file) in a &#34;../po&#34; directory, which can be leveraged to conduct format string attacks. See also: CVE-2007-2027"
  related_weaknesses "134"
  related_weaknesses "20"
  related_weaknesses "74"
  matched_cwes "134"
  matched_cwes "20"
  matched_cwes "74"
  taxonomy_mappings "_networkx_list_start"
  taxonomy_mappings [
    taxonomy_name "OWASP Attacks"
    entry_id ""
    entry_name "Format string attack"
  ]
  execution_flow [
    step "1"
    phase "Explore"
    description "[Survey application] The adversary takes an inventory of the entry points of the application."
    techniques "Spider web sites for all available links"
    techniques "List parameters, external variables, configuration files variables, etc. that are possibly used by the application."
  ]
  execution_flow [
    step "2"
    phase "Experiment"
    description "[Determine user-controllable input susceptible to format string injection] Determine the user-controllable input susceptible to format string injection. For each user-controllable input that the adversary suspects is vulnerable to format string injection, attempt to inject formatting characters such as %n, %s, etc.. The goal is to manipulate the string creation using these formatting characters."
    techniques "_networkx_list_start"
    techniques "Inject probe payload which contains formatting characters (%s, %d, %n, etc.) through input parameters."
  ]
  execution_flow [
    step "3"
    phase "Exploit"
    description "[Try to exploit the Format String Injection vulnerability] After determining that a given input is vulnerable to format string injection, hypothesize what the underlying usage looks like and the associated constraints."
    techniques "_networkx_list_start"
    techniques "Insert various formatting characters to read or write the memory, e.g. overwrite return address, etc."
  ]
  node [
    id 0
    label "take_an_inventory_of_the_entry_points_of_the_application"
  ]
  node [
    id 1
    label "use_that"
  ]
  node [
    id 2
    label "determine_user_controllable_input_susceptible_to_injection"
  ]
  node [
    id 3
    label "inject_formatting_characters_such_as_n_s_etc"
  ]
  node [
    id 4
    label "manipulate_the_string_creation"
  ]
  node [
    id 5
    label "inject_probe_payload_which_contains_formatting_characters"
  ]
  node [
    id 6
    label "try_to_exploit_the_format_string_injection_vulnerability"
  ]
  node [
    id 7
    label "add_filename_to_stre"
  ]
  node [
    id 8
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
    source 6
    target 7
  ]
  edge [
    source 7
    target 8
  ]
]
