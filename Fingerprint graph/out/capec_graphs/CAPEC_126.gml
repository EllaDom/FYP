graph [
  directed 1
  capec_id "126"
  name "Path Traversal"
  abstraction "Standard"
  status "Draft"
  description "An adversary uses path manipulation methods to exploit insufficient input validation of a target to obtain access to data that should be not be retrievable by ordinary well-formed requests. A typical variety of this attack involves specifying a path to a desired file together with dot-dot-slash characters, resulting in the file access API or function traversing out of the intended directory structure and into the root file system. By replacing or modifying the expected path information the access function or API retrieves the file desired by the attacker. These attacks either involve the attacker providing a complete path to a targeted file or using control characters (e.g. path separators (/ or \) and/or dots (.)) to reach desired directories or files."
  likelihood "High"
  severity "Very High"
  related_attack_patterns [
    capec_id "153"
    nature "ChildOf"
  ]
  related_attack_patterns [
    capec_id "664"
    nature "CanPrecede"
  ]
  prerequisites "The attacker must be able to control the path that is requested of the target."
  prerequisites "The target must fail to adequately sanitize incoming paths"
  skills_required [
    level "Low"
    description "Simple command line attacks or to inject the malicious payload in a web page."
  ]
  skills_required [
    level "Medium"
    description "Customizing attacks to bypass non trivial filters in the application."
  ]
  resources_required "_networkx_list_start"
  resources_required "The ability to manually manipulate path information either directly through a client application relative to the service or application or via a proxy application."
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
  mitigations "Implementation: Validate user input by only accepting known good. Ensure all content that is delivered to client is sanitized against an acceptable content specification -- using an allowlist approach."
  example_instances "_networkx_list_start"
  example_instances "An example of using path traversal to attack some set of resources on a web server is to use a standard HTTP request http://example/../../../../../etc/passwd From an attacker point of view, this may be sufficient to gain access to the password file on a poorly protected system. If the attacker can list directories of critical resources then read only access is not sufficient to protect the system."
  related_weaknesses "_networkx_list_start"
  related_weaknesses "22"
  matched_cwes "_networkx_list_start"
  matched_cwes "22"
  taxonomy_mappings [
    taxonomy_name "WASC"
    entry_id "33"
    entry_name "Path Traversal"
  ]
  taxonomy_mappings [
    taxonomy_name "OWASP Attacks"
    entry_id ""
    entry_name "Path Traversal"
  ]
  execution_flow [
    step "1"
    phase "Explore"
    description "[Fingerprinting of the operating system] In order to perform a valid path traversal, the attacker needs to know what the underlying OS is so that the proper file seperator is used."
    techniques "Port mapping. Identify ports that the system is listening on, and attempt to identify inputs and protocol types on those ports."
    techniques "TCP/IP Fingerprinting. The attacker uses various software to make connections or partial connections and observe idiosyncratic responses from the operating system. Using those responses, they attempt to guess the actual operating system."
    techniques "Induce errors to find informative error messages"
  ]
  execution_flow [
    step "2"
    phase "Explore"
    description "[Survey the Application to Identify User-controllable Inputs] The attacker surveys the target application to identify all user-controllable file inputs"
    techniques "[]"
  ]
  execution_flow [
    step "3"
    phase "Experiment"
    description "[Vary inputs, looking for malicious results] Depending on whether the application being exploited is a remote or local one, the attacker crafts the appropriate malicious input containing the path of the targeted file or other file system control syntax to be passed to the application"
    techniques "[]"
  ]
  execution_flow [
    step "4"
    phase "Exploit"
    description "[Manipulate files accessible by the application] The attacker may steal information or directly manipulate files (delete, copy, flush, etc.)"
    techniques "[]"
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
    label "input_vary"
  ]
  node [
    id 6
    label "steal_information_or_directly_manipulate_files_delete_copy_flush_etc"
  ]
  node [
    id 7
    label "attack_some_set_of_resources"
  ]
  node [
    id 8
    label "list_directories_of_critical_resources"
  ]
  node [
    id 9
    label "control_the_path_that_is_requested_of_the_target"
  ]
  node [
    id 10
    label "fail_to_adequately_sanitize_incoming_paths"
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
