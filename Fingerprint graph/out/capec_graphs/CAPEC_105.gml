graph [
  directed 1
  capec_id "105"
  name "HTTP Request Splitting"
  abstraction "Detailed"
  status "Stable"
  description "&#10;            "
  likelihood "Medium"
  severity "High"
  related_attack_patterns [
    capec_id "220"
    nature "ChildOf"
  ]
  related_attack_patterns [
    capec_id "34"
    nature "PeerOf"
  ]
  related_attack_patterns [
    capec_id "115"
    nature "CanPrecede"
  ]
  related_attack_patterns [
    capec_id "141"
    nature "CanPrecede"
  ]
  related_attack_patterns [
    capec_id "63"
    nature "CanPrecede"
  ]
  related_attack_patterns [
    capec_id "593"
    nature "CanPrecede"
  ]
  related_attack_patterns [
    capec_id "148"
    nature "CanPrecede"
  ]
  related_attack_patterns [
    capec_id "154"
    nature "CanPrecede"
  ]
  prerequisites "An additional intermediary HTTP agent such as an application firewall or a web caching proxy between the adversary and the second agent such as a web server, that sends multiple HTTP messages over same network connection."
  prerequisites "Differences in the way the two HTTP agents parse and interpret HTTP requests and its headers."
  prerequisites "HTTP headers capable of being user-manipulated."
  prerequisites "HTTP agents running on HTTP/1.0 or HTTP/1.1 that allow for Keep Alive mode, Pipelined queries, and Chunked queries and responses."
  skills_required [
    level "Medium"
    description "Detailed knowledge on HTTP protocol: request and response messages structure and usage of specific headers."
  ]
  skills_required [
    level "Medium"
    description "Detailed knowledge on how specific HTTP agents receive, send, process, interpret, and parse a variety of HTTP messages and headers."
  ]
  skills_required [
    level "Medium"
    description "Possess knowledge on the exact details in the discrepancies between several targeted HTTP agents in path of an HTTP message in parsing its message structure and individual headers."
  ]
  resources_required "_networkx_list_start"
  resources_required "Tools capable of crafting malicious HTTP messages and monitoring HTTP messages responses."
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
  mitigations "Design: evaluate HTTP agents prior to deployment for parsing/interpretation discrepancies."
  mitigations "Configuration: front-end HTTP agents notice ambiguous requests."
  mitigations "Configuration: back-end HTTP agents reject ambiguous requests and close the network connection."
  mitigations "Configuration: Disable reuse of back-end connections."
  mitigations "Configuration: Use HTTP/2 for back-end connections."
  mitigations "Configuration: Use the same web server software for front-end and back-end server."
  mitigations "Implementation: Utilize a Web Application Firewall (WAF) that has built-in mitigation to detect abnormal requests/responses."
  mitigations "Configuration: Install latest vendor security patches available for both intermediary and back-end HTTP infrastructure (i.e. proxies and web servers)"
  mitigations "Configuration: Ensure that HTTP infrastructure in the chain or network path utilize a strict uniform parsing process."
  mitigations "Implementation: Utilize intermediary HTTP infrastructure capable of filtering and/or sanitizing user-input."
  example_instances "_networkx_list_start"
  example_instances "Microsoft Internet Explorer versions 5.01 SP4 and prior, 6.0 SP2 and prior, and 7.0 contain a vulnerability that could allow an unauthenticated, remote adversary to conduct HTTP request splitting and smuggling attacks. The vulnerability is due to an input validation error in the browser that allows adversaries to manipulate certain headers to expose the browser to HTTP request splitting and smuggling attacks. Attacks may include cross-site scripting, proxy cache poisoning, and session fixation. In certain instances, an exploit could allow the adversary to bypass web application firewalls or other filtering devices. Microsoft has confirmed the vulnerability and released software updates."
  related_weaknesses "74"
  related_weaknesses "113"
  related_weaknesses "138"
  related_weaknesses "436"
  matched_cwes "_networkx_list_start"
  matched_cwes "74"
  taxonomy_mappings "_networkx_list_start"
  taxonomy_mappings [
    taxonomy_name "WASC"
    entry_id "24"
    entry_name "HTTP Request Splitting"
  ]
  execution_flow [
    step "1"
    phase "Explore"
    description "[Survey network to identify target] The adversary performs network reconnaissance by monitoring relevant traffic to identify the network path and parsing of the HTTP messages with the goal of identifying potential targets."
    techniques "_networkx_list_start"
    techniques "Scan networks to fingerprint HTTP infrastructure and monitor HTTP traffic to identify HTTP network path with a tool such as a Network Protocol Analyzer."
  ]
  execution_flow [
    step "1"
    phase "Experiment"
    description "[Identify vulnerabilities in targeted HTTP infrastructure and technologies] The adversary sends a variety of benign/ambiguous HTTP requests to observe responses from HTTP infrastructure in order to identify differences/discrepancies in the interpretation and parsing of HTTP requests by examining supported HTTP protocol versions, HTTP headers, syntax checking and input filtering."
    techniques "[]"
  ]
  execution_flow [
    step "2"
    phase "Experiment"
    description "[Cause differential HTTP responses by experimenting with identified HTTP Request vulnerabilities] The adversary sends maliciously crafted HTTP requests with custom strings and embedded web scripts and objects in HTTP headers to interfere with the parsing of intermediary and back-end HTTP infrastructure, followed by normal/benign HTTP request from the adversary or a random user. The intended consequences of the malicious HTTP requests will be observed in the HTTP infrastructure response to the normal/benign HTTP request to confirm applicability of identified vulnerabilities in the adversary's plan of attack."
    techniques "Continue the monitoring of HTTP traffic."
    techniques "Follow an unrecognized (sometimes a RFC compliant) HTTP header with a subsequent HTTP request to potentially cause the HTTP request to be ignored and interpreted as part of the preceding HTTP request."
  ]
  execution_flow [
    step "1"
    phase "Exploit"
    description "[Perform HTTP Request Splitting attack] Using knowledge discovered in the experiment section above, smuggle a message to cause one of the consequences."
    techniques "_networkx_list_start"
    techniques "Leverage techniques identified in the Experiment Phase."
  ]
  node [
    id 0
    label "identify_target"
  ]
  node [
    id 1
    label "perform_network_reconnaissance"
  ]
  node [
    id 2
    label "fingerprint_http_infrastructure"
  ]
  node [
    id 3
    label "identify_vulnerabilities_in_targeted_http_infrastructure_and_technologies"
  ]
  node [
    id 4
    label "continue_the_monitoring_of_http_traffic"
  ]
  node [
    id 5
    label "follow_an_unrecognized_sometimes_a_rfc_compliant"
  ]
  node [
    id 6
    label "perform_http_request_splitting_attack"
  ]
  node [
    id 7
    label "version_5_01_sp4_and_prior_6_0_sp2_and_prior_and"
  ]
  node [
    id 8
    label "include_cross_site_scripting_proxy_cache_poisoning_and_session_fixation"
  ]
  node [
    id 9
    label "allow_the_adversary"
  ]
  node [
    id 10
    label "confirm_the_vulnerability"
  ]
  node [
    id 11
    label "cache_proxy_between_the_adversary_and_the_second_agent_such_as_a_web_server"
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
  edge [
    source 10
    target 11
  ]
]
