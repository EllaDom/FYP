graph [
  directed 1
  capec_id "3"
  name "Using Leading 'Ghost' Character Sequences to Bypass Input Filters"
  abstraction "Detailed"
  status "Draft"
  description "Some APIs will strip certain leading characters from a string of parameters. An adversary can intentionally introduce leading &#34;ghost&#34; characters (extra characters that don't affect the validity of the request at the API layer) that enable the input to pass the filters and therefore process the adversary's input. This occurs when the targeted API will accept input data in several syntactic forms and interpret it in the equivalent semantic way, while the filter does not take into account the full spectrum of the syntactic forms acceptable to the targeted API."
  likelihood "Medium"
  severity "Medium"
  related_attack_patterns "_networkx_list_start"
  related_attack_patterns [
    capec_id "267"
    nature "ChildOf"
  ]
  prerequisites "_networkx_list_start"
  prerequisites "The targeted API must ignore the leading ghost characters that are used to get past the filters for the semantics to be the same."
  skills_required "_networkx_list_start"
  skills_required [
    level "Medium"
    description "The ability to make an API request, and knowledge of &#34;ghost&#34; characters that will not be filtered by any input validation. These &#34;ghost&#34; characters must be known to not affect the way in which the request will be interpreted."
  ]
  resources_required "[]"
  consequences [
    scope "Confidentiality"
    scope "Access Control"
    scope "Authorization"
    impact "Gain Privileges"
  ]
  consequences [
    scope "_networkx_list_start"
    scope "Integrity"
    impact "Modify Data"
  ]
  mitigations "Use an allowlist rather than a denylist input validation."
  mitigations "Canonicalize all data prior to validation."
  mitigations "Take an iterative approach to input validation (defense in depth)."
  example_instances "_networkx_list_start"
  example_instances "Alternate Encoding with Ghost Characters in FTP and Web Servers Some web and FTP servers fail to detect prohibited upward directory traversals if the user-supplied pathname contains extra characters such as an extra leading dot. For example, a program that will disallow access to the pathname &#34;../test.txt&#34; may erroneously allow access to that file if the pathname is specified as &#34;.../test.txt&#34;. This attack succeeds because 1) the input validation logic fails to detect the triple-dot as a directory traversal attempt (since it isn't dot-dot), 2) some part of the input processing decided to strip off the &#34;extra&#34; dot, leaving the dot-dot behind. Using the file system API as the target, the following strings are all equivalent to many programs: .../../../test.txt  ............/../../test.txt  ..?/../../test.txt  ..????????/../../test.txt  ../test.txt As you can see, there are many ways to make a semantically equivalent request. All these strings ultimately result in a request for the file ../test.txt."
  related_weaknesses "173"
  related_weaknesses "41"
  related_weaknesses "172"
  related_weaknesses "179"
  related_weaknesses "180"
  related_weaknesses "181"
  related_weaknesses "183"
  related_weaknesses "184"
  related_weaknesses "20"
  related_weaknesses "74"
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
    description "[Probe entry points to locate vulnerabilities] The adversary uses the entry points gathered in the &#34;Explore&#34; phase as a target list and injects various leading 'Ghost' character sequences to determine how to application filters them."
    techniques "Add additional characters to common sequences such as &#34;../&#34; to see how the application will filter them."
    techniques "Try repeating special characters (?, @, #, *, etc.) at the beginning of user input to see how the application filters these out."
  ]
  execution_flow [
    step "3"
    phase "Exploit"
    description "[Bypass input filtering] Using what the adversary learned about how the application filters input data, they craft specific input data that bypasses the filter. This can lead to directory traversal attacks, arbitrary shell command execution, corruption of files, etc."
    techniques "[]"
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
    label "add_additional_characters"
  ]
  node [
    id 8
    label "filter_bypass_input"
  ]
  node [
    id 9
    label "fail_to_detect_prohibited_upward_directory_traversals_if_the_user_supplied_pathname_contains_extra_characters_such_as_an_extra_leading_dot"
  ]
  node [
    id 10
    label "disallow_access_to_the_pathname"
  ]
  node [
    id 11
    label "succeed_because_1_the_input_validation_logic_fails_to_detect_the_triple_dot_as_a_directory_traversal_attempt_since_it_is_n_t_dot_dot_2_some_part_of_the_input_processing_decided_to_strip_off_the_extra_dot_leaving_the_dot_dot_behind"
  ]
  node [
    id 12
    label "test_txt"
  ]
  node [
    id 13
    label "ignore_the_leading_ghost_characters_that_are_used_to_get_past_the_filters_for_the_semantics_to_be_the_same"
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
    target 12
  ]
  edge [
    source 12
    target 13
  ]
]
