graph [
  directed 1
  capec_id "586"
  name "Object Injection"
  abstraction "Meta"
  status "Draft"
  description "An adversary attempts to exploit an application by injecting additional, malicious content during its processing of serialized objects. Developers leverage serialization in order to convert data or state into a static, binary format for saving to disk or transferring over a network. These objects are then deserialized when needed to recover the data/state. By injecting a malformed object into a vulnerable application, an adversary can potentially compromise the application by manipulating the deserialization process. This can result in a number of unwanted outcomes, including remote code execution."
  likelihood "Medium"
  severity "High"
  related_attack_patterns "[]"
  prerequisites "_networkx_list_start"
  prerequisites "The target application must unserialize data before validation."
  skills_required "[]"
  resources_required "[]"
  consequences [
    scope "_networkx_list_start"
    scope "Availability"
    impact "Resource Consumption"
  ]
  consequences [
    scope "_networkx_list_start"
    scope "Integrity"
    impact "Modify Data"
  ]
  consequences [
    scope "_networkx_list_start"
    scope "Authorization"
    impact "Execute Unauthorized Commands"
  ]
  mitigations "Implementation: Validate object before deserialization process"
  mitigations "Design: Limit which types can be deserialized."
  mitigations "Implementation: Avoid having unnecessary types or gadgets available that can be leveraged for malicious ends. Use an allowlist of acceptable classes."
  mitigations "Implementation: Keep session state on the server, when possible."
  example_instances "[]"
  related_weaknesses "_networkx_list_start"
  related_weaknesses "502"
  matched_cwes "_networkx_list_start"
  matched_cwes "502"
  taxonomy_mappings "[]"
  execution_flow "[]"
  node [
    id 0
    label "unserialize_data"
  ]
]
