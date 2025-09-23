graph [
  directed 1
  capec_id "100"
  name "Overflow Buffers"
  abstraction "Standard"
  status "Draft"
  description "Buffer Overflow attacks target improper or missing bounds checking on buffer operations, typically triggered by input injected by an adversary. As a consequence, an adversary is able to write past the boundaries of allocated buffer regions in memory, causing a program crash or potentially redirection of execution as per the adversaries' choice."
  likelihood "High"
  severity "Very High"
  related_attack_patterns "_networkx_list_start"
  related_attack_patterns [
    capec_id "123"
    nature "ChildOf"
  ]
  prerequisites "Targeted software performs buffer operations."
  prerequisites "Targeted software inadequately performs bounds-checking on buffer operations."
  prerequisites "Adversary has the capability to influence the input to buffer operations."
  skills_required [
    level "Low"
    description "In most cases, overflowing a buffer does not require advanced skills beyond the ability to notice an overflow and stuff an input variable with content."
  ]
  skills_required [
    level "High"
    description "In cases of directed overflows, where the motive is to divert the flow of the program or application as per the adversaries' bidding, high level skills are required. This may involve detailed knowledge of the target system architecture and kernel."
  ]
  resources_required "_networkx_list_start"
  resources_required "None: No specialized resources are required to execute this type of attack. Detecting and exploiting a buffer overflow does not require any resources beyond knowledge of and access to the target system."
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
    scope "Confidentiality"
    scope "Access Control"
    scope "Authorization"
    impact "Gain Privileges"
  ]
  mitigations "Use a language or compiler that performs automatic bounds checking."
  mitigations "Use secure functions not vulnerable to buffer overflow."
  mitigations "If you have to use dangerous functions, make sure that you do boundary checking."
  mitigations "Compiler-based canary mechanisms such as StackGuard, ProPolice and the Microsoft Visual Studio /GS flag. Unless this provides automatic bounds checking, it is not a complete solution."
  mitigations "Use OS-level preventative functionality. Not a complete solution."
  mitigations "Utilize static source code analysis tools to identify potential buffer overflow weaknesses in the software."
  example_instances "The most straightforward example is an application that reads in input from the user and stores it in an internal buffer but does not check that the size of the input data is less than or equal to the size of the buffer. If the user enters excessive length data, the buffer may overflow leading to the application crashing, or worse, enabling the user to cause execution of injected code."
  example_instances "Many web servers enforce security in web applications through the use of filter plugins. An example is the SiteMinder plugin used for authentication. An overflow in such a plugin, possibly through a long URL or redirect parameter, can allow an adversary not only to bypass the security checks but also execute arbitrary code on the target web server in the context of the user that runs the web server process."
  related_weaknesses "120"
  related_weaknesses "119"
  related_weaknesses "131"
  related_weaknesses "129"
  related_weaknesses "805"
  related_weaknesses "680"
  matched_cwes "119"
  matched_cwes "131"
  matched_cwes "120"
  taxonomy_mappings [
    taxonomy_name "WASC"
    entry_id "07"
    entry_name "Buffer Overflow"
  ]
  taxonomy_mappings [
    taxonomy_name "OWASP Attacks"
    entry_id ""
    entry_name "Buffer overflow attack"
  ]
  execution_flow [
    step "1"
    phase "Explore"
    description "[Identify target application] The adversary identifies a target application or program to perform the buffer overflow on. Adversaries often look for applications that accept user input and that perform manual memory management."
    techniques "[]"
  ]
  execution_flow [
    step "2"
    phase "Experiment"
    description "[Find injection vector] The adversary identifies an injection vector to deliver the excessive content to the targeted application's buffer."
    techniques "_networkx_list_start"
    techniques "Provide large input to a program or application and observe the behavior. If there is a crash, this means that a buffer overflow attack is possible."
  ]
  execution_flow [
    step "3"
    phase "Experiment"
    description "[Craft overflow content] The adversary crafts the content to be injected. If the intent is to simply cause the software to crash, the content need only consist of an excessive quantity of random data. If the intent is to leverage the overflow for execution of arbitrary code, the adversary crafts the payload in such a way that the overwritten return address is replaced with one of the adversary's choosing."
    techniques "Create malicious shellcode that will execute when the program execution is returned to it."
    techniques "Use a NOP-sled in the overflow content to more easily &#34;slide&#34; into the malicious code. This is done so that the exact return address need not be correct, only in the range of all of the NOPs"
  ]
  execution_flow [
    step "4"
    phase "Exploit"
    description "[Overflow the buffer] Using the injection vector, the adversary injects the crafted overflow content into the buffer."
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
    label "provide_large_input"
  ]
  node [
    id 3
    label "mean_if_there_is_a_crash"
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
    label "enter_excessive_length_data"
  ]
  node [
    id 10
    label "enforce_security_in_web_applications"
  ]
  node [
    id 11
    label "redirect_parameter"
  ]
  node [
    id 12
    label "influence_the_input_to_buffer_operations"
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
]
