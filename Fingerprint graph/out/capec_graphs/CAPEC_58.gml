graph [
  directed 1
  capec_id "58"
  name "Restful Privilege Elevation"
  abstraction "Detailed"
  status "Draft"
  description "An adversary identifies a Rest HTTP (Get, Put, Delete) style permission method allowing them to perform various malicious actions upon server data due to lack of access control mechanisms implemented within the application service accepting HTTP messages."
  likelihood "High"
  severity "High"
  related_attack_patterns [
    capec_id "1"
    nature "ChildOf"
  ]
  related_attack_patterns [
    capec_id "180"
    nature "ChildOf"
  ]
  prerequisites "_networkx_list_start"
  prerequisites "The attacker needs to be able to identify HTTP Get URLs. The Get methods must be set to call applications that perform operations other than get such as update and delete."
  skills_required "_networkx_list_start"
  skills_required [
    level "Low"
    description "It is relatively straightforward to identify an HTTP Get method that changes state on the server side and executes against an over-privileged system interface"
  ]
  resources_required "[]"
  consequences [
    scope "_networkx_list_start"
    scope "Integrity"
    impact "Modify Data"
  ]
  consequences [
    scope "Confidentiality"
    scope "Access Control"
    scope "Authorization"
    impact "Gain Privileges"
  ]
  mitigations "Design: Enforce principle of least privilege"
  mitigations "Implementation: Ensure that HTTP Get methods only retrieve state and do not alter state on the server side"
  mitigations "Implementation: Ensure that HTTP methods have proper ACLs based on what the functionality they expose"
  example_instances "_networkx_list_start"
  example_instances "The HTTP Get method is designed to retrieve resources and not to alter the state of the application or resources on the server side. However, developers can easily code programs that accept a HTTP Get request that do in fact create, update or delete data on the server. Both Flickr (http://www.flickr.com/services/api/flickr.photosets.delete.html) and del.icio.us (http://del.icio.us/api/posts/delete) have implemented delete operations using standard HTTP Get requests. These HTTP Get methods do delete data on the server side, despite being called from Get which is not supposed to alter state."
  related_weaknesses "267"
  related_weaknesses "269"
  matched_cwes "_networkx_list_start"
  matched_cwes "269"
  taxonomy_mappings "[]"
  execution_flow "[]"
  node [
    id 0
    label "code_programs_that_accept_a_http_get_request_that_do_in_fact_create_update_or_delete_data_on_the_server"
  ]
  node [
    id 1
    label "implement_delete_operations"
  ]
  node [
    id 2
    label "get_http"
  ]
  node [
    id 3
    label "need_to_be_able_to_identify_http_get_urls"
  ]
  node [
    id 4
    label "set_the_get_methods"
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
]
