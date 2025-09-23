graph [
  directed 1
  capec_id "46"
  name "Overflow Variables and Tags"
  abstraction "Detailed"
  status "Draft"
  description "This type of attack leverages the use of tags or variables from a formatted configuration data to cause buffer overflow. The adversary crafts a malicious HTML page or configuration file that includes oversized strings, thus causing an overflow."
  likelihood "High"
  severity "High"
  related_attack_patterns [
    capec_id "100"
    nature "ChildOf"
  ]
  related_attack_patterns [
    capec_id "8"
    nature "PeerOf"
  ]
  related_attack_patterns [
    capec_id "10"
    nature "PeerOf"
  ]
  prerequisites "The target program consumes user-controllable data in the form of tags or variables."
  prerequisites "The target program does not perform sufficient boundary checking."
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
  mitigations "Use an abstraction library to abstract away risky APIs. Not a complete solution."
  mitigations "Compiler-based canary mechanisms such as StackGuard, ProPolice and the Microsoft Visual Studio /GS flag. Unless this provides automatic bounds checking, it is not a complete solution."
  mitigations "Use OS-level preventative functionality. Not a complete solution."
  mitigations "Do not trust input data from user. Validate all user input."
  example_instances "A buffer overflow vulnerability exists in the Yamaha MidiPlug that can be accessed via a Text variable found in an EMBED tag. See also: CVE-1999-0946"
  example_instances "A buffer overflow in Exim allows local users to gain root privileges by providing a long :include: option in a .forward file. See also: CVE-1999-0971"
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
    description "[Identify target application] The adversary identifies a target application or program to perform the buffer overflow on. Adversaries look for applications or programs that accept formatted files, such as configuration files, as input."
    techniques "[]"
  ]
  execution_flow [
    step "2"
    phase "Experiment"
    description "[Find injection vector] The adversary identifies an injection vector to deliver the excessive content to the targeted application's buffer."
    techniques "_networkx_list_start"
    techniques "Knowing the type of file that an application takes as input, the adversary takes a normal input file and modifies a single variable or tag to contain a large amount of data. If there is a crash, this means that a buffer overflow attack is possible. The adversary will keep changing single variables or tags one by one until they see a change in behavior."
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
    description "[Overflow the buffer] The adversary will upload the crafted file to the application, causing a buffer overflow."
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
    label "know_the_type_of_file_that_an_application_takes_as_input"
  ]
  node [
    id 3
    label "mean_if_there_is_a_crash"
  ]
  node [
    id 4
    label "keep_changing_single_variables_or_tags_one_by_one"
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
    label "express_an_application_s_user_controllable_data"
  ]
  node [
    id 11
    label "perform_correct_boundary_checking"
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
]
