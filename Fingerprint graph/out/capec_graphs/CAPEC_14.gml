graph [
  directed 1
  capec_id "14"
  name "Client-side Injection-induced Buffer Overflow"
  abstraction "Detailed"
  status "Draft"
  description "This type of attack exploits a buffer overflow vulnerability in targeted client software through injection of malicious content from a custom-built hostile service. This hostile service is created to deliver the correct content to the client software. For example, if the client-side application is a browser, the service will host a webpage that the browser loads."
  likelihood "Medium"
  severity "High"
  related_attack_patterns "_networkx_list_start"
  related_attack_patterns [
    capec_id "100"
    nature "ChildOf"
  ]
  prerequisites "The targeted client software communicates with an external server."
  prerequisites "The targeted client software has a buffer overflow vulnerability."
  skills_required [
    level "Low"
    description "To achieve a denial of service, an attacker can simply overflow a buffer by inserting a long string into an attacker-modifiable injection vector."
  ]
  skills_required [
    level "High"
    description "Exploiting a buffer overflow to inject malicious code into the stack of a software system or even the heap requires a more in-depth knowledge and higher skill level."
  ]
  resources_required "[]"
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
    scope "_networkx_list_start"
    scope "Availability"
    impact "Resource Consumption"
  ]
  consequences [
    scope "Confidentiality"
    scope "Integrity"
    scope "Availability"
    impact "Execute Unauthorized Commands"
  ]
  mitigations "The client software should not install untrusted code from a non-authenticated server."
  mitigations "The client software should have the latest patches and should be audited for vulnerabilities before being used to communicate with potentially hostile servers."
  mitigations "Perform input validation for length of buffer inputs."
  mitigations "Use a language or compiler that performs automatic bounds checking."
  mitigations "Use an abstraction library to abstract away risky APIs. Not a complete solution."
  mitigations "Compiler-based canary mechanisms such as StackGuard, ProPolice and the Microsoft Visual Studio /GS flag. Unless this provides automatic bounds checking, it is not a complete solution."
  mitigations "Ensure all buffer uses are consistently bounds-checked."
  mitigations "Use OS-level preventative functionality. Not a complete solution."
  example_instances "_networkx_list_start"
  example_instances "Authors often use <EMBED> tags in HTML documents. For example <EMBED TYPE=&#34;audio/midi&#34; SRC=&#34;/path/file.mid&#34; AUTOSTART=&#34;true&#34;> In Internet Explorer 4.0 an adversary attacker supplies an overly long path in the SRC= directive, the mshtml.dll component will suffer a buffer overflow. This is a standard example of content in a Web page being directed to exploit a faulty module in the system. There are potentially thousands of different ways data can propagate into a given system, thus these kinds of attacks will continue to be found in the wild."
  related_weaknesses "120"
  related_weaknesses "353"
  related_weaknesses "118"
  related_weaknesses "119"
  related_weaknesses "74"
  related_weaknesses "20"
  related_weaknesses "680"
  related_weaknesses "697"
  matched_cwes "119"
  matched_cwes "20"
  matched_cwes "74"
  matched_cwes "120"
  taxonomy_mappings "[]"
  execution_flow [
    step "1"
    phase "Explore"
    description "[Identify target client-side application] The adversary identifies a target client-side application to perform the buffer overflow on. The most common are browsers. If there is a known browser vulnerability an adversary could target that."
    techniques "[]"
  ]
  execution_flow [
    step "2"
    phase "Experiment"
    description "[Find injection vector] The adversary identifies an injection vector to deliver the excessive content to the targeted application's buffer."
    techniques "Many times client side applications will be open source, so an adversary can examine the source code to identify possible injection vectors."
    techniques "Examine APIs of the client-side application and look for areas where a buffer overflow might be possible."
  ]
  execution_flow [
    step "3"
    phase "Experiment"
    description "[Create hostile service] The adversary creates a hostile service that will deliver content to the client-side application. If the intent is to simply cause the software to crash, the content need only consist of an excessive quantity of random data. If the intent is to leverage the overflow for execution of arbitrary code, the adversary crafts the payload in such a way that the overwritten return address is replaced with one of the adversary's choosing."
    techniques "If the client-side application is a browser, the adversary will create a service that delivers a malicious webpage to the browser."
    techniques "Create malicious shellcode that will execute when the program execution is returned to it."
    techniques "Use a NOP-sled in the overflow content to more easily &#34;slide&#34; into the malicious code. This is done so that the exact return address need not be correct, only in the range of all of the NOPs"
  ]
  execution_flow [
    step "4"
    phase "Exploit"
    description "[Overflow the buffer] Using the injection vector, the adversary delivers the content to the client-side application using the hostile service and overflows the buffer."
    techniques "If the adversary is targeting a local client-side application, they just need to use the service themselves."
    techniques "If the adversary is attempting to cause an overflow on an external user's client-side application, they must get the user to attach to their service by some other means. This could be getting a user to visit their hostile webpage to target a user's browser."
  ]
  node [
    id 0
    label "identify_target_client_side_application"
  ]
  node [
    id 1
    label "find_injection_vector"
  ]
  node [
    id 2
    label "examine_the_source_code"
  ]
  node [
    id 3
    label "examine_apis_of_the_client_side_application"
  ]
  node [
    id 4
    label "create_hostile_service"
  ]
  node [
    id 5
    label "create_a_hostile_service_that_will_deliver_content_to_the_client_side_application"
  ]
  node [
    id 6
    label "leverage_the_overflow_for_execution_of_arbitrary_code"
  ]
  node [
    id 7
    label "create_a_service_that_delivers_a_malicious_webpage_to_the_browser"
  ]
  node [
    id 8
    label "create_malicious_shellcode_that_will_execute_when_the_program_execution_is_returned_to_it"
  ]
  node [
    id 9
    label "sle_nop"
  ]
  node [
    id 10
    label "do_this"
  ]
  node [
    id 11
    label "overflow_the_buffer"
  ]
  node [
    id 12
    label "attempt_to_cause_an_overflow_on_an_external_user_s_client_side_application"
  ]
  node [
    id 13
    label "get_a_user"
  ]
  node [
    id 14
    label "use_embed_tags_in_html_documents"
  ]
  node [
    id 15
    label "supply_an_overly_long_path_in_the_src_directive"
  ]
  node [
    id 16
    label "direct_to_exploit_a_faulty_module_in_the_system"
  ]
  edge [
    source 0
    target 1
  ]
  edge [
    source 0
    target 12
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
    target 0
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
  edge [
    source 16
    target 11
  ]
]
