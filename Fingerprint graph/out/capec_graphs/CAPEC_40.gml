graph [
  directed 1
  capec_id "40"
  name "Manipulating Writeable Terminal Devices"
  abstraction "Standard"
  status "Draft"
  description "This attack exploits terminal devices that allow themselves to be written to by other users. The attacker sends command strings to the target terminal device hoping that the target user will hit enter and thereby execute the malicious command with their privileges. The attacker can send the results (such as copying /etc/passwd) to a known directory and collect once the attack has succeeded."
  likelihood "High"
  severity "Very High"
  related_attack_patterns "_networkx_list_start"
  related_attack_patterns [
    capec_id "248"
    nature "ChildOf"
  ]
  prerequisites "_networkx_list_start"
  prerequisites "User terminals must have a permissive access control such as world writeable that allows normal users to control data on other user's terminals."
  skills_required "_networkx_list_start"
  skills_required [
    level "Low"
    description "Ability to discover permissions on terminal devices. Of course, brute force can also be used."
  ]
  resources_required "_networkx_list_start"
  resources_required "Access to a terminal on the target network"
  consequences [
    scope "Confidentiality"
    scope "Access Control"
    scope "Authorization"
    impact "Gain Privileges"
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
  mitigations "Design: Ensure that terminals are only writeable by named owner user and/or administrator"
  mitigations "Design: Enforce principle of least privilege"
  example_instances "_networkx_list_start"
  example_instances "&#34;Any system that allows other peers to write directly to its terminal process is vulnerable to this type of attack. If the terminals are available through being over-privileged (i.e. world-writable) or the attacker is an administrator, then a series of commands in this format can be used to echo commands out to victim terminals. &#34;$echo -e &#34;\033[30m\033\132&#34; > /dev/ttyXX where XX is the tty number of the user under attack. This will paste the characters to another terminal (tty). Note this technique works only if the victim's tty is world writable (which it may not be). That is one reason why programs like write(1) and talk(1) in UNIX systems need to run setuid.&#34; [REF-1] If the victim continues to hit &#34;enter&#34; and execute the commands, there are an endless supply of vectors available to the attacker, copying files, open up network connections, ftp out to servers, and so on."
  related_weaknesses "_networkx_list_start"
  related_weaknesses "77"
  matched_cwes "_networkx_list_start"
  matched_cwes "77"
  taxonomy_mappings "[]"
  execution_flow [
    step "1"
    phase "Explore"
    description "[Identify attacker-writable terminals] Determine if users TTYs are writable by the attacker."
    techniques "Determine the permissions for the TTYs found on the system. Any that allow user write to the TTY may be vulnerable."
    techniques "Attempt to write to other user TTYs. This approach could leave a trail or alert a user."
  ]
  execution_flow [
    step "2"
    phase "Exploit"
    description "[Execute malicious commands] Using one or more vulnerable TTY, execute commands to achieve various impacts."
    techniques "_networkx_list_start"
    techniques "Commands that allow reading or writing end user files can be executed."
  ]
  node [
    id 0
    label "identify_attacker_writable_terminals"
  ]
  node [
    id 1
    label "determine_the_permissions_for_the_ttys_found_on_the_system"
  ]
  node [
    id 2
    label "attempt_to_write_to_other_user_ttys"
  ]
  node [
    id 3
    label "leave_a_trail"
  ]
  node [
    id 4
    label "execute_malicious_commands"
  ]
  node [
    id 5
    label "echo_commands_out_to_victim_terminals"
  ]
  node [
    id 6
    label "paste_the_characters"
  ]
  node [
    id 7
    label "note_only_if_the_victim_s_tty_is_world_writable_which_it_may_not_be"
  ]
  node [
    id 8
    label "need_to_run_setuid"
  ]
  node [
    id 9
    label "continue_to_hit_enter_and_execute_the_commands"
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
]
