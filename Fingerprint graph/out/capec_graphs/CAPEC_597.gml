graph [
  directed 1
  capec_id "597"
  name "Absolute Path Traversal"
  abstraction "Detailed"
  status "Draft"
  description "An adversary with access to file system resources, either directly or via application logic, will use various file absolute paths and navigation mechanisms such as &#34;..&#34; to extend their range of access to inappropriate areas of the file system. The goal of the adversary is to access directories and files that are intended to be restricted from their access."
  likelihood ""
  severity ""
  related_attack_patterns "_networkx_list_start"
  related_attack_patterns [
    capec_id "126"
    nature "ChildOf"
  ]
  prerequisites "_networkx_list_start"
  prerequisites "The target must leverage and access an underlying file system."
  skills_required [
    level "Low"
    description "Simple command line attacks."
  ]
  skills_required [
    level "Medium"
    description "Programming attacks."
  ]
  resources_required "_networkx_list_start"
  resources_required "The attacker must have access to an application interface or a direct shell that allows them to inject directory strings and monitor the results."
  consequences [
    scope "Integrity"
    scope "Confidentiality"
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
    scope "Confidentiality"
    impact "Read Data"
  ]
  consequences [
    scope "_networkx_list_start"
    scope "Availability"
    impact "Unreliable Execution"
  ]
  mitigations "Design: Configure the access control correctly."
  mitigations "Design: Enforce principle of least privilege."
  mitigations "Design: Execute programs with constrained privileges, so parent process does not open up further vulnerabilities. Ensure that all directories, temporary directories and files, and memory are executing with limited privileges to protect against remote execution."
  mitigations "Design: Input validation. Assume that user inputs are malicious. Utilize strict type, character, and encoding enforcement."
  mitigations "Design: Proxy communication to host, so that communications are terminated at the proxy, sanitizing the requests before forwarding to server host."
  mitigations "Design: Run server interfaces with a non-root account and/or utilize chroot jails or other configuration techniques to constrain privileges even if attacker gains some limited access to commands."
  mitigations "Implementation: Host integrity monitoring for critical files, directories, and processes. The goal of host integrity monitoring is to be aware when a security issue has occurred so that incident response and other forensic activities can begin."
  mitigations "Implementation: Perform input validation for all remote content, including remote and user-generated content."
  mitigations "Implementation: Perform testing such as pen-testing and vulnerability scanning to identify directories, programs, and interfaces that grant direct access to executables."
  mitigations "Implementation: Use indirect references rather than actual file names."
  mitigations "Implementation: Use possible permissions on file access when developing and deploying web applications."
  mitigations "Implementation: Validate user input by only accepting known good. Ensure all content that is delivered to client is sanitized against an acceptable content specification using an allowlist approach."
  example_instances "[]"
  related_weaknesses "_networkx_list_start"
  related_weaknesses "36"
  matched_cwes "_networkx_list_start"
  matched_cwes "36"
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
    techniques "Use a browser to manually explore a website and analyze how it is constructed. Many browser's plug-in are available to facilitate the analysis or automate the URL discovery."
  ]
  execution_flow [
    step "3"
    phase "Experiment"
    description "[Attempt variations on input parameters] Using manual or automated means, an adversary attempts varying absolute file paths on all found user input locations and observes the responses."
    techniques "Access common files in root directories such as &#34;/bin&#34;, &#34;/boot&#34;, &#34;/lib&#34;, or &#34;/home&#34;"
    techniques "Access a specific drive letter or windows volume letter by specifying &#34;C:dirname&#34; for example"
    techniques "Access a known Windows UNC share by specifying &#34;\\UNC\share\name&#34; for example"
  ]
  execution_flow [
    step "4"
    phase "Exploit"
    description "[Access, modify, or execute arbitrary files.] An adversary injects absolute path traversal syntax into identified vulnerable inputs to cause inappropriate reading, writing or execution of files. An adversary could be able to read directories or files which they are normally not allowed to read. The adversary could also access data outside the web document root, or include scripts, source code and other kinds of files from external websites. Once the adversary accesses arbitrary files, they could also modify files. In particular situations, the adversary could also execute arbitrary code or system commands."
    techniques "Manipulate file and its path by injecting absolute path sequences (e.g. &#34;/home/file.txt&#34;)."
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
    label "access_a_specific_drive_letter_or_windows_volume_letter"
  ]
  node [
    id 11
    label "access_a_known_windows_unc"
  ]
  node [
    id 12
    label "inject_path_traversal_syntax_into_identified_vulnerable_inputs"
  ]
  node [
    id 13
    label "read_directories_or_files_they_are_normally_not_allowed_which_to_read"
  ]
  node [
    id 14
    label "access_data"
  ]
  node [
    id 15
    label "access_arbitrary_files"
  ]
  node [
    id 16
    label "execute_arbitrary_code"
  ]
  node [
    id 17
    label "inject_relative_path_sequences"
  ]
  node [
    id 18
    label "modify_files"
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
]
