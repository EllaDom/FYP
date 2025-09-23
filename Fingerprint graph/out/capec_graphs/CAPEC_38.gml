graph [
  directed 1
  capec_id "38"
  name "Leveraging/Manipulating Configuration File Search Paths"
  abstraction "Detailed"
  status "Draft"
  description "This pattern of attack sees an adversary load a malicious resource into a program's standard path so that when a known command is executed then the system instead executes the malicious component. The adversary can either modify the search path a program uses, like a PATH variable or classpath, or they can manipulate resources on the path to point to their malicious components. J2EE applications and other component based applications that are built from multiple binaries can have very long list of dependencies to execute. If one of these libraries and/or references is controllable by the attacker then application controls can be circumvented by the attacker."
  likelihood "High"
  severity "Very High"
  related_attack_patterns "_networkx_list_start"
  related_attack_patterns [
    capec_id "159"
    nature "ChildOf"
  ]
  prerequisites "_networkx_list_start"
  prerequisites "The attacker must be able to write to redirect search paths on the victim host."
  skills_required "_networkx_list_start"
  skills_required [
    level "Low"
    description "To identify and execute against an over-privileged system interface"
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
    impact "Gain Privileges"
  ]
  mitigations "Design: Enforce principle of least privilege"
  mitigations "Design: Ensure that the program's compound parts, including all system dependencies, classpath, path, and so on, are secured to the same or higher level assurance as the program"
  mitigations "Implementation: Host integrity monitoring"
  example_instances "Another method is to redirect commands by aliasing one legitimate command to another to create unexpected results. the Unix command &#34;rm&#34; could be aliased to &#34;mv&#34; and move all files the victim thinks they are deleting to a directory the attacker controls. In a Unix shell .profile setting alias rm=mv /usr/home/attacker In this case the attacker retains a copy of all the files the victim attempts to remove."
  example_instances "A standard UNIX path looks similar to this /bin:/sbin:/usr/bin:/usr/local/bin:/usr/sbin If the attacker modifies the path variable to point to a locale that includes malicious resources then the user unwittingly can execute commands on the attackers' behalf: /evildir/bin:/sbin:/usr/bin:/usr/local/bin:/usr/sbin This is a form of usurping control of the program and the attack can be done on the classpath, database resources, or any other resources built from compound parts. At runtime detection and blocking of this attack is nearly impossible, because the configuration allows execution."
  related_weaknesses "426"
  related_weaknesses "427"
  matched_cwes "426"
  matched_cwes "427"
  taxonomy_mappings [
    taxonomy_name "ATTACK"
    entry_id "1574.007"
    entry_name "Hijack Execution Flow: Path Interception by PATH Environment Variable"
  ]
  taxonomy_mappings [
    taxonomy_name "ATTACK"
    entry_id "1574.009"
    entry_name "Hijack Execution Flow: Path Interception by Unquoted Path"
  ]
  execution_flow "[]"
  node [
    id 0
    label "redirect_parameter"
  ]
  node [
    id 1
    label "aliase_the_unix_command_rm"
  ]
  node [
    id 2
    label "set_unix_shell_profile"
  ]
  node [
    id 3
    label "retain_a_copy_of_all_the_files_the_victim_attempts_to_remove"
  ]
  node [
    id 4
    label "look_bin_usr_local_bin_usr_sbin"
  ]
  node [
    id 5
    label "modify_the_path_variable"
  ]
  node [
    id 6
    label "allow_execution"
  ]
  node [
    id 7
    label "write_to_redirect_search_paths_on_the_victim_host"
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
]
