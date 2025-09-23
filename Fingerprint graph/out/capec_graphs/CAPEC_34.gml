graph [
  directed 1
  capec_id "34"
  name "HTTP Response Splitting"
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
    capec_id "105"
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
  prerequisites "A vulnerable or compromised server or domain/site capable of allowing adversary to insert/inject malicious content that will appear in the server's response to target HTTP agents (e.g., proxies and users' web browsers)."
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
  resources_required "Tools capable of monitoring HTTP messages, and crafting malicious HTTP messages and/or injecting malicious content into HTTP messages."
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
  example_instances "In the PHP 5 session extension mechanism, a user-supplied session ID is sent back to the user within the Set-Cookie HTTP header. Since the contents of the user-supplied session ID are not validated, it is possible to inject arbitrary HTTP headers into the response body. This immediately enables HTTP Response Splitting by simply terminating the HTTP response header from within the session ID used in the Set-Cookie directive. See also: CVE-2006-0207"
  related_weaknesses "74"
  related_weaknesses "113"
  related_weaknesses "138"
  related_weaknesses "436"
  matched_cwes "_networkx_list_start"
  matched_cwes "74"
  taxonomy_mappings "_networkx_list_start"
  taxonomy_mappings [
    taxonomy_name "WASC"
    entry_id "25"
    entry_name "HTTP Response Splitting"
  ]
  execution_flow [
    step "1"
    phase "Explore"
    description "[Survey network to identify target] The adversary performs network reconnaissance by monitoring relevant traffic to identify the network path and parsing of the HTTP messages with the goal of identifying potential targets"
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
    description "[Cause differential HTTP responses by experimenting with identified HTTP Request vulnerabilities] The adversary sends maliciously crafted HTTP request to back-end HTTP infrastructure to inject adversary data (in the form of HTTP headers with custom strings and embedded web scripts and objects) into HTTP responses (intended for intermediary and/or front-end client/victim HTTP agents communicating with back-end HTTP infrastructure) for the purpose of interfering with the parsing of HTTP responses by intermediary and front-end client/victim HTTP agents. The intended consequences of the malicious HTTP request and the subsequent adversary injection and manipulation of HTTP responses to intermediary and front-end client/victim HTTP agents, will be observed to confirm applicability of identified vulnerabilities in the adversary's plan of attack."
    techniques "Continue the monitoring of HTTP traffic."
    techniques "Follow an unrecognized (sometimes a RFC compliant) HTTP header with a subsequent HTTP request to potentially cause the HTTP request to be ignored and interpreted as part of the preceding HTTP request."
  ]
  execution_flow [
    step "1"
    phase "Exploit"
    description "[Perform HTTP Response Splitting attack] Using knowledge discovered in the experiment section above, smuggle a message to cause one of the consequences."
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
    target 6
  ]
]
