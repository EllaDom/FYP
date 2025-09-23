graph [
  directed 1
  capec_id "45"
  name "Buffer Overflow via Symbolic Links"
  abstraction "Detailed"
  status "Draft"
  description "This type of attack leverages the use of symbolic links to cause buffer overflows. An adversary can try to create or manipulate a symbolic link file such that its contents result in out of bounds data. When the target software processes the symbolic link file, it could potentially overflow internal buffers with insufficient bounds checking."
  likelihood "High"
  severity "High"
  related_attack_patterns "_networkx_list_start"
  related_attack_patterns [
    capec_id "100"
    nature "ChildOf"
  ]
  prerequisites "The adversary can create symbolic link on the target host."
  prerequisites "The target host does not perform correct boundary checking while consuming data from a resources."
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
  mitigations "Pay attention to the fact that the resource you read from can be a replaced by a Symbolic link. You can do a Symlink check before reading the file and decide that this is not a legitimate way of accessing the resource."
  mitigations "Because Symlink can be modified by an adversary, make sure that the ones you read are located in protected directories."
  mitigations "Pay attention to the resource pointed to by your symlink links (See attack pattern named &#34;Forced Symlink race&#34;), they can be replaced by malicious resources."
  mitigations "Always check the size of the input data before copying to a buffer."
  mitigations "Use a language or compiler that performs automatic bounds checking."
  mitigations "Use an abstraction library to abstract away risky APIs. Not a complete solution."
  mitigations "Compiler-based canary mechanisms such as StackGuard, ProPolice and the Microsoft Visual Studio /GS flag. Unless this provides automatic bounds checking, it is not a complete solution."
  mitigations "Use OS-level preventative functionality. Not a complete solution."
  example_instances "_networkx_list_start"
  example_instances "The EFTP server has a buffer overflow that can be exploited if an adversary uploads a .lnk (link) file that contains more than 1,744 bytes. This is a classic example of an indirect buffer overflow. First the adversary uploads some content (the link file) and then the adversary causes the client consuming the data to be exploited. In this example, the ls command is exploited to compromise the server software."
  related_weaknesses "120"
  related_weaknesses "285"
  related_weaknesses "302"
  related_weaknesses "118"
  related_weaknesses "119"
  related_weaknesses "74"
  related_weaknesses "20"
  related_weaknesses "680"
  related_weaknesses "697"
  matched_cwes "20"
  matched_cwes "120"
  matched_cwes "74"
  matched_cwes "285"
  matched_cwes "119"
  taxonomy_mappings "[]"
  execution_flow [
    step "1"
    phase "Explore"
    description "[Identify target application] The adversary identifies a target application or program that might load in certain files to memory."
    techniques "[]"
  ]
  execution_flow [
    step "2"
    phase "Experiment"
    description "[Find injection vector] The adversary identifies an injection vector to deliver the excessive content to the targeted application's buffer."
    techniques "_networkx_list_start"
    techniques "The adversary creates or modifies a symbolic link pointing to those files which contain an excessive amount of data. If creating a symbolic link to one of those files causes different behavior in the application, then an injection vector has been identified."
  ]
  execution_flow [
    step "3"
    phase "Experiment"
    description "[Craft overflow file content] The adversary crafts the content to be injected. If the intent is to simply cause the software to crash, the content need only consist of an excessive quantity of random data. If the intent is to leverage the overflow for execution of arbitrary code, the adversary crafts the payload in such a way that the overwritten return address is replaced with one of the adversary's choosing."
    techniques "Create malicious shellcode that will execute when the program execution is returned to it."
    techniques "Use a NOP-sled in the overflow content to more easily &#34;slide&#34; into the malicious code. This is done so that the exact return address need not be correct, only in the range of all of the NOPs"
  ]
  execution_flow [
    step "4"
    phase "Exploit"
    description "[Overflow the buffer] Using the specially crafted file content, the adversary creates a symbolic link from the identified resource to the malicious file, causing a targeted buffer overflow attack."
    techniques "[]"
  ]
  node [
    id 0
    label "identify_target_application"
  ]
  node [
    id 1
    label "identify_a_target_application_or_program_that_might_load_in_certain_files_to_memory"
  ]
  node [
    id 2
    label "find_injection_vector"
  ]
  node [
    id 3
    label "create_a_symbolic_link"
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
    label "exploit_that"
  ]
  node [
    id 10
    label "upload_some_content_the_link_file"
  ]
  node [
    id 11
    label "exploit_the_ls_command"
  ]
  node [
    id 12
    label "perform_correct_boundary_checking"
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
    source 3
    target 4
  ]
  edge [
    source 3
    target 12
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
    target 3
  ]
]
