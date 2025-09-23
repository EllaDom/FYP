graph [
  directed 1
  capec_id "8"
  name "Buffer Overflow in an API Call"
  abstraction "Detailed"
  status "Draft"
  description "This attack targets libraries or shared code modules which are vulnerable to buffer overflow attacks. An adversary who has knowledge of known vulnerable libraries or shared code can easily target software that makes use of these libraries. All clients that make use of the code library thus become vulnerable by association. This has a very broad effect on security across a system, usually affecting more than one software process."
  likelihood "High"
  severity "High"
  related_attack_patterns "_networkx_list_start"
  related_attack_patterns [
    capec_id "100"
    nature "ChildOf"
  ]
  prerequisites "The target host exposes an API to the user."
  prerequisites "One or more API functions exposed by the target host has a buffer overflow vulnerability."
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
    scope "_networkx_list_start"
    scope "Availability"
    impact "Unreliable Execution"
  ]
  consequences [
    scope "Confidentiality"
    scope "Integrity"
    scope "Availability"
    impact "Execute Unauthorized Commands"
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
  mitigations "Use a language or compiler that performs automatic bounds checking."
  mitigations "Use secure functions not vulnerable to buffer overflow."
  mitigations "If you have to use dangerous functions, make sure that you do boundary checking."
  mitigations "Compiler-based canary mechanisms such as StackGuard, ProPolice and the Microsoft Visual Studio /GS flag. Unless this provides automatic bounds checking, it is not a complete solution."
  mitigations "Use OS-level preventative functionality. Not a complete solution."
  example_instances "Attack Example: Libc in FreeBSD A buffer overflow in the FreeBSD utility setlocale (found in the libc module) puts many programs at risk all at once."
  example_instances "Xtlib A buffer overflow in the Xt library of the X windowing system allows local users to execute commands with root privileges."
  related_weaknesses "120"
  related_weaknesses "119"
  related_weaknesses "118"
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
    description "[Identify target application] The adversary, with knowledge of vulnerable libraries or shared code modules, identifies a target application or program that makes use of these."
    techniques "[]"
  ]
  execution_flow [
    step "2"
    phase "Experiment"
    description "[Find injection vector] The adversary attempts to use the API, and if they can they send a large amount of data to see if the buffer overflow attack really does work."
    techniques "_networkx_list_start"
    techniques "Provide large input to a program or application and observe the behavior. If there is a crash, this means that a buffer overflow attack is possible."
  ]
  execution_flow [
    step "3"
    phase "Experiment"
    description "[Craft overflow content] The adversary crafts the content to be injected based on their knowledge of the vulnerability and their desired outcome. If the intent is to simply cause the software to crash, the content need only consist of an excessive quantity of random data. If the intent is to leverage the overflow for execution of arbitrary code, the adversary will craft a set of content that not only overflows the targeted buffer but does so in such a way that the overwritten return address is replaced with one of the adversaries' choosing which points to code injected by the adversary."
    techniques "Create malicious shellcode that will execute when the program execution is returned to it."
    techniques "Use a NOP-sled in the overflow content to more easily &#34;slide&#34; into the malicious code. This is done so that the exact return address need not be correct, only in the range of all of the NOPs"
  ]
  execution_flow [
    step "4"
    phase "Exploit"
    description "[Overflow the buffer] Using the API as the injection vector, the adversary injects the crafted overflow content into the buffer."
    techniques "[]"
  ]
  node [
    id 0
    label "identify_target_application"
  ]
  node [
    id 1
    label "find_injection_vector"
  ]
  node [
    id 2
    label "attempt_to_use_the_api"
  ]
  node [
    id 3
    label "provide_large_input"
  ]
  node [
    id 4
    label "mean_if_there_is_a_crash"
  ]
  node [
    id 5
    label "leverage_the_overflow_for_execution_of_arbitrary_code"
  ]
  node [
    id 6
    label "create_malicious_shellcode_that_will_execute_when_the_program_execution_is_returned_to_it"
  ]
  node [
    id 7
    label "sle_nop"
  ]
  node [
    id 8
    label "do_this"
  ]
  node [
    id 9
    label "overflow_the_buffer"
  ]
  node [
    id 10
    label "expose_an_api"
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
