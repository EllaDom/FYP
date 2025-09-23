graph [
  directed 1
  capec_id "13"
  name "Subverting Environment Variable Values"
  abstraction "Detailed"
  status "Stable"
  description "The adversary directly or indirectly modifies environment variables used by or controlling the target software. The adversary's goal is to cause the target software to deviate from its expected operation in a manner that benefits the adversary."
  likelihood "High"
  severity "Very High"
  related_attack_patterns [
    capec_id "77"
    nature "ChildOf"
  ]
  related_attack_patterns [
    capec_id "14"
    nature "CanPrecede"
  ]
  related_attack_patterns [
    capec_id "10"
    nature "PeerOf"
  ]
  prerequisites "An environment variable is accessible to the user."
  prerequisites "An environment variable used by the application can be tainted with user supplied data."
  prerequisites "Input data used in an environment variable is not validated properly."
  prerequisites "The variables encapsulation is not done properly. For instance setting a variable as public in a class makes it visible and an adversary may attempt to manipulate that variable."
  skills_required [
    level "Low"
    description "In a web based scenario, the client controls the data that it submitted to the server. So anybody can try to send malicious data and try to bypass the authentication mechanism."
  ]
  skills_required [
    level "High"
    description "Some more advanced attacks may require knowledge about protocols and probing technique which help controlling a variable. The malicious user may try to understand the authentication mechanism in order to defeat it."
  ]
  resources_required "[]"
  consequences [
    scope "Confidentiality"
    scope "Integrity"
    scope "Availability"
    impact "Execute Unauthorized Commands"
  ]
  consequences [
    scope "Confidentiality"
    scope "Access Control"
    scope "Authorization"
    impact "Bypass Protection Mechanism"
  ]
  consequences [
    scope "_networkx_list_start"
    scope "Availability"
    impact "Unreliable Execution"
  ]
  consequences [
    scope "_networkx_list_start"
    scope "Confidentiality"
    impact "Read Data"
  ]
  consequences [
    scope "_networkx_list_start"
    scope "Accountability"
    impact "Hide Activities"
  ]
  mitigations "Protect environment variables against unauthorized read and write access."
  mitigations "Protect the configuration files which contain environment variables against illegitimate read and write access."
  mitigations "Assume all input is malicious. Create an allowlist that defines all valid input to the software system based on the requirements specifications. Input that does not match against the allowlist should not be permitted to enter into the system."
  mitigations "Apply the least privilege principles. If a process has no legitimate reason to read an environment variable do not give that privilege."
  example_instances "Changing the LD_LIBRARY_PATH environment variable in TELNET will cause TELNET to use an alternate (possibly Trojan) version of a function library. The Trojan library must be accessible using the target file system and should include Trojan code that will allow the user to log in with a bad password. This requires that the adversary upload the Trojan library to a specific location on the target. As an alternative to uploading a Trojan file, some file systems support file paths that include remote addresses, such as \\172.16.2.100\shared_files\trojan_dll.dll. See also: Path Manipulation (CVE-1999-0073)"
  example_instances "The HISTCONTROL environment variable keeps track of what should be saved by the history command and eventually into the ~/.bash_history file when a user logs out. This setting can be configured to ignore commands that start with a space by simply setting it to &#34;ignorespace&#34;. HISTCONTROL can also be set to ignore duplicate commands by setting it to &#34;ignoredups&#34;. In some Linux systems, this is set by default to &#34;ignoreboth&#34; which covers both of the previous examples. This means that &#34; ls&#34; will not be saved, but &#34;ls&#34; would be saved by history. HISTCONTROL does not exist by default on macOS, but can be set by the user and will be respected. Adversaries can use this to operate without leaving traces by simply prepending a space to all of their terminal commands."
  related_weaknesses "353"
  related_weaknesses "285"
  related_weaknesses "302"
  related_weaknesses "74"
  related_weaknesses "15"
  related_weaknesses "73"
  related_weaknesses "20"
  related_weaknesses "200"
  matched_cwes "20"
  matched_cwes "74"
  matched_cwes "285"
  matched_cwes "200"
  matched_cwes "73"
  taxonomy_mappings [
    taxonomy_name "ATTACK"
    entry_id "1562.003"
    entry_name "Impair Defenses:Impair Command History Logging"
  ]
  taxonomy_mappings [
    taxonomy_name "ATTACK"
    entry_id "1574.006"
    entry_name "Hijack Execution Flow:Dynamic Linker Hijacking"
  ]
  taxonomy_mappings [
    taxonomy_name "ATTACK"
    entry_id "1574.007"
    entry_name "Hijack Execution Flow:Path Interception by PATH Environment Variable"
  ]
  execution_flow [
    step "1"
    phase "Explore"
    description "[Probe target application] The adversary first probes the target application to determine important information about the target. This information could include types software used, software versions, what user input the application consumes, and so on. Most importantly, the adversary tries to determine what environment variables might be used by the underlying software, or even the application itself."
    techniques "[]"
  ]
  execution_flow [
    step "2"
    phase "Experiment"
    description "[Find user-controlled environment variables] Using the information found by probing the application, the adversary attempts to manipulate any user-controlled environment variables they have found are being used by the application, or suspect are being used by the application, and observe the effects of these changes. If the adversary notices any significant changes to the application, they will know that a certain environment variable is important to the application behavior and indicates a possible attack vector."
    techniques "_networkx_list_start"
    techniques "Alter known environment variables such as &#34;$PATH&#34;, &#34;$HOSTNAME&#34;, or &#34;LD_LIBRARY_PATH&#34; and see if application behavior changes."
  ]
  execution_flow [
    step "3"
    phase "Exploit"
    description "[Manipulate user-controlled environment variables] The adversary manipulates the found environment variable(s) to abuse the normal flow of processes or to gain access to privileged resources."
    techniques "[]"
  ]
  node [
    id 0
    label "probe_the_target_application"
  ]
  node [
    id 1
    label "include_types_software_used_software_versions_what_user_input_the_application_consumes_and_so_on"
  ]
  node [
    id 2
    label "try_to_determine_what_environment_variables_might_be_used_by_the_underlying_software_or_even_the_application_itself"
  ]
  node [
    id 3
    label "find_user_controlled_environment_variables"
  ]
  node [
    id 4
    label "notice_any_significant_changes_to_the_application"
  ]
  node [
    id 5
    label "manipulate_the_found_environment_variable_s"
  ]
  node [
    id 6
    label "change_the_ld_library_path_environment"
  ]
  node [
    id 7
    label "include_trojan_code_that_will_allow_the_user_to_log_in_with_a_bad_password"
  ]
  node [
    id 8
    label "upload_a_trojan_file"
  ]
  node [
    id 9
    label "keep_track_of_what_should_be_saved_by_the_history_command_and_eventually_into_the_bash_history_file_when_a_user_logs_out"
  ]
  node [
    id 10
    label "configure_this_setting"
  ]
  node [
    id 11
    label "set_histcontrol"
  ]
  node [
    id 12
    label "taint_an_environment_variable_used_by_the_application"
  ]
  node [
    id 13
    label "validate_input_data_used_in_an_environment_variable"
  ]
  node [
    id 14
    label "do_the_variables_encapsulation"
  ]
  node [
    id 15
    label "set_a_variable_as_public"
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
    source 10
    target 12
  ]
  edge [
    source 11
    target 10
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
]
