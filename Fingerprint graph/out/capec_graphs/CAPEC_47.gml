graph [
  directed 1
  capec_id "47"
  name "Buffer Overflow via Parameter Expansion"
  abstraction "Detailed"
  status "Draft"
  description "In this attack, the target software is given input that the adversary knows will be modified and expanded in size during processing. This attack relies on the target software failing to anticipate that the expanded data may exceed some internal limit, thereby creating a buffer overflow."
  likelihood "Medium"
  severity "High"
  related_attack_patterns "_networkx_list_start"
  related_attack_patterns [
    capec_id "100"
    nature "ChildOf"
  ]
  prerequisites "The program expands one of the parameters passed to a function with input controlled by the user, but a later function making use of the expanded parameter erroneously considers the original, not the expanded size of the parameter."
  prerequisites "The expanded parameter is used in the context where buffer overflow may become possible due to the incorrect understanding of the parameter size (i.e. thinking that it is smaller than it really is)."
  skills_required "_networkx_list_start"
  skills_required [
    level "High"
    description "Finding this particular buffer overflow may not be trivial. Also, stack and especially heap based buffer overflows require a lot of knowledge if the intended goal is arbitrary code execution. Not only that the adversary needs to write the shell code to accomplish their goals, but the adversary also needs to find a way to get the program execution to jump to the planted shell code. There also needs to be sufficient room for the payload. So not every buffer overflow will be exploitable, even by a skilled adversary."
  ]
  resources_required "_networkx_list_start"
  resources_required "Access to the program source or binary. If the program is only available in binary then a disassembler and other reverse engineering tools will be helpful."
  consequences [
    scope "Confidentiality"
    scope "Access Control"
    scope "Authorization"
    impact "Gain Privileges"
  ]
  consequences [
    scope "_networkx_list_start"
    scope "Availability"
    impact "Unreliable Execution"
  ]
  consequences [
    scope "_networkx_list_start"
    scope "Integrity"
    impact "Modify Data"
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
  mitigations "_networkx_list_start"
  mitigations "Ensure that when parameter expansion happens in the code that the assumptions used to determine the resulting size of the parameter are accurate and that the new size of the parameter is visible to the whole system"
  example_instances "Attack Example: FTP glob() The glob() function in FTP servers has been susceptible to attack as a result of incorrect resizing. This is an ftpd glob() Expansion LIST Heap Overflow Vulnerability. ftp daemon contains a heap-based buffer overflow condition. The overflow occurs when the LIST command is issued with an argument that expands into an oversized string after being processed by glob(). This buffer overflow occurs in memory that is dynamically allocated. It may be possible for adversaries to exploit this vulnerability and execute arbitrary code on the affected host. To exploit this, the adversary must be able to create directories on the target host. The glob() function is used to expand short-hand notation into complete file names. By sending to the FTP server a request containing a tilde (~) and other wildcard characters in the pathname string, a remote adversary can overflow a buffer and execute arbitrary code on the FTP server to gain root privileges. Once the request is processed, the glob() function expands the user input, which could exceed the expected length. In order to exploit this vulnerability, the adversary must be able to create directories on the FTP server. [REF-1] See also: CVE-2001-0249"
  example_instances "Buffer overflow in the glob implementation in libc in NetBSD-current before 20050914, and NetBSD 2.* and 3.* before 20061203, as used by the FTP daemon, allows remote authenticated users to execute arbitrary code via a long pathname that results from path expansion. The limit computation of an internal buffer was done incorrectly. The size of the buffer in byte was used as element count, even though the elements of the buffer are 2 bytes long. Long expanded path names would therefore overflow the buffer. See also: CVE-2006-6652"
  related_weaknesses "120"
  related_weaknesses "119"
  related_weaknesses "118"
  related_weaknesses "130"
  related_weaknesses "131"
  related_weaknesses "74"
  related_weaknesses "20"
  related_weaknesses "680"
  related_weaknesses "697"
  matched_cwes "20"
  matched_cwes "120"
  matched_cwes "74"
  matched_cwes "131"
  matched_cwes "130"
  matched_cwes "119"
  taxonomy_mappings "[]"
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
    techniques "In this attack, the normal method of providing large user input does not work. The program performs bounds checking on the user input, but not the expanded user input. The adversary needs to provide input that they believe will be expanded by the program to overflow a buffer. To identify where this is possible, an adversary either needs to have knowledge of the inner workings of the program or use a disassembler and other reverse engineering tools to guide the search."
  ]
  execution_flow [
    step "3"
    phase "Experiment"
    description "[Craft overflow content] The adversary crafts the input to be given to the program. If the intent is to simply cause the software to crash, the input needs only to expand to an excessive quantity of random data. If the intent is to leverage the overflow for execution of arbitrary code, the adversary will craft input that expands in a way that not only overflows the targeted buffer but does so in such a way that the overwritten return address is replaced with one of the adversaries' choosing which points to code injected by the adversary."
    techniques "_networkx_list_start"
    techniques "Create specific files and directories on the system and then give input using path traversal shortcuts to those directories that could expand past an input buffer."
  ]
  execution_flow [
    step "4"
    phase "Exploit"
    description "[Overflow the buffer] Using the injection vector, the adversary gives the crafted input to the program, overflowing the buffer."
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
    label "need_to_provide_input_they_believe_that_will_be_expanded_by_the_program_to_overflow_a_buffer"
  ]
  node [
    id 4
    label "craft_the_input_to_be_given_to_the_program"
  ]
  node [
    id 5
    label "leverage_the_overflow_for_execution_of_arbitrary_code"
  ]
  node [
    id 6
    label "create_specific_files_and_directories_on_the_system"
  ]
  node [
    id 7
    label "overflow_the_buffer"
  ]
  node [
    id 8
    label "contain_a_heap_based_buffer_overflow_condition"
  ]
  node [
    id 9
    label "occur_when_the_list_command_is_issued_with_an_argument_that_expands_into_an_oversized_string_after_being_processed_by_glob"
  ]
  node [
    id 10
    label "exploit_that"
  ]
  node [
    id 11
    label "expand_short_hand_notation"
  ]
  node [
    id 12
    label "send_a_request_containing_a_tilde"
  ]
  node [
    id 13
    label "process_the_request"
  ]
  node [
    id 14
    label "do_the_limit_computation_of_an_internal_buffer"
  ]
  node [
    id 15
    label "use_the_size_of_the_buffer_in_byte"
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
    target 10
  ]
  edge [
    source 10
    target 11
  ]
  edge [
    source 10
    target 14
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
    target 10
  ]
  edge [
    source 14
    target 15
  ]
]
