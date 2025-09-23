graph [
  directed 1
  capec_id "387"
  name "Navigation Remapping To Propagate Malicious Content"
  abstraction "Detailed"
  status "Draft"
  description "An adversary manipulates either egress or ingress data from a client within an application framework in order to change the content of messages and thereby circumvent the expected application logic."
  likelihood ""
  severity "Medium"
  related_attack_patterns "_networkx_list_start"
  related_attack_patterns [
    capec_id "386"
    nature "ChildOf"
  ]
  prerequisites "_networkx_list_start"
  prerequisites "Targeted software is utilizing application framework APIs"
  skills_required "[]"
  resources_required "_networkx_list_start"
  resources_required "A software program that allows the use of adversary-in-the-middle communications between the client and server, such as a man-in-the-middle proxy."
  consequences "[]"
  mitigations "[]"
  example_instances "[]"
  related_weaknesses "471"
  related_weaknesses "345"
  related_weaknesses "346"
  related_weaknesses "602"
  related_weaknesses "311"
  matched_cwes "345"
  matched_cwes "311"
  matched_cwes "602"
  taxonomy_mappings "[]"
  execution_flow "[]"
  node [
    id 0
    label "utilize_application_framework_apis"
  ]
]
