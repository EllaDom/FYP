graph [
  directed 1
  capec_id "116"
  name "Excavation"
  abstraction "Meta"
  status "Stable"
  description "An adversary actively probes the target in a manner that is designed to solicit information that could be leveraged for malicious purposes."
  likelihood "High"
  severity "Medium"
  related_attack_patterns "_networkx_list_start"
  related_attack_patterns [
    capec_id "163"
    nature "CanPrecede"
  ]
  prerequisites "_networkx_list_start"
  prerequisites "An adversary requires some way of interacting with the system."
  skills_required "[]"
  resources_required "_networkx_list_start"
  resources_required "A tool, such as an Adversary in the Middle (CAPEC-94) Proxy or a fuzzer, that is capable of generating and injecting custom inputs to be used in the attack."
  consequences "_networkx_list_start"
  consequences [
    scope "_networkx_list_start"
    scope "Confidentiality"
    impact "Read Data"
  ]
  mitigations "Minimize error/response output to only what is necessary for functional use or corrective language."
  mitigations "Remove potentially sensitive information that is not necessary for the application's functionality."
  example_instances "[]"
  related_weaknesses "200"
  related_weaknesses "1243"
  matched_cwes "_networkx_list_start"
  matched_cwes "200"
  taxonomy_mappings "[]"
  execution_flow "[]"
  node [
    id 0
    label "require_some_way_of_interacting_with_the_system"
  ]
]
