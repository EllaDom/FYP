graph [
  directed 1
  capec_id "71"
  name "Using Unicode Encoding to Bypass Validation Logic"
  abstraction "Detailed"
  status "Draft"
  description "An attacker may provide a Unicode string to a system component that is not Unicode aware and use that to circumvent the filter or cause the classifying mechanism to fail to properly understanding the request. That may allow the attacker to slip malicious data past the content filter and/or possibly cause the application to route the request incorrectly."
  likelihood "Medium"
  severity "High"
  related_attack_patterns "_networkx_list_start"
  related_attack_patterns [
    capec_id "267"
    nature "ChildOf"
  ]
  prerequisites "_networkx_list_start"
  prerequisites "Filtering is performed on data that has not be properly canonicalized."
  skills_required "_networkx_list_start"
  skills_required [
    level "Medium"
    description "An attacker needs to understand Unicode encodings and have an idea (or be able to find out) what system components may not be Unicode aware."
  ]
  resources_required "[]"
  consequences [
    scope "Confidentiality"
    scope "Access Control"
    scope "Authorization"
    impact "Bypass Protection Mechanism"
  ]
  consequences [
    scope "Confidentiality"
    scope "Integrity"
    scope "Availability"
    impact "Execute Unauthorized Commands"
  ]
  consequences [
    scope "_networkx_list_start"
    scope "Integrity"
    impact "Modify Data"
  ]
  consequences [
    scope "_networkx_list_start"
    scope "Availability"
    impact "Unreliable Execution"
  ]
  mitigations "Ensure that the system is Unicode aware and can properly process Unicode data. Do not make an assumption that data will be in ASCII."
  mitigations "Ensure that filtering or input validation is applied to canonical data."
  mitigations "Assume all input is malicious. Create an allowlist that defines all valid input to the software system based on the requirements specifications. Input that does not match against the allowlist should not be permitted to enter into the system."
  example_instances "_networkx_list_start"
  example_instances "A very common technique for a Unicode attack involves traversing directories looking for interesting files. An example of this idea applied to the Web is http://target.server/some_directory/../../../winnt In this case, the attacker is attempting to traverse to a directory that is not supposed to be part of standard Web services. The trick is fairly obvious, so many Web servers and scripts prevent it. However, using alternate encoding tricks, an attacker may be able to get around badly implemented request filters. In October 2000, an adversary publicly revealed that Microsoft's IIS server suffered from a variation of this problem. In the case of IIS, all the attacker had to do was provide alternate encodings for the dots and/or slashes found in a classic attack. The Unicode translations are . yields C0 AE  / yields C0 AF  \ yields C1 9C Using this conversion, the previously displayed URL can be encoded as http://target.server/some_directory/%C0AE/%C0AE/%C0AE%C0AE/%C0AE%C0AE/winnt See also: CVE-2000-0884"
  related_weaknesses "176"
  related_weaknesses "179"
  related_weaknesses "180"
  related_weaknesses "173"
  related_weaknesses "172"
  related_weaknesses "184"
  related_weaknesses "183"
  related_weaknesses "74"
  related_weaknesses "20"
  related_weaknesses "697"
  related_weaknesses "692"
  matched_cwes "20"
  matched_cwes "74"
  taxonomy_mappings "_networkx_list_start"
  taxonomy_mappings [
    taxonomy_name "OWASP Attacks"
    entry_id ""
    entry_name "Unicode Encoding"
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
    description "[Probe entry points to locate vulnerabilities] The attacker uses the entry points gathered in the &#34;Explore&#34; phase as a target list and injects various Unicode encoded payloads to determine if an entry point actually represents a vulnerability with insufficient validation logic and to characterize the extent to which the vulnerability can be exploited."
    techniques "Try to use Unicode encoding of content in Scripts in order to bypass validation routines."
    techniques "Try to use Unicode encoding of content in HTML in order to bypass validation routines."
    techniques "Try to use Unicode encoding of content in CSS in order to bypass validation routines."
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
    label "locate_vulnerabilities"
  ]
  node [
    id 7
    label "try_to_use_different_encodings_of_content_in_order_to_bypass_validation_routines"
  ]
  node [
    id 8
    label "involve_traversing_directories_looking_for_interesting_files"
  ]
  node [
    id 9
    label "prevent_it"
  ]
  node [
    id 10
    label "get_badly_implemented_request_filters"
  ]
  node [
    id 11
    label "provide_alternate_encodings_for_the_dots_and_or_slashes_found_in_a_classic_attack"
  ]
  node [
    id 12
    label "yield_using_this_conversion"
  ]
  node [
    id 13
    label "perform_filtering"
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
]
