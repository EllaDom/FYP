graph [
  directed 1
  capec_id "462"
  name "Cross-Domain Search Timing"
  abstraction "Detailed"
  status "Draft"
  description "An attacker initiates cross domain HTTP / GET requests and times the server responses. The timing of these responses may leak important information on what is happening on the server. Browser's same origin policy prevents the attacker from directly reading the server responses (in the absence of any other weaknesses), but does not prevent the attacker from timing the responses to requests that the attacker issued cross domain."
  likelihood ""
  severity "Medium"
  related_attack_patterns "_networkx_list_start"
  related_attack_patterns [
    capec_id "54"
    nature "ChildOf"
  ]
  prerequisites "_networkx_list_start"
  prerequisites "Ability to issue GET / POST requests cross domainJava Script is enabled in the victim's browserThe victim has an active session with the site from which the attacker would like to receive informationThe victim's site does not protect search functionality with cross site request forgery (CSRF) protection"
  skills_required "_networkx_list_start"
  skills_required [
    level "Low"
    description "Some knowledge of Java Script"
  ]
  resources_required "_networkx_list_start"
  resources_required "Ability to issue GET / POST requests cross domain"
  consequences "_networkx_list_start"
  consequences [
    scope "_networkx_list_start"
    scope "Confidentiality"
    impact "Read Data"
  ]
  mitigations "Design: The victim's site could protect all potentially sensitive functionality (e.g. search functions) with cross site request forgery (CSRF) protection and not perform any work on behalf of forged requests"
  mitigations "Design: The browser's security model could be fixed to not leak timing information for cross domain requests"
  example_instances "[]"
  related_weaknesses "385"
  related_weaknesses "352"
  related_weaknesses "208"
  matched_cwes "_networkx_list_start"
  matched_cwes "352"
  taxonomy_mappings "[]"
  execution_flow [
    step "1"
    phase "Explore"
    description "[Determine service to send cross domain requests to] The adversary first determines which service they will be sending the requests to"
    techniques "[]"
  ]
  execution_flow [
    step "2"
    phase "Experiment"
    description "[Send and time various cross domain requests] Adversaries will send a variety of cross domain requests to the target, timing the time it takes for the target to respond. Although they won't be able to read the response, the adversary can use the time to infer information about what the service did upon receiving the request."
    techniques "Using a GET request, leverage the &#34;img&#34; tag in conjunction with &#34;onload() / onerror()&#34; javascript events to time a response"
    techniques "Using a POST request, leverage the &#34;iframe&#34; element and use the &#34;onload()&#34; event to time a response"
  ]
  execution_flow [
    step "3"
    phase "Exploit"
    description "[Infer information from the response time] After obtaining reponse times to various requests, the adversary will compare these times and infer potentially sensitive information. An example of this could be asking a service to retrieve information and random usernames. If one request took longer to process, it is likely that a user with that username exists, which could be useful knowledge to an adversary."
    techniques "_networkx_list_start"
    techniques "Compare timing of different requests to infer potentially sensitive information about a target service"
  ]
  node [
    id 0
    label "determine_service"
  ]
  node [
    id 1
    label "send_a_variety_of_cross_domain_requests_to_the_target"
  ]
  node [
    id 2
    label "read_the_response"
  ]
  node [
    id 3
    label "leverage_the_img_tag"
  ]
  node [
    id 4
    label "leverage_iframe_overlay_capabilities"
  ]
  node [
    id 5
    label "ask_a_service"
  ]
  node [
    id 6
    label "take_to_process"
  ]
  node [
    id 7
    label "compare_timing_of_different_requests"
  ]
  node [
    id 8
    label "issue_get_post_requests"
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
]
