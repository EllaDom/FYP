graph [
  directed 1
  capec_id "162"
  name "Manipulating Hidden Fields"
  abstraction "Detailed"
  status "Draft"
  description "An adversary exploits a weakness in the server's trust of client-side processing by modifying data on the client-side, such as price information, and then submitting this data to the server, which processes the modified data. For example, eShoplifting is a data manipulation attack against an on-line merchant during a purchasing transaction. The manipulation of price, discount or quantity fields in the transaction message allows the adversary to acquire items at a lower cost than the merchant intended. The adversary performs a normal purchasing transaction but edits hidden fields within the HTML form response that store price or other information to give themselves a better deal. The merchant then uses the modified pricing information in calculating the cost of the selected items."
  likelihood ""
  severity "High"
  related_attack_patterns "_networkx_list_start"
  related_attack_patterns [
    capec_id "77"
    nature "ChildOf"
  ]
  prerequisites "The targeted site must contain hidden fields to be modified."
  prerequisites "The targeted site must not validate the hidden fields with backend processing."
  skills_required "[]"
  resources_required "_networkx_list_start"
  resources_required "The adversary must have the ability to modify hidden fields by editing the HTTP response to the server."
  consequences "[]"
  mitigations "[]"
  example_instances "[]"
  related_weaknesses "_networkx_list_start"
  related_weaknesses "602"
  matched_cwes "_networkx_list_start"
  matched_cwes "602"
  taxonomy_mappings "[]"
  execution_flow [
    step "1"
    phase "Explore"
    description "[Probe target web application] The adversary first probes the target web application to find all possible pages that can be visited on the website."
    techniques "Use a spidering tool to follow and record all links"
    techniques "Use a proxy tool to record all links visited during a manual traversal of the web application."
  ]
  execution_flow [
    step "2"
    phase "Explore"
    description "[Find hidden fields] Once the web application has been traversed, the adversary looks for all hidden HTML fields present in the client-side."
    techniques "Use the inspect tool on all modern browsers and filter for the keyword &#34;hidden&#34;"
    techniques "Specifically look for hidden fields inside form elements."
  ]
  execution_flow [
    step "3"
    phase "Experiment"
    description "[Send modified hidden fields to server-side] Once the adversary has found hidden fields in the client-side, they will modify the values of these hidden fields one by one and then interact with the web application so that this data is sent to the server-side. The adversary observes the response from the server to determine if the values of each hidden field are being validated."
    techniques "[]"
  ]
  execution_flow [
    step "4"
    phase "Exploit"
    description "[Manipulate hidden fields] Once the adversary has determined which hidden fields are not being validated by the server, they will manipulate them to change the normal behavior of the web application in a way that benefits the adversary."
    techniques "_networkx_list_start"
    techniques "Manipulate a hidden field inside a form element and then submit the form so that the manipulated data is sent to the server."
  ]
  node [
    id 0
    label "probe_the_target_application"
  ]
  node [
    id 1
    label "record_all_links_visited_during_a_manual_traversal_of_the_web_application"
  ]
  node [
    id 2
    label "find_hidden_fields"
  ]
  node [
    id 3
    label "traverse_the_web_application"
  ]
  node [
    id 4
    label "send_modified_hidden_fields"
  ]
  node [
    id 5
    label "observe_the_response_from_the_server"
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
    source 2
    target 5
  ]
  edge [
    source 3
    target 4
  ]
  edge [
    source 4
    target 2
  ]
  edge [
    source 5
    target 4
  ]
]
