graph [
  directed 1
  capec_id "10"
  name "Buffer Overflow via Environment Variables"
  abstraction "Detailed"
  status "Draft"
  description "This attack pattern involves causing a buffer overflow through manipulation of environment variables. Once the adversary finds that they can modify an environment variable, they may try to overflow associated buffers. This attack leverages implicit trust often placed in environment variables."
  likelihood "High"
  severity "High"
  related_attack_patterns "_networkx_list_start"
  related_attack_patterns [
    capec_id "100"
    nature "ChildOf"
  ]
  prerequisites "The application uses environment variables."
  prerequisites "An environment variable exposed to the user is vulnerable to a buffer overflow."
  prerequisites "The vulnerable environment variable uses untrusted data."
  prerequisites "Tainted data used in the environment variables is not properly validated. For instance boundary checking is not done before copying the input data to a buffer."
  skills_required [
    level "Low"
    description "An attacker can simply overflow a buffer by inserting a long string into an attacker-modifiable injection vector. The result can be a DoS."
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
  consequences [
    scope "Confidentiality"
    scope "Access Control"
    scope "Authorization"
    impact "Gain Privileges"
  ]
  mitigations "Do not expose environment variable to the user."
  mitigations "Do not use untrusted data in your environment variables."
  mitigations "Use a language or compiler that performs automatic bounds checking"
  mitigations "There are tools such as Sharefuzz [REF-2] which is an environment variable fuzzer for Unix that support loading a shared library. You can use Sharefuzz to determine if you are exposing an environment variable vulnerable to buffer overflow."
  example_instances "A buffer overflow in sccw allows local users to gain root access via the $HOME environmental variable. See also: CVE-1999-0906"
  example_instances "A buffer overflow in the rlogin program involves its consumption of the $TERM environmental variable. See also: CVE-1999-0046"
  related_weaknesses "120"
  related_weaknesses "302"
  related_weaknesses "118"
  related_weaknesses "119"
  related_weaknesses "74"
  related_weaknesses "99"
  related_weaknesses "20"
  related_weaknesses "680"
  related_weaknesses "733"
  related_weaknesses "697"
  matched_cwes "119"
  matched_cwes "20"
  matched_cwes "74"
  matched_cwes "120"
  taxonomy_mappings "_networkx_list_start"
  taxonomy_mappings [
    taxonomy_name "OWASP Attacks"
    entry_id ""
    entry_name "Buffer Overflow via Environment Variables"
  ]
  execution_flow [
    step "1"
    phase "Explore"
    description "[Identify target application] The adversary identifies a target application or program to perform the buffer overflow on. In this attack the adversary looks for an application that loads the content of an environment variable into a buffer."
    techniques "[]"
  ]
  execution_flow [
    step "2"
    phase "Experiment"
    description "[Find injection vector] The adversary identifies an injection vector to deliver the excessive content to the targeted application's buffer."
    techniques "_networkx_list_start"
    techniques "Change the values of environment variables thought to be used by the application to contain excessive data. If the program is loading the value of the environment variable into a buffer, this could cause a crash and an attack vector will be found."
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
    label "change_the_values_of_environment_variables"
  ]
  node [
    id 3
    label "load_the_value_of_the_environment_variable"
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
    label "involve_its_consumption_of_the_term_environmental_variable"
  ]
  node [
    id 10
    label "use_untrusted_data"
  ]
  node [
    id 11
    label "copy_the_input_data"
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
    source 2
    target 10
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
    target 2
  ]
  edge [
    source 10
    target 11
  ]
]
