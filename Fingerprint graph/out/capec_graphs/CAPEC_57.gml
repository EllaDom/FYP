graph [
  directed 1
  capec_id "57"
  name "Utilizing REST's Trust in the System Resource to Obtain Sensitive Data"
  abstraction "Detailed"
  status "Draft"
  description "This attack utilizes a REST(REpresentational State Transfer)-style applications' trust in the system resources and environment to obtain sensitive data once SSL is terminated."
  likelihood "Medium"
  severity "Very High"
  related_attack_patterns "_networkx_list_start"
  related_attack_patterns [
    capec_id "157"
    nature "ChildOf"
  ]
  prerequisites "Opportunity to intercept must exist beyond the point where SSL is terminated."
  prerequisites "The adversary must be able to insert a listener actively (proxying the communication) or passively (sniffing the communication) in the client-server communication path."
  skills_required "_networkx_list_start"
  skills_required [
    level "Low"
    description "To insert a network sniffer or other listener into the communication stream"
  ]
  resources_required "[]"
  consequences "_networkx_list_start"
  consequences [
    scope "Confidentiality"
    scope "Access Control"
    scope "Authorization"
    impact "Gain Privileges"
  ]
  mitigations "Implementation: Implement message level security such as HMAC in the HTTP communication"
  mitigations "Design: Utilize defense in depth, do not rely on a single security mechanism like SSL"
  mitigations "Design: Enforce principle of least privilege"
  example_instances "_networkx_list_start"
  example_instances "The Rest service provider uses SSL to protect the communications between the service requester (client) to the service provider. In the instance where SSL is terminated before the communications reach the web server, it is very common in enterprise data centers to terminate SSL at a router, firewall, load balancer, proxy or other device, then the adversary can insert a sniffer into the communication stream and gather all the authentication tokens (such as session credentials, username/passwords combinations, and so on). The Rest service requester and service provider do not have any way to detect this attack."
  related_weaknesses "300"
  related_weaknesses "287"
  related_weaknesses "693"
  matched_cwes "693"
  matched_cwes "287"
  taxonomy_mappings "_networkx_list_start"
  taxonomy_mappings [
    taxonomy_name "ATTACK"
    entry_id "1040"
    entry_name "Network Sniffing"
  ]
  execution_flow [
    step "1"
    phase "Explore"
    description "[Find a REST-style application that uses SSL] The adversary must first find a REST-style application that uses SSL to target. Because this attack is easier to carry out from inside of a server network, it is likely that an adversary could have inside knowledge of how services operate."
    techniques "[]"
  ]
  execution_flow [
    step "2"
    phase "Experiment"
    description "[Insert a listener to sniff client-server communication] The adversary inserts a listener that must exist beyond the point where SSL is terminated. This can be placed on the client side if it is believed that sensitive information is being sent to the client as a response, although most often the listener will be placed on the server side to listen for client authentication information."
    techniques "_networkx_list_start"
    techniques "Run wireshark or tcpdump on a device that is on the inside of a firewall, load balancer, or router of a network and capture traffic after SSL has been terminated"
  ]
  execution_flow [
    step "3"
    phase "Exploit"
    description "[Gather information passed in the clear] If developers have not hashed or encrypted data sent in the sniffed request, the adversary will be able to read this data in the clear. Most commonly, they will now have a username or password that they can use to submit requests to the web service just as an authorized user"
    techniques "[]"
  ]
  node [
    id 0
    label "find_a_rest_style_application_that_uses_ssl"
  ]
  node [
    id 1
    label "sniff_client_server_communication"
  ]
  node [
    id 2
    label "insert_a_listener_that_must_exist_beyond_the_point_where_ssl_is_terminated"
  ]
  node [
    id 3
    label "place_this"
  ]
  node [
    id 4
    label "run_wireshark"
  ]
  node [
    id 5
    label "submit_requests_to_the_web_service"
  ]
  node [
    id 6
    label "protect_the_communications_between_the_service_requester_client"
  ]
  node [
    id 7
    label "terminate_ssl"
  ]
  node [
    id 8
    label "detect_attack"
  ]
  node [
    id 9
    label "insert_a_listener"
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
]
