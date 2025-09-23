graph [
  directed 1
  capec_id "53"
  name "Postfix, Null Terminate, and Backslash"
  abstraction "Detailed"
  status "Draft"
  description "If a string is passed through a filter of some kind, then a terminal NULL may not be valid. Using alternate representation of NULL allows an adversary to embed the NULL mid-string while postfixing the proper data so that the filter is avoided. One example is a filter that looks for a trailing slash character. If a string insertion is possible, but the slash must exist, an alternate encoding of NULL in mid-string may be used."
  likelihood "High"
  severity "High"
  related_attack_patterns "_networkx_list_start"
  related_attack_patterns [
    capec_id "267"
    nature "ChildOf"
  ]
  prerequisites "_networkx_list_start"
  prerequisites "Null terminators are not properly handled by the filter."
  skills_required "_networkx_list_start"
  skills_required [
    level "Medium"
    description "An adversary needs to understand alternate encodings, what the filter looks for and the data format acceptable to the target API"
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
  mitigations "Properly handle Null characters. Make sure canonicalization is properly applied. Do not pass Null characters to the underlying APIs."
  mitigations "Assume all input is malicious. Create an allowlist that defines all valid input to the software system based on the requirements specifications. Input that does not match against the allowlist should not be permitted to enter into the system."
  example_instances "_networkx_list_start"
  example_instances "A rather simple injection is possible in a URL: http://getAccessHostname/sekbin/  helpwin.gas.bat?mode=&#38;draw=x&#38;file=x&#38;module=&#38;locale=[insert relative path here]  [%00][%5C]&#38;chapter= This attack has appeared with regularity in the wild. There are many variations of this kind of attack. Spending a short amount of time injecting against Web applications will usually result in a new exploit being discovered."
  related_weaknesses "158"
  related_weaknesses "172"
  related_weaknesses "173"
  related_weaknesses "74"
  related_weaknesses "20"
  related_weaknesses "697"
  related_weaknesses "707"
  matched_cwes "20"
  matched_cwes "74"
  matched_cwes "707"
  taxonomy_mappings "[]"
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
    description "[Probe entry points to locate vulnerabilities] The adversary uses the entry points gathered in the &#34;Explore&#34; phase as a target list and injects postfix null byte(s) followed by a backslash to observe how the application handles them as input. The adversary is looking for areas where user input is placed in the middle of a string, and the null byte causes the application to stop processing the string at the end of the user input."
    techniques "_networkx_list_start"
    techniques "Try different encodings for null such as \0 or %00 followed by an encoding for the backslash character."
  ]
  execution_flow [
    step "3"
    phase "Exploit"
    description "[Remove data after null byte(s)] After determined entry points that are vulnerable, the adversary places a null byte(s) followed by a backslash such that they bypass an input filter and remove data after the null byte(s) in a way that is beneficial to them."
    techniques "_networkx_list_start"
    techniques "If the input is a directory as part of a longer file path, add a null byte(s) followed by a backslash at the end of the input to try to traverse to the given directory."
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
    label "try_different_encodings_for_null_such_as_0_or"
  ]
  node [
    id 8
    label "remove_data"
  ]
  node [
    id 9
    label "append_a_null_byte"
  ]
  node [
    id 10
    label "be_many_variations_of_this_kind_of_attack"
  ]
  node [
    id 11
    label "spend_a_short_amount_of_time_injecting_against_web_applications"
  ]
  node [
    id 12
    label "handle_null_terminators"
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
]
