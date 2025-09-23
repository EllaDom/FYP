graph [
  directed 1
  capec_id "139"
  name "Relative Path Traversal"
  abstraction "Detailed"
  status "Draft"
  description "An attacker exploits a weakness in input validation on the target by supplying a specially constructed path utilizing dot and slash characters for the purpose of obtaining access to arbitrary files or resources. An attacker modifies a known path on the target in order to reach material that is not available through intended channels. These attacks normally involve adding additional path separators (/ or \) and/or dots (.), or encodings thereof, in various combinations in order to reach parent directories or entirely separate trees of the target's directory structure."
  likelihood "High"
  severity "High"
  related_attack_patterns "_networkx_list_start"
  related_attack_patterns [
    capec_id "126"
    nature "ChildOf"
  ]
  prerequisites "_networkx_list_start"
  prerequisites "The target application must accept a string as user input, fail to sanitize combinations of characters in the input that have a special meaning in the context of path navigation, and insert the user-supplied string into path navigation commands."
  skills_required [
    level "Low"
    description "To inject the malicious payload in a web page"
  ]
  skills_required [
    level "High"
    description "To bypass non trivial filters in the application"
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
    scope "Integrity"
    scope "Availability"
    impact "Execute Unauthorized Commands"
  ]
  consequences [
    scope "_networkx_list_start"
    scope "Access Control"
    impact "Bypass Protection Mechanism"
  ]
  consequences [
    scope "_networkx_list_start"
    scope "Availability"
    impact "Unreliable Execution"
  ]
  mitigations "Design: Input validation. Assume that user inputs are malicious. Utilize strict type, character, and encoding enforcement"
  mitigations "Implementation: Perform input validation for all remote content, including remote and user-generated content."
  mitigations "Implementation: Validate user input by only accepting known good. Ensure all content that is delivered to client is sanitized against an acceptable content specification -- using an allowlist approach."
  mitigations "Implementation: Prefer working without user input when using file system calls"
  mitigations "Implementation: Use indirect references rather than actual file names."
  mitigations "Implementation: Use possible permissions on file access when developing and deploying web applications."
  example_instances "_networkx_list_start"
  example_instances "The attacker uses relative path traversal to access files in the application. This is an example of accessing user's password file. http://www.example.com/getProfile.jsp?filename=../../../../etc/passwd However, the target application employs regular expressions to make sure no relative path sequences are being passed through the application to the web page. The application would replace all matches from this regex with the empty string. Then an attacker creates special payloads to bypass this filter: http://www.example.com/getProfile.jsp?filename=%2e%2e/%2e%2e/%2e%2e/%2e%2e /etc/passwd When the application gets this input string, it will be the desired vector by the attacker."
  related_weaknesses "_networkx_list_start"
  related_weaknesses "23"
  matched_cwes "_networkx_list_start"
  matched_cwes "23"
  taxonomy_mappings "[]"
  execution_flow [
    step "1"
    phase "Explore"
    description "[Fingerprinting of the operating system] In order to perform a valid path traversal, the adversary needs to know what the underlying OS is so that the proper file seperator is used."
    techniques "Port mapping. Identify ports that the system is listening on, and attempt to identify inputs and protocol types on those ports."
    techniques "TCP/IP Fingerprinting. The adversary uses various software to make connections or partial connections and observe idiosyncratic responses from the operating system. Using those responses, they attempt to guess the actual operating system."
    techniques "Induce errors to find informative error messages"
  ]
  execution_flow [
    step "2"
    phase "Explore"
    description "[Survey application] Using manual or automated means, an adversary will survey the target application looking for all areas where user input is taken to specify a file name or path."
    techniques "Use a spidering tool to follow and record all links on a web page. Make special note of any links that include parameters in the URL."
    techniques "Use a proxy tool to record all links visited during a manual traversal of a web application. Make special note of any links that include parameters in the URL. Manual traversal of this type is frequently necessary to identify forms that are GET method forms rather than POST forms."
    techniques "Use a browser to manually explore a website and analyze how it is constructed. Many browser plug-ins are available to facilitate the analysis or automate the URL discovery."
  ]
  execution_flow [
    step "3"
    phase "Experiment"
    description "[Attempt variations on input parameters] Using manual or automated means, an adversary attempts varying relative file path combinations on all found user input locations and observes the responses."
    techniques "Provide &#34;../&#34; or &#34;..\&#34; at the beginning of any filename to traverse to the parent directory"
    techniques "Use a list of probe strings as path traversal payload. Different strings may be used for different platforms. Strings contain relative path sequences such as &#34;../&#34;."
    techniques "Use a proxy tool to record results of manual input of relative path traversal probes in known URLs."
  ]
  execution_flow [
    step "4"
    phase "Exploit"
    description "[Access, modify, or execute arbitrary files.] An adversary injects path traversal syntax into identified vulnerable inputs to cause inappropriate reading, writing or execution of files. An adversary could be able to read directories or files which they are normally not allowed to read. The adversary could also access data outside the web document root, or include scripts, source code and other kinds of files from external websites. Once the adversary accesses arbitrary files, they could also modify files. In particular situations, the adversary could also execute arbitrary code or system commands."
    techniques "Manipulate file and its path by injecting relative path sequences (e.g. &#34;../&#34;)."
    techniques "Download files, modify files, or try to execute shell commands (with binary files)."
  ]
  node [
    id 0
    label "identify_ports_that_the_system_is_listening_on"
  ]
  node [
    id 1
    label "make_connections_or_partial_connections"
  ]
  node [
    id 2
    label "attempt_using_those_responses"
  ]
  node [
    id 3
    label "induce_errors"
  ]
  node [
    id 4
    label "survey_the_target_application"
  ]
  node [
    id 5
    label "make_special_note_of_any_links_that_include_parameters_in_the_url"
  ]
  node [
    id 6
    label "record_all_links_visited_during_a_manual_traversal_of_the_web_application"
  ]
  node [
    id 7
    label "identify_forms_that_are_get_method_forms_rather_than_post_forms"
  ]
  node [
    id 8
    label "explore_the_website"
  ]
  node [
    id 9
    label "facilitate_the_analysis"
  ]
  node [
    id 10
    label "use_a_list_of_probe_strings_as_path_traversal_payload"
  ]
  node [
    id 11
    label "use_different_strings"
  ]
  node [
    id 12
    label "contain_relative_path_sequences_such_as"
  ]
  node [
    id 13
    label "record_results_of_manual_input_of_xss_probes_in_known_urls"
  ]
  node [
    id 14
    label "inject_path_traversal_syntax_into_identified_vulnerable_inputs"
  ]
  node [
    id 15
    label "read_directories_or_files_they_are_normally_not_allowed_which_to_read"
  ]
  node [
    id 16
    label "access_data"
  ]
  node [
    id 17
    label "access_arbitrary_files"
  ]
  node [
    id 18
    label "execute_arbitrary_code"
  ]
  node [
    id 19
    label "inject_relative_path_sequences"
  ]
  node [
    id 20
    label "modify_files"
  ]
  node [
    id 21
    label "use_relative_path_traversal"
  ]
  node [
    id 22
    label "employ_regular_expressions_to_make_sure_no_relative_path_sequences_are_being_passed_through_the_application_to_the_web_page"
  ]
  node [
    id 23
    label "replace_all_matches"
  ]
  node [
    id 24
    label "create_special_payloads_to_bypass_this_filter_http_www_example_com_getprofile_jsp_filename_2e_2e_2e_2e_2e_2e_2e_2e_etc"
  ]
  node [
    id 25
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
    target 18
  ]
  edge [
    source 18
    target 19
  ]
  edge [
    source 19
    target 20
  ]
  edge [
    source 20
    target 21
  ]
  edge [
    source 21
    target 22
  ]
  edge [
    source 22
    target 23
  ]
  edge [
    source 23
    target 24
  ]
  edge [
    source 24
    target 25
  ]
]
