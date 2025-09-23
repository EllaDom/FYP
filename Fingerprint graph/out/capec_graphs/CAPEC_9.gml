graph [
  directed 1
  capec_id "9"
  name "Buffer Overflow in Local Command-Line Utilities"
  abstraction "Detailed"
  status "Draft"
  description "This attack targets command-line utilities available in a number of shells. An adversary can leverage a vulnerability found in a command-line utility to escalate privilege to root."
  likelihood "High"
  severity "High"
  related_attack_patterns "_networkx_list_start"
  related_attack_patterns [
    capec_id "100"
    nature "ChildOf"
  ]
  prerequisites "The target host exposes a command-line utility to the user."
  prerequisites "The command-line utility exposed by the target host has a buffer overflow vulnerability that can be exploited."
  skills_required [
    level "Low"
    description "An adversary can simply overflow a buffer by inserting a long string into an adversary-modifiable injection vector. The result can be a DoS."
  ]
  skills_required [
    level "High"
    description "Exploiting a buffer overflow to inject malicious code into the stack of a software system or even the heap can require a higher skill level."
  ]
  resources_required "[]"
  consequences [
    scope "Confidentiality"
    scope "Access Control"
    scope "Authorization"
    impact "Gain Privileges"
  ]
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
    scope "_networkx_list_start"
    scope "Confidentiality"
    impact "Read Data"
  ]
  mitigations "Carefully review the service's implementation before making it available to user. For instance you can use manual or automated code review to uncover vulnerabilities such as buffer overflow."
  mitigations "Use a language or compiler that performs automatic bounds checking."
  mitigations "Use an abstraction library to abstract away risky APIs. Not a complete solution."
  mitigations "Compiler-based canary mechanisms such as StackGuard, ProPolice and the Microsoft Visual Studio /GS flag. Unless this provides automatic bounds checking, it is not a complete solution."
  mitigations "Operational: Use OS-level preventative functionality. Not a complete solution."
  mitigations "Apply the latest patches to your user exposed services. This may not be a complete solution, especially against a zero day attack."
  mitigations "Do not unnecessarily expose services."
  example_instances "_networkx_list_start"
  example_instances "Attack Example: HPUX passwd A buffer overflow in the HPUX passwd command allows local users to gain root privileges via a command-line option. Attack Example: Solaris getopt A buffer overflow in Solaris's getopt command (found in libc) allows local users to gain root privileges via a long argv[0]."
  related_weaknesses "120"
  related_weaknesses "118"
  related_weaknesses "119"
  related_weaknesses "74"
  related_weaknesses "20"
  related_weaknesses "680"
  related_weaknesses "733"
  related_weaknesses "697"
  matched_cwes "119"
  matched_cwes "20"
  matched_cwes "74"
  matched_cwes "120"
  taxonomy_mappings "[]"
  execution_flow [
    step "1"
    phase "Explore"
    description "[Identify target system] The adversary first finds a target system that they want to gain elevated priveleges on. This could be a system they already have some level of access to or a system that they will gain unauthorized access at a lower privelege using some other means."
    techniques "[]"
  ]
  execution_flow [
    step "2"
    phase "Explore"
    description "[Find injection vector] The adversary identifies command line utilities exposed by the target host that contain buffer overflow vulnerabilites. The adversary likely knows which utilities have these vulnerabilities and what the effected versions are, so they will also obtain version numbers for these utilities."
    techniques "[]"
  ]
  execution_flow [
    step "3"
    phase "Experiment"
    description "[Craft overflow command] Once the adversary has found a vulnerable utility, they will use their knownledge of the vulnerabilty to create the command that will exploit the buffer overflow."
    techniques "[]"
  ]
  execution_flow [
    step "4"
    phase "Exploit"
    description "[Overflow the buffer] Using the injection vector, the adversary executes the crafted command, gaining elevated priveleges on the machine."
    techniques "[]"
  ]
  node [
    id 0
    label "identify_target"
  ]
  node [
    id 1
    label "gain_unauthorized_access_at_a_lower_privelege_using_some_other_means"
  ]
  node [
    id 2
    label "find_injection_vector"
  ]
  node [
    id 3
    label "identify_command_line_utilities_exposed_by_the_target_host_that_contain_buffer_overflow_vulnerabilites"
  ]
  node [
    id 4
    label "find_a_vulnerable_utility"
  ]
  node [
    id 5
    label "overflow_the_buffer"
  ]
  node [
    id 6
    label "getopt_a_buffer_overflow_in_solaris_s_getopt_command_found_in_libc"
  ]
  node [
    id 7
    label "expose_a_command_line_utility"
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
