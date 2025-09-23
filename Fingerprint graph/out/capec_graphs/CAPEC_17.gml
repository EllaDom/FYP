graph [
  directed 1
  capec_id "17"
  name "Using Malicious Files"
  abstraction "Standard"
  status "Draft"
  description "An attack of this type exploits a system's configuration that allows an adversary to either directly access an executable file, for example through shell access; or in a possible worst case allows an adversary to upload a file and then execute it. Web servers, ftp servers, and message oriented middleware systems which have many integration points are particularly vulnerable, because both the programmers and the administrators must be in synch regarding the interfaces and the correct privileges for each interface."
  likelihood "High"
  severity "Very High"
  related_attack_patterns [
    capec_id "122"
    nature "ChildOf"
  ]
  related_attack_patterns [
    capec_id "233"
    nature "CanPrecede"
  ]
  prerequisites "_networkx_list_start"
  prerequisites "System's configuration must allow an attacker to directly access executable files or upload files to execute. This means that any access control system that is supposed to mediate communications between the subject and the object is set incorrectly or assumes a benign environment."
  skills_required "_networkx_list_start"
  skills_required [
    level "Low"
    description "To identify and execute against an over-privileged system interface"
  ]
  resources_required "_networkx_list_start"
  resources_required "Ability to communicate synchronously or asynchronously with server that publishes an over-privileged directory, program, or interface. Optionally, ability to capture output directly through synchronous communication or other method such as FTP."
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
    scope "Confidentiality"
    impact "Read Data"
  ]
  consequences [
    scope "Confidentiality"
    scope "Access Control"
    scope "Authorization"
    impact "Gain Privileges"
  ]
  mitigations "Design: Enforce principle of least privilege"
  mitigations "Design: Run server interfaces with a non-root account and/or utilize chroot jails or other configuration techniques to constrain privileges even if attacker gains some limited access to commands."
  mitigations "Implementation: Perform testing such as pen-testing and vulnerability scanning to identify directories, programs, and interfaces that grant direct access to executables."
  example_instances "_networkx_list_start"
  example_instances "Consider a directory on a web server with the following permissions drwxrwxrwx 5 admin public 170 Nov 17 01:08 webroot This could allow an attacker to both execute and upload and execute programs' on the web server. This one vulnerability can be exploited by a threat to probe the system and identify additional vulnerabilities to exploit."
  related_weaknesses "732"
  related_weaknesses "285"
  related_weaknesses "272"
  related_weaknesses "59"
  related_weaknesses "282"
  related_weaknesses "270"
  related_weaknesses "693"
  matched_cwes "732"
  matched_cwes "693"
  matched_cwes "285"
  matched_cwes "282"
  matched_cwes "59"
  taxonomy_mappings [
    taxonomy_name "ATTACK"
    entry_id "1574.005"
    entry_name "Hijack Execution Flow: Executable Installer File Permissions Weakness"
  ]
  taxonomy_mappings [
    taxonomy_name "ATTACK"
    entry_id "1574.010"
    entry_name "Hijack Execution Flow: Services File Permissions Weakness"
  ]
  execution_flow [
    step "1"
    phase "Explore"
    description "[Determine File/Directory Configuration] The adversary looks for misconfigured files or directories on a system that might give executable access to an overly broad group of users."
    techniques "_networkx_list_start"
    techniques "Through shell access to a system, use the command &#34;ls -l&#34; to view permissions for files and directories."
  ]
  execution_flow [
    step "2"
    phase "Experiment"
    description "[Upload Malicious Files] If the adversary discovers a directory that has executable permissions, they will attempt to upload a malicious file to execute."
    techniques "_networkx_list_start"
    techniques "Upload a malicious file through a misconfigured FTP server."
  ]
  execution_flow [
    step "3"
    phase "Exploit"
    description "[Execute Malicious File] The adversary either executes the uploaded malicious file, or executes an existing file that has been misconfigured to allow executable access to the adversary."
    techniques "[]"
  ]
  node [
    id 0
    label "view_permissions_for_files_and_directories"
  ]
  node [
    id 1
    label "upload_a_trojan_file"
  ]
  node [
    id 2
    label "execute_malicious_file"
  ]
  node [
    id 3
    label "access_a_directory"
  ]
  node [
    id 4
    label "exploit_that"
  ]
  edge [
    source 0
    target 1
  ]
  edge [
    source 1
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
]
