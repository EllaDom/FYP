graph [
  directed 1
  capec_id "132"
  name "Symlink Attack"
  abstraction "Detailed"
  status "Draft"
  description "An adversary positions a symbolic link in such a manner that the targeted user or application accesses the link's endpoint, assuming that it is accessing a file with the link's name."
  likelihood "Low"
  severity "High"
  related_attack_patterns "_networkx_list_start"
  related_attack_patterns [
    capec_id "159"
    nature "ChildOf"
  ]
  prerequisites "_networkx_list_start"
  prerequisites "The targeted application must perform the desired activities on a file without checking whether the file is a symbolic link or not. The adversary must be able to predict the name of the file the target application is modifying and be able to create a new symbolic link where that file would appear."
  skills_required [
    level "Low"
    description "To create symlinks"
  ]
  skills_required [
    level "High"
    description "To identify the files and create the symlinks during the file operation time window"
  ]
  resources_required "_networkx_list_start"
  resources_required "None: No specialized resources are required to execute this type of attack. The only requirement is the ability to create the necessary symbolic link."
  consequences [
    scope "_networkx_list_start"
    scope "Confidentiality"
    impact "Other"
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
    scope "Integrity"
    impact "Modify Data"
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
  mitigations "Design: Check for the existence of files to be created, if in existence verify they are neither symlinks nor hard links before opening them."
  mitigations "Implementation: Use randomly generated file names for temporary files. Give the files restrictive permissions."
  example_instances "_networkx_list_start"
  example_instances "The adversary creates a symlink with the &#34;same&#34; name as the file which the application is intending to write to. The application will write to the file- &#34;causing the data to be written where the symlink is pointing&#34;. An attack like this can be demonstrated as follows: root# vulprog myFile {...program does some processing...]  adversary# ln &#8211;s /etc/nologin myFile [...program writes to 'myFile', which points to /etc/nologin...] In the above example, the root user ran a program with poorly written file handling routines, providing the filename &#34;myFile&#34; to vulnprog for the relevant data to be written to. However, the adversary happened to be looking over the shoulder of &#34;root&#34; at the time, and created a link from myFile to /etc/nologin. The attack would make no user be able to login."
  related_weaknesses "_networkx_list_start"
  related_weaknesses "59"
  matched_cwes "_networkx_list_start"
  matched_cwes "59"
  taxonomy_mappings "_networkx_list_start"
  taxonomy_mappings [
    taxonomy_name "ATTACK"
    entry_id "1547.009"
    entry_name "Boot or Logon Autostart Execution:Shortcut Modification"
  ]
  execution_flow [
    step "1"
    phase "Explore"
    description "[Identify Target] Adversary identifies the target application by determining whether there is sufficient check before writing data to a file and creating symlinks to files in different directories."
    techniques "The adversary writes to files in different directories to check whether the application has sufficient checking before file operations."
    techniques "The adversary creates symlinks to files in different directories."
  ]
  execution_flow [
    step "2"
    phase "Experiment"
    description "[Try to create symlinks to different files] The adversary then uses a variety of techniques, such as monitoring or guessing to create symlinks to the files accessed by the target application in the directories which are identified in the explore phase."
    techniques "The adversary monitors the file operations performed by the target application using a tool like dtrace or FileMon. And the adversary can delay the operations by using &#34;sleep(2)&#34; and &#34;usleep()&#34; to prepare the appropriate conditions for the attack, or make the application perform expansive tasks (large files parsing, etc.) depending on the purpose of the application."
    techniques "The adversary may need a little guesswork on the filenames on which the target application would operate."
    techniques "The adversary tries to create symlinks to the various filenames."
  ]
  execution_flow [
    step "3"
    phase "Exploit"
    description "[Target application operates on created symlinks to sensitive files] The adversary is able to create symlinks to sensitive files while the target application is operating on the file."
    techniques "_networkx_list_start"
    techniques "Create the symlink to the sensitive file such as configuration files, etc."
  ]
  node [
    id 0
    label "identify_target"
  ]
  node [
    id 1
    label "write_to_check_whether_the_application_has_sufficient_checking_before_file_operations"
  ]
  node [
    id 2
    label "create_symlinks_to_files_in_different_directories"
  ]
  node [
    id 3
    label "monitor_the_file_operations_performed_by_the_target_application_using_a_tool_like_dtrace_or_filemon"
  ]
  node [
    id 4
    label "delay_the_operations"
  ]
  node [
    id 5
    label "need_a_little_guesswork"
  ]
  node [
    id 6
    label "create_symlinks_to_sensitive_files"
  ]
  node [
    id 7
    label "demonstrate_an_attack_like_this"
  ]
  node [
    id 8
    label "run_a_program_with_poorly_written_file_handling_routines"
  ]
  node [
    id 9
    label "happen_to_be_looking_over_the_shoulder_of_root_at_the_time"
  ]
  node [
    id 10
    label "predict_the_name_of_the_file_the_target_application_is_modifying_and_be_able_to_create_a_new_symbolic_link_where_that_file_would_appear"
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
    target 2
  ]
  edge [
    source 2
    target 3
  ]
  edge [
    source 2
    target 6
  ]
  edge [
    source 2
    target 7
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
    target 2
  ]
  edge [
    source 6
    target 2
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
