graph [
  directed 1
  capec_id "202"
  name "Create Malicious Client"
  abstraction "Standard"
  status "Draft"
  description "An adversary creates a client application to interface with a target service where the client violates assumptions the service makes about clients. Services that have designated client applications (as opposed to services that use general client applications, such as IMAP or POP mail servers which can interact with any IMAP or POP client) may assume that the client will follow specific procedures."
  likelihood ""
  severity "Medium"
  related_attack_patterns "_networkx_list_start"
  related_attack_patterns [
    capec_id "22"
    nature "ChildOf"
  ]
  prerequisites "_networkx_list_start"
  prerequisites "The targeted service must make assumptions about the behavior of the client application that interacts with it, which can be abused by an adversary."
  skills_required "[]"
  resources_required "_networkx_list_start"
  resources_required "The adversary must be able to reverse engineer a client of the targeted service. However, the adversary does not need to reverse engineer all client functionality - they only need to recreate enough of the functionality to access the desired server functionality."
  consequences "[]"
  mitigations "[]"
  example_instances "[]"
  related_weaknesses "_networkx_list_start"
  related_weaknesses "602"
  matched_cwes "_networkx_list_start"
  matched_cwes "602"
  taxonomy_mappings "[]"
  execution_flow "[]"
  node [
    id 0
    label "make_assumptions_about_the_behavior_of_the_client_application_that_interacts_with_it_which_can_be_abused_by_an_adversary"
  ]
]
