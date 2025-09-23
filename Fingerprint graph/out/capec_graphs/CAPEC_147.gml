graph [
  directed 1
  capec_id "147"
  name "XML Ping of the Death"
  abstraction "Detailed"
  status "Draft"
  description "An attacker initiates a resource depletion attack where a large number of small XML messages are delivered at a sufficiently rapid rate to cause a denial of service or crash of the target. Transactions such as repetitive SOAP transactions can deplete resources faster than a simple flooding attack because of the additional resources used by the SOAP protocol and the resources necessary to process SOAP messages. The transactions used are immaterial as long as they cause resource utilization on the target. In other words, this is a normal flooding attack augmented by using messages that will require extra processing on the target."
  likelihood "Low"
  severity "Medium"
  related_attack_patterns "_networkx_list_start"
  related_attack_patterns [
    capec_id "528"
    nature "ChildOf"
  ]
  prerequisites "_networkx_list_start"
  prerequisites "The target must receive and process XML transactions."
  skills_required [
    level "Low"
    description "To send small XML messages"
  ]
  skills_required [
    level "High"
    description "To use distributed network to launch the attack"
  ]
  resources_required "_networkx_list_start"
  resources_required "Transaction generator(s)/source(s) and ability to cause arrival of messages at the target with sufficient rapidity to overload target. Larger targets may be able to handle large volumes of requests so the attacker may require significant resources (such as a distributed network) to affect the target. However, the resources required of the attacker would be less than in the case of a simple flooding attack against the same target."
  consequences "_networkx_list_start"
  consequences [
    scope "_networkx_list_start"
    scope "Availability"
    impact "Resource Consumption"
  ]
  mitigations "Design: Build throttling mechanism into the resource allocation. Provide for a timeout mechanism for allocated resources whose transaction does not complete within a specified interval."
  mitigations "Implementation: Provide for network flow control and traffic shaping to control access to the resources."
  example_instances "_networkx_list_start"
  example_instances "Consider the case of attack performed against the createCustomerBillingAccount Web Service for an online store. In this case, the createCustomerBillingAccount Web Service receives a huge number of simultaneous requests, containing nonsense billing account creation information (the small XML messages). The createCustomerBillingAccount Web Services may forward the messages to other Web Services for processing. The application suffers from a high load of requests, potentially leading to a complete loss of availability the involved Web Service."
  related_weaknesses "400"
  related_weaknesses "770"
  matched_cwes "_networkx_list_start"
  matched_cwes "400"
  taxonomy_mappings "[]"
  execution_flow [
    step "1"
    phase "Explore"
    description "[Survey the target] Using a browser or an automated tool, an attacker records all instance of web services to process XML requests."
    techniques "Use an automated tool to record all instances of URLs to process XML requests."
    techniques "Use a browser to manually explore the website and analyze how the application processes XML requests."
  ]
  execution_flow [
    step "2"
    phase "Exploit"
    description "[Launch a resource depletion attack] The attacker delivers a large number of small XML messages to the target URLs found in the explore phase at a sufficiently rapid rate. It causes denial of service to the target application."
    techniques "_networkx_list_start"
    techniques "Send a large number of crafted small XML messages to the target URL."
  ]
  node [
    id 0
    label "survey_the_target_application"
  ]
  node [
    id 1
    label "record_all_instances_of_urls"
  ]
  node [
    id 2
    label "explore_the_website"
  ]
  node [
    id 3
    label "launch_a_resource_depletion_attack"
  ]
  node [
    id 4
    label "deliver_a_large_number_of_small_xml_messages"
  ]
  node [
    id 5
    label "cause_denial_of_service_to_the_target_application"
  ]
  node [
    id 6
    label "consider_the_case_of_attack_performed_against_the_createcustomerbillingaccount_web_service_for_an_online_store"
  ]
  node [
    id 7
    label "receive_a_huge_number_of_simultaneous_requests"
  ]
  node [
    id 8
    label "forward_the_messages_to_other_web_services_for_processing"
  ]
  node [
    id 9
    label "suffer_potentially_leading_to_a_complete_loss_of_availability_the_involved_web_service"
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
    source 4
    target 6
  ]
  edge [
    source 5
    target 4
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
