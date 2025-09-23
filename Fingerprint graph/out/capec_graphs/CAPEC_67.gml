graph [
  directed 1
  capec_id "67"
  name "String Format Overflow in syslog()"
  abstraction "Detailed"
  status "Draft"
  description "This attack targets applications and software that uses the syslog() function insecurely. If an application does not explicitely use a format string parameter in a call to syslog(), user input can be placed in the format string parameter leading to a format string injection attack. Adversaries can then inject malicious format string commands into the function call leading to a buffer overflow. There are many reported software vulnerabilities with the root cause being a misuse of the syslog() function."
  likelihood "High"
  severity "Very High"
  related_attack_patterns [
    capec_id "100"
    nature "ChildOf"
  ]
  related_attack_patterns [
    capec_id "135"
    nature "ChildOf"
  ]
  prerequisites "_networkx_list_start"
  prerequisites "The Syslog function is used without specifying a format string argument, allowing user input to be placed direct into the function call as a format string."
  skills_required "[]"
  resources_required "[]"
  consequences [
    scope "Confidentiality"
    scope "Integrity"
    scope "Availability"
    impact "Execute Unauthorized Commands"
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
  consequences [
    scope "_networkx_list_start"
    scope "Integrity"
    impact "Modify Data"
  ]
  mitigations "_networkx_list_start"
  mitigations "The code should be reviewed for misuse of the Syslog function call. Manual or automated code review can be used. The reviewer needs to ensure that all format string functions are passed a static string which cannot be controlled by the user and that the proper number of arguments are always sent to that function as well. If at all possible, do not use the %n operator in format strings. The following code shows a correct usage of Syslog(): syslog(LOG_ERR, &#34;%s&#34;, cmdBuf); The following code shows a vulnerable usage of Syslog(): syslog(LOG_ERR, cmdBuf); // the buffer cmdBuff is taking user supplied data."
  example_instances "_networkx_list_start"
  example_instances "Format string vulnerability in TraceEvent function for ntop before 2.1 allows remote adversaries to execute arbitrary code by causing format strings to be injected into calls to the syslog function, via (1) an HTTP GET request, (2) a user name in HTTP authentication, or (3) a password in HTTP authentication. See also: CVE-2002-0412"
  related_weaknesses "120"
  related_weaknesses "134"
  related_weaknesses "74"
  related_weaknesses "20"
  related_weaknesses "680"
  related_weaknesses "697"
  matched_cwes "134"
  matched_cwes "20"
  matched_cwes "74"
  matched_cwes "120"
  taxonomy_mappings "_networkx_list_start"
  taxonomy_mappings [
    taxonomy_name "WASC"
    entry_id "06"
    entry_name "Format String"
  ]
  execution_flow [
    step "1"
    phase "Explore"
    description "[Identify target application] The adversary identifies a target application or program to perform the buffer overflow on. In this attack, adversaries look for applications that use syslog() incorrectly."
    techniques "[]"
  ]
  execution_flow [
    step "2"
    phase "Experiment"
    description "[Find injection vector] The adversary identifies an injection vector to deliver the excessive content to the targeted application's buffer. For each user-controllable input that the adversary suspects is vulnerable to format string injection, attempt to inject formatting characters such as %n, %s, etc.. The goal is to manipulate the string creation using these formatting characters."
    techniques "_networkx_list_start"
    techniques "Inject probe payload which contains formatting characters (%s, %d, %n, etc.) through input parameters."
  ]
  execution_flow [
    step "3"
    phase "Experiment"
    description "[Craft overflow content] The adversary crafts the content to be injected. If the intent is to simply cause the software to crash, the content need only consist of an excessive quantity of random data. If the intent is to leverage the overflow for execution of arbitrary code, the adversary will craft a set of content that not only overflows the targeted buffer but does so in such a way that the overwritten return address is replaced with one of the adversaries' choosing which points to code injected by the adversary."
    techniques "The formatting characters %s and %d are useful for observing memory and trying to print memory addresses. If an adversary has access to the log being written to they can observer this output and use it to help craft their attack."
    techniques "The formatting character %n is useful for adding extra data onto the buffer."
  ]
  execution_flow [
    step "4"
    phase "Exploit"
    description "[Overflow the buffer] Using the injection vector, the adversary supplies the program with the crafted format string injection, causing a buffer."
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
    label "inject_formatting_characters_such_as_n_s_etc"
  ]
  node [
    id 3
    label "manipulate_the_string_creation"
  ]
  node [
    id 4
    label "inject_probe_payload_which_contains_formatting_characters"
  ]
  node [
    id 5
    label "leverage_the_overflow_for_execution_of_arbitrary_code"
  ]
  node [
    id 6
    label "overflow_the_buffer"
  ]
  node [
    id 7
    label "specify_a_format_string_argument"
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
]
