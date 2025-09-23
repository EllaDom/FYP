graph [
  directed 1
  capec_id "267"
  name "Leverage Alternate Encoding"
  abstraction "Standard"
  status "Draft"
  description "An adversary leverages the possibility to encode potentially harmful input or content used by applications such that the applications are ineffective at validating this encoding standard."
  likelihood "High"
  severity "High"
  related_attack_patterns "_networkx_list_start"
  related_attack_patterns [
    capec_id "153"
    nature "ChildOf"
  ]
  prerequisites "_networkx_list_start"
  prerequisites "The application's decoder accepts and interprets encoded characters. Data canonicalization, input filtering and validating is not done properly leaving the door open to harmful characters for the target host."
  skills_required [
    level "Low"
    description "An adversary can inject different representation of a filtered character in a different encoding."
  ]
  skills_required [
    level "Medium"
    description "An adversary may craft subtle encoding of input data by using the knowledge that they have gathered about the target host."
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
  consequences [
    scope "_networkx_list_start"
    scope "Availability"
    impact "Unreliable Execution"
  ]
  mitigations "Assume all input might use an improper representation. Use canonicalized data inside the application; all data must be converted into the representation used inside the application (UTF-8, UTF-16, etc.)"
  mitigations "Assume all input is malicious. Create an allowlist that defines all valid input to the software system based on the requirements specifications. Input that does not match against the allowlist should not be permitted to enter into the system. Test your decoding process against malicious input."
  example_instances "Microsoft Internet Explorer 5.01 SP4, 6, 6 SP1, and 7 does not properly handle unspecified &#34;encoding strings,&#34; which allows remote adversaries to bypass the Same Origin Policy and obtain sensitive information via a crafted web site, aka &#34;Post Encoding Information Disclosure Vulnerability.&#34; Related Vulnerabilities CVE-2010-0488"
  example_instances "Adversaries may attempt to make an executable or file difficult to discover or analyze by encrypting, encoding, or otherwise obfuscating its contents on the system or in transit. This is common behavior that can be used across different platforms and the network to evade defenses."
  related_weaknesses "173"
  related_weaknesses "172"
  related_weaknesses "180"
  related_weaknesses "181"
  related_weaknesses "73"
  related_weaknesses "74"
  related_weaknesses "20"
  related_weaknesses "697"
  related_weaknesses "692"
  matched_cwes "73"
  matched_cwes "20"
  matched_cwes "74"
  taxonomy_mappings "_networkx_list_start"
  taxonomy_mappings [
    taxonomy_name "ATTACK"
    entry_id "1027"
    entry_name "Obfuscated Files or Information"
  ]
  execution_flow [
    step "1"
    phase "Explore"
    description "[Survey the application for user-controllable inputs] Using a browser, an automated tool or by inspecting the application, an adversary records all entry points to the application."
    techniques "Use a spidering tool to follow and record all links and analyze the web pages to find entry points. Make special note of any links that include parameters in the URL."
    techniques "Use a proxy tool to record all user input entry points visited during a manual traversal of the web application."
    techniques "Use a browser to manually explore the website and analyze how it is constructed. Many browsers' plugins are available to facilitate the analysis or automate the discovery."
    techniques "Manually inspect the application to find entry points."
  ]
  execution_flow [
    step "2"
    phase "Experiment"
    description "[Probe entry points to locate vulnerabilities] The adversary uses the entry points gathered in the &#34;Explore&#34; phase as a target list and injects various payloads using a variety of different types of encodings to determine if an entry point actually represents a vulnerability with insufficient validation logic and to characterize the extent to which the vulnerability can be exploited."
    techniques "_networkx_list_start"
    techniques "Try to use different encodings of content in order to bypass validation routines."
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
    label "try_to_use_different_encodings_of_content_in_order_to_bypass_validation_routines"
  ]
  node [
    id 8
    label "handle_unspecified_encoding_strings_which_allows_remote_adversaries_to_bypass_the_same_origin_policy_and_obtain_sensitive_information_via_a_crafted_web_site_aka_post_encoding_information_disclosure_vulnerability"
  ]
  node [
    id 9
    label "attempt_to_make_an_executable_or_file_difficult_to_discover_or_analyze_by_encrypting_encoding_or_otherwise_obfuscating_its_contents_on_the_system_or_in_transit"
  ]
  node [
    id 10
    label "evade_defenses"
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
