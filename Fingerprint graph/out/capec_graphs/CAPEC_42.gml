graph [
  directed 1
  capec_id "42"
  name "MIME Conversion"
  abstraction "Detailed"
  status "Draft"
  description "An attacker exploits a weakness in the MIME conversion routine to cause a buffer overflow and gain control over the mail server machine. The MIME system is designed to allow various different information formats to be interpreted and sent via e-mail. Attack points exist when data are converted to MIME compatible format and back."
  likelihood "High"
  severity "High"
  related_attack_patterns "_networkx_list_start"
  related_attack_patterns [
    capec_id "100"
    nature "ChildOf"
  ]
  prerequisites "The target system uses a mail server."
  prerequisites "Mail server vendor has not released a patch for the MIME conversion routine, the patch itself has a security hole or does not fix the original problem, or the patch has not been applied to the user's system."
  skills_required [
    level "Low"
    description "It may be trivial to cause a DoS via this attack pattern"
  ]
  skills_required [
    level "High"
    description "Causing arbitrary code to execute on the target system."
  ]
  resources_required "[]"
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
    scope "Availability"
    impact "Unreliable Execution"
  ]
  consequences [
    scope "Confidentiality"
    scope "Access Control"
    scope "Authorization"
    impact "Gain Privileges"
  ]
  mitigations "Stay up to date with third party vendor patches"
  mitigations "Disable the 7 to 8 bit conversion. This can be done by removing the F=9 flag from all Mailer specifications in the sendmail.cf file. For example, a sendmail.cf file with these changes applied should look similar to (depending on your system and configuration): Mlocal, P=/usr/libexec/mail.local, F=lsDFMAw5:/|@qrmn, S=10/30, R=20/40, T=DNS/RFC822/X-Unix,  A=mail -d $u  Mprog, P=/bin/sh, F=lsDFMoqeu, S=10/30, R=20/40, D=$z:/,  T=X-Unix,  A=sh -c $u This can be achieved for the &#34;Mlocal&#34; and &#34;Mprog&#34; Mailers by modifying the &#34;.mc&#34; file to include the following lines: define(`LOCAL_MAILER_FLAGS', ifdef(`LOCAL_MAILER_FLAGS', `translit(LOCAL_MAILER_FLAGS, `9')',  `rmn'))  define(`LOCAL_SHELL_FLAGS', ifdef(`LOCAL_SHELL_FLAGS', `translit(LOCAL_SHELL_FLAGS, `9')',  `eu')) and then rebuilding the sendmail.cf file using m4(1). From &#34;Exploiting Software&#34;, please see reference below."
  mitigations "Use the sendmail restricted shell program (smrsh)"
  mitigations "Use mail.local"
  example_instances "_networkx_list_start"
  example_instances "A MIME conversion buffer overflow exists in Sendmail versions 8.8.3 and 8.8.4. Sendmail versions 8.8.3 and 8.8.4 are vulnerable to a buffer overflow in the MIME handling code. By sending a message with specially-crafted headers to the server, a remote attacker can overflow a buffer and execute arbitrary commands on the system with root privileges. Sendmail performs a 7 bit to 8 bit conversion on email messages. This vulnerability is due to the fact that insufficient bounds checking was performed while performing these conversions. This gave attacker an opportunity to overwrite the internal stack of sendmail while it is executing with root privileges. An attacker first probes the target system to figure out what mail server is used on the system and what version. An attacker could then test out the exploit at their leisure on their own machine running the same version of the mail server before using it in the wild. See also: CVE-1999-0047"
  related_weaknesses "120"
  related_weaknesses "119"
  related_weaknesses "74"
  related_weaknesses "20"
  matched_cwes "74"
  matched_cwes "20"
  matched_cwes "119"
  matched_cwes "120"
  taxonomy_mappings "[]"
  execution_flow [
    step "1"
    phase "Explore"
    description "[Identify target mail server] The adversary identifies a target mail server that they wish to attack."
    techniques "_networkx_list_start"
    techniques "Use Nmap on a system to identify a mail server service."
  ]
  execution_flow [
    step "2"
    phase "Explore"
    description "[Determine viability of attack] Determine whether the mail server is unpatched and is potentially vulnerable to one of the known MIME conversion buffer overflows (e.g. Sendmail 8.8.3 and 8.8.4)."
    techniques "[]"
  ]
  execution_flow [
    step "3"
    phase "Experiment"
    description "[Find injection vector] Identify places in the system where vulnerable MIME conversion routines may be used."
    techniques "[]"
  ]
  execution_flow [
    step "4"
    phase "Experiment"
    description "[Craft overflow content] The adversary crafts e-mail messages with special headers that will cause a buffer overflow for the vulnerable MIME conversion routine. The intent of this attack is to leverage the overflow for execution of arbitrary code and gain access to the mail server machine, so the adversary will craft an email that not only overflows the targeted buffer but does so in such a way that the overwritten return address is replaced with one of the adversary's choosing."
    techniques "Create malicious shellcode that will execute when the program execution is returned to it."
    techniques "Use a NOP-sled in the overflow content to more easily &#34;slide&#34; into the malicious code. This is done so that the exact return address need not be correct, only in the range of all of the NOPs"
  ]
  execution_flow [
    step "4"
    phase "Exploit"
    description "[Overflow the buffer] Send e-mail messages to the target system with specially crafted headers that trigger the buffer overflow and execute the shell code."
    techniques "[]"
  ]
  node [
    id 0
    label "identify_target_web_mail_server"
  ]
  node [
    id 1
    label "find_injection_vector"
  ]
  node [
    id 2
    label "identify_places_in_the_system_where_vulnerable_mime_conversion_routines_may_be_used"
  ]
  node [
    id 3
    label "craft_e"
  ]
  node [
    id 4
    label "leverage_the_overflow_for_execution_of_arbitrary_code"
  ]
  node [
    id 5
    label "create_malicious_shellcode_that_will_execute_when_the_program_execution_is_returned_to_it"
  ]
  node [
    id 6
    label "sle_nop"
  ]
  node [
    id 7
    label "do_this"
  ]
  node [
    id 8
    label "overflow_the_buffer"
  ]
  node [
    id 9
    label "handle_code"
  ]
  node [
    id 10
    label "send_a_message"
  ]
  node [
    id 11
    label "perform_a_7_bit_to_8_bit_conversion_on_email_messages"
  ]
  node [
    id 12
    label "enable_the_attacker"
  ]
  node [
    id 13
    label "probe_systems"
  ]
  node [
    id 14
    label "test_the_exploit"
  ]
  node [
    id 15
    label "use_a_mail_server"
  ]
  node [
    id 16
    label "release_a_patch_for_the_mime_conversion_routine"
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
]
