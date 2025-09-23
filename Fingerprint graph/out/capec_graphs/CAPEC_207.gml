graph [
  directed 1
  capec_id "207"
  name "Removing Important Client Functionality"
  abstraction "Standard"
  status "Draft"
  description "An adversary removes or disables functionality on the client that the server assumes to be present and trustworthy."
  likelihood "Medium"
  severity "High"
  related_attack_patterns "_networkx_list_start"
  related_attack_patterns [
    capec_id "22"
    nature "ChildOf"
  ]
  prerequisites "_networkx_list_start"
  prerequisites "The targeted server must assume the client performs important actions to protect the server or the server functionality. For example, the server may assume the client filters outbound traffic or that the client performs all price calculations correctly. Moreover, the server must fail to detect when these assumptions are violated by a client."
  skills_required [
    level "High"
    description "To reverse engineer the client-side code to disable/remove the functionality on the client that the server relies on."
  ]
  skills_required [
    level "Low"
    description "The adversary installs a web tool that allows scripts or the DOM model of web-based applications to be modified before they are executed in a browser. GreaseMonkey and Firebug are two examples of such tools."
  ]
  resources_required "_networkx_list_start"
  resources_required "The adversary must have access to a client and be able to modify the client behavior, often through reverse engineering. If the server is assuming specific client functionality, this usually means the server only recognizes a specific client application, rather than a broad class of client applications. Reverse engineering tools would likely be necessary."
  consequences [
    scope "_networkx_list_start"
    scope "Confidentiality"
    impact "Other"
  ]
  consequences [
    scope "_networkx_list_start"
    scope "Integrity"
    impact "Modify Data"
  ]
  consequences [
    scope "_networkx_list_start"
    scope "Confidentiality"
    impact "Read Data"
  ]
  consequences [
    scope "Accountability"
    scope "Authentication"
    scope "Authorization"
    scope "Non-Repudiation"
    impact "Gain Privileges"
  ]
  consequences [
    scope "Access Control"
    scope "Authorization"
    impact "Bypass Protection Mechanism"
  ]
  mitigations "Design: For any security checks that are performed on the client side, ensure that these checks are duplicated on the server side."
  mitigations "Design: Ship client-side application with integrity checks (code signing) when possible."
  mitigations "Design: Use obfuscation and other techniques to prevent reverse engineering the client code."
  example_instances "The adversary reverse engineers a Java binary (by decompiling it) and identifies where license management code exists. Noticing that the license manager returns TRUE or FALSE as to whether or not the user is licensed, the adversary simply overwrites both branch targets to return TRUE, recompiles, and finally redeploys the binary."
  example_instances "The adversary uses click-through exploration of a Servlet-based website to map out its functionality, taking note of its URL-naming conventions and Servlet mappings. Using this knowledge and guessing the Servlet name of functionality they're not authorized to use, the adversary directly navigates to the privileged functionality around the authorizing single-front controller (implementing programmatic authorization checks)."
  related_weaknesses "_networkx_list_start"
  related_weaknesses "602"
  matched_cwes "_networkx_list_start"
  matched_cwes "602"
  taxonomy_mappings "[]"
  execution_flow [
    step "1"
    phase "Explore"
    description "[Probing] The adversary probes, through brute-forcing, reverse-engineering or other similar means, the functionality on the client that server assumes to be present and trustworthy."
    techniques "The adversary probes by exploring an application's functionality and its underlying mapping to server-side components."
    techniques "The adversary reverse engineers client-side code to identify the functionality that the server relies on for the proper or secure operation."
  ]
  execution_flow [
    step "2"
    phase "Experiment"
    description "[Determine which functionality to disable or remove] The adversary tries to determine which functionality to disable or remove through reverse-engineering from the list of functionality identified in the Explore phase."
    techniques "_networkx_list_start"
    techniques "The adversary reverse engineers the client-side code to determine which functionality to disable or remove."
  ]
  execution_flow [
    step "3"
    phase "Exploit"
    description "[Disable or remove the critical functionality from the client code] Once the functionality has been determined, the adversary disables or removes the critical functionality from the client code to perform malicious actions that the server believes are prohibited."
    techniques "_networkx_list_start"
    techniques "The adversary disables or removes the functionality from the client-side code to perform malicious actions, such as sending of dangerous content (such as scripts) to the server."
  ]
  node [
    id 0
    label "probe_the_functionality_on_the_client_that_server_assumes_to_be_present_and_trustworthy"
  ]
  node [
    id 1
    label "engineer_client_side_code"
  ]
  node [
    id 2
    label "remove_the_critical_functionality_from_the_client_code"
  ]
  node [
    id 3
    label "identify_functionality"
  ]
  node [
    id 4
    label "engineer_a_java_binary"
  ]
  node [
    id 5
    label "guess_the_servlet_name_of_functionality_they_re_not_authorized_to_use"
  ]
  node [
    id 6
    label "fail_to_detect_when_these_assumptions_are_violated_by_a_client"
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
]
