graph [
  directed 1
  capec_id "120"
  name "Double Encoding"
  abstraction "Detailed"
  status "Draft"
  description "The adversary utilizes a repeating of the encoding process for a set of characters (that is, character encoding a character encoding of a character) to obfuscate the payload of a particular request. This may allow the adversary to bypass filters that attempt to detect illegal characters or strings, such as those that might be used in traversal or injection attacks. Filters may be able to catch illegal encoded strings, but may not catch doubly encoded strings. For example, a dot (.), often used in path traversal attacks and therefore often blocked by filters, could be URL encoded as %2E. However, many filters recognize this encoding and would still block the request. In a double encoding, the % in the above URL encoding would be encoded again as %25, resulting in %252E which some filters might not catch, but which could still be interpreted as a dot (.) by interpreters on the target."
  likelihood "Low"
  severity "Medium"
  related_attack_patterns "_networkx_list_start"
  related_attack_patterns [
    capec_id "267"
    nature "ChildOf"
  ]
  prerequisites "The target's filters must fail to detect that a character has been doubly encoded but its interpreting engine must still be able to convert a doubly encoded character to an un-encoded character."
  prerequisites "The application accepts and decodes URL string request."
  prerequisites "The application performs insufficient filtering/canonicalization on the URLs."
  skills_required "[]"
  resources_required "_networkx_list_start"
  resources_required "Tools that automate encoding of data can assist the adversary in generating encoded strings."
  consequences "[]"
  mitigations "Assume all input is malicious. Create an allowlist that defines all valid input to the software system based on the requirements specifications. Input that does not match against the allowlist should not be permitted to enter into the system. Test your decoding process against malicious input."
  mitigations "Be aware of the threat of alternative method of data encoding and obfuscation technique such as IP address encoding."
  mitigations "When client input is required from web-based forms, avoid using the &#34;GET&#34; method to submit data, as the method causes the form data to be appended to the URL and is easily manipulated. Instead, use the &#34;POST method whenever possible."
  mitigations "Any security checks should occur after the data has been decoded and validated as correct data format. Do not repeat decoding process, if bad character are left after decoding process, treat the data as suspicious, and fail the validation process."
  mitigations "Refer to the RFCs to safely decode URL."
  mitigations "Regular expression can be used to match safe URL patterns. However, that may discard valid URL requests if the regular expression is too restrictive."
  mitigations "There are tools to scan HTTP requests to the server for valid URL such as URLScan from Microsoft (http://www.microsoft.com/technet/security/tools/urlscan.mspx)."
  example_instances "_networkx_list_start"
  example_instances "Double Enconding Attacks can often be used to bypass Cross Site Scripting (XSS) detection and execute XSS attacks.: %253Cscript%253Ealert('This is an XSS Attack')%253C%252Fscript%253E Since <, <, and / are often sued to perform web attacks, these may be captured by XSS filters. The use of double encouding prevents the filter from working as intended and allows the XSS to bypass dectection. This can allow an adversary to execute malicious code."
  related_weaknesses "173"
  related_weaknesses "172"
  related_weaknesses "177"
  related_weaknesses "181"
  related_weaknesses "183"
  related_weaknesses "184"
  related_weaknesses "74"
  related_weaknesses "20"
  related_weaknesses "697"
  related_weaknesses "692"
  matched_cwes "20"
  matched_cwes "74"
  taxonomy_mappings "[]"
  execution_flow [
    step "1"
    phase "Explore"
    description "[Survey the application for user-controllable inputs] Using a browser, an automated tool or by inspecting the application, an attacker records all entry points to the application."
    techniques "Use a spidering tool to follow and record all links and analyze the web pages to find entry points. Make special note of any links that include parameters in the URL."
    techniques "Use a proxy tool to record all user input entry points visited during a manual traversal of the web application."
    techniques "Use a browser to manually explore the website and analyze how it is constructed. Many browsers' plugins are available to facilitate the analysis or automate the discovery."
    techniques "Manually inspect the application to find entry points."
  ]
  execution_flow [
    step "2"
    phase "Experiment"
    description "[Probe entry points to locate vulnerabilities] Try double-encoding for parts of the input in order to try to get past the filters. For instance, by double encoding certain characters in the URL (e.g. dots and slashes) an adversary may try to get access to restricted resources on the web server or force browse to protected pages (thus subverting the authorization service). An adversary can also attempt other injection style attacks using this attack pattern: command injection, SQL injection, etc."
    techniques "_networkx_list_start"
    techniques "Try to use double-encoding to bypass validation routines."
  ]
  node [
    id 0
    label "survey_the_application_for_user_controllable_inputs"
  ]
  node [
    id 1
    label "make_special_note_of_any_links_that_include_parameters_in_the_url"
  ]
  node [
    id 2
    label "record_all_links_visited_during_a_manual_traversal_of_the_web_application"
  ]
  node [
    id 3
    label "explore_the_website"
  ]
  node [
    id 4
    label "facilitate_the_analysis"
  ]
  node [
    id 5
    label "inspect_the_application_to_find_entry_points"
  ]
  node [
    id 6
    label "locate_vulnerabilities"
  ]
  node [
    id 7
    label "encode_certain_characters"
  ]
  node [
    id 8
    label "attempt_other_injection_style_attacks_using_this_attack_pattern_command_injection_sql_injection_etc"
  ]
  node [
    id 9
    label "try_to_use_double_encoding_to_bypass_validation_routines"
  ]
  node [
    id 10
    label "bypass_cross_site_scripting_xss_detection"
  ]
  node [
    id 11
    label "sue_to_perform_web_attacks"
  ]
  node [
    id 12
    label "prevent_the_filter"
  ]
  node [
    id 13
    label "fail_to_detect_that_a_character_has_been_doubly_encoded_but_its_interpreting_engine_must_still_be_able_to_convert_a_doubly_encoded_character_to_an_un_encoded_character"
  ]
  node [
    id 14
    label "perform_insufficient_filtering_canonicalization_on_the_urls"
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
