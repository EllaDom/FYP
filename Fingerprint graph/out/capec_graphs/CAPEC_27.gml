graph [
  directed 1
  capec_id "27"
  name "Leveraging Race Conditions via Symbolic Links"
  abstraction "Detailed"
  status "Draft"
  description "This attack leverages the use of symbolic links (Symlinks) in order to write to sensitive files. An attacker can create a Symlink link to a target file not otherwise accessible to them. When the privileged program tries to create a temporary file with the same name as the Symlink link, it will actually write to the target file pointed to by the attackers' Symlink link. If the attacker can insert malicious content in the temporary file they will be writing to the sensitive file by using the Symlink. The race occurs because the system checks if the temporary file exists, then creates the file. The attacker would typically create the Symlink during the interval between the check and the creation of the temporary file."
  likelihood "Medium"
  severity "High"
  related_attack_patterns "_networkx_list_start"
  related_attack_patterns [
    capec_id "29"
    nature "ChildOf"
  ]
  prerequisites "The attacker is able to create Symlink links on the target host."
  prerequisites "Tainted data from the attacker is used and copied to temporary files."
  prerequisites "The target host does insecure temporary file creation."
  skills_required "_networkx_list_start"
  skills_required [
    level "Medium"
    description "This attack is sophisticated because the attacker has to overcome a few challenges such as creating symlinks on the target host during a precise timing, inserting malicious data in the temporary file and have knowledge about the temporary files created (file name and function which creates them)."
  ]
  resources_required "[]"
  consequences [
    scope "_networkx_list_start"
    scope "Integrity"
    impact "Modify Data"
  ]
  consequences [
    scope "Confidentiality"
    scope "Access Control"
    scope "Authorization"
    impact "Gain Privileges"
  ]
  consequences [
    scope "_networkx_list_start"
    scope "Availability"
    impact "Resource Consumption"
  ]
  mitigations "Use safe libraries when creating temporary files. For instance the standard library function mkstemp can be used to safely create temporary files. For shell scripts, the system utility mktemp does the same thing."
  mitigations "Access to the directories should be restricted as to prevent attackers from manipulating the files. Denying access to a file can prevent an attacker from replacing that file with a link to a sensitive file."
  mitigations "Follow the principle of least privilege when assigning access rights to files."
  mitigations "Ensure good compartmentalization in the system to provide protected areas that can be trusted."
  example_instances "In this naive example, the Unix program foo is setuid. Its function is to retrieve information for the accounts specified by the user. For &#34;efficiency,&#34; it sorts the requested accounts into a temporary file (/tmp/foo naturally) before making the queries. The directory /tmp is world-writable. The malicious user creates a symbolic link to the file /.rhosts named /tmp/foo. Then, they invokes foo with &#34;user&#34; as the requested account. The program creates the (temporary) file /tmp/foo (really creating /.rhosts) and puts the requested account (e.g. &#34;user password&#34;)) in it. It removes the temporary file (merely removing the symbolic link). Now the /.rhosts contains + +, which is the incantation necessary to allow anyone to use rlogin to log into the computer as the superuser. [REF-115]"
  example_instances "GNU &#34;ed&#34; utility (before 0.3) allows local users to overwrite arbitrary files via a symlink attack on temporary files, possibly in the open_sbuf function. See also: CVE-2006-6939"
  example_instances "OpenmosixCollector and OpenMosixView in OpenMosixView 1.5 allow local users to overwrite or delete arbitrary files via a symlink attack on (1) temporary files in the openmosixcollector directory or (2) nodes.tmp. See also: CVE-2005-0894"
  example_instances "Setuid product allows file reading by replacing a file being edited with a symlink to the targeted file, leaking the result in error messages when parsing fails. See also: CVE-2000-0972"
  related_weaknesses "367"
  related_weaknesses "61"
  related_weaknesses "662"
  related_weaknesses "689"
  related_weaknesses "667"
  matched_cwes "662"
  matched_cwes "367"
  taxonomy_mappings "[]"
  execution_flow [
    step "1"
    phase "Explore"
    description "[Verify that target host's platform supports symbolic links.] This attack pattern is only applicable on platforms that support symbolic links."
    techniques "Research target platform to determine whether it supports symbolic links."
    techniques "Create a symbolic link and ensure that it works as expected on the given platform."
  ]
  execution_flow [
    step "2"
    phase "Explore"
    description "[Examine application's file I/O behavior] Analyze the application's file I/O behavior to determine where it stores files, as well as the operations it performs to read/write files."
    techniques "Use kernel tracing utility such as ktrace to monitor application behavior."
    techniques "Use debugging utility such as File Monitor to monitor the application's filesystem I/O calls"
    techniques "Watch temporary directories to see when temporary files are created, modified and deleted."
    techniques "Analyze source code for open-source systems like Linux, Apache, etc."
  ]
  execution_flow [
    step "3"
    phase "Experiment"
    description "[Verify ability to write to filesystem] The attacker verifies ability to write to the target host's file system."
    techniques "Create a file that does not exist in the target directory (e.g. &#34;touch temp.txt&#34; in UNIX-like systems)"
    techniques "On platforms that differentiate between file creation and file modification, if the target file that the application writes to already exists, attempt to modify it."
    techniques "Verify permissions on target directory"
  ]
  execution_flow [
    step "4"
    phase "Exploit"
    description "[Replace file with a symlink to a sensitive system file.] Between the time that the application checks to see if a file exists (or if the user has access to it) and the time the application actually opens the file, the attacker replaces the file with a symlink to a sensitive system file."
    techniques "Create an infinite loop containing commands such as &#34;rm -f tempfile.dat; ln -s /etc/shadow tempfile.dat&#34;. Wait for an instance where the following steps occur in the given order: (1) Application ensures that tempfile.dat exists and that the user has access to it, (2) &#34;rm -f tempfile.dat; ln -s /etc/shadow tempfile.dat&#34;, and (3) Application opens tempfile.dat for writing, and inadvertently opens /etc/shadow for writing instead."
    techniques "Use other techniques with debugging tools to replace the file between the time the application checks the file and the time the application opens it."
  ]
  node [
    id 0
    label "create_a_symbolic_link"
  ]
  node [
    id 1
    label "analyze_the_application_s_file_i"
  ]
  node [
    id 2
    label "trace_utility_such_as_ktrace"
  ]
  node [
    id 3
    label "debug_utility_such_as_file_monitor"
  ]
  node [
    id 4
    label "watch_temporary_directories"
  ]
  node [
    id 5
    label "analyze_source_code_for_open_source_systems_like_linux_apache_etc"
  ]
  node [
    id 6
    label "verify_ability_to_write_to_filesystem"
  ]
  node [
    id 7
    label "create_a_file_that_does_not_exist_in_the_target_directory_e_g_touch_temp_txt_in_unix_like_systems"
  ]
  node [
    id 8
    label "verify_permissions_on_target_directory"
  ]
  node [
    id 9
    label "create_symlinks_to_sensitive_files"
  ]
  node [
    id 10
    label "create_an_infinite_loop_containing_commands_such_as_rm_f_tempfile_dat"
  ]
  node [
    id 11
    label "debug_tools"
  ]
  node [
    id 12
    label "retrieve_information_for_the_accounts_specified_by_the_user"
  ]
  node [
    id 13
    label "sort_the_requested_accounts"
  ]
  node [
    id 14
    label "create_a_symbolic_link_to_the_file_rhosts_named_tmp_foo"
  ]
  node [
    id 15
    label "invoke_foo_with_user"
  ]
  node [
    id 16
    label "store_the_temporary_files"
  ]
  node [
    id 17
    label "remove_the_temporary_file"
  ]
  node [
    id 18
    label "allow_leaking_the_result_in_error_messages_when_parsing_fails"
  ]
  node [
    id 19
    label "create_symlink_links_on_the_target_host"
  ]
  node [
    id 20
    label "insecure_temporary_file_creation"
  ]
  edge [
    source 0
    target 0
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
]
