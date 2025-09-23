graph [
  directed 1
  capec_id "616"
  name "Establish Rogue Location"
  abstraction "Standard"
  status "Stable"
  description "An adversary provides a malicious version of a resource at a location that is similar to the expected location of a legitimate resource. After establishing the rogue location, the adversary waits for a victim to visit the location and access the malicious resource."
  likelihood "Medium"
  severity "Medium"
  related_attack_patterns [
    capec_id "154"
    nature "ChildOf"
  ]
  related_attack_patterns [
    capec_id "691"
    nature "CanPrecede"
  ]
  prerequisites "_networkx_list_start"
  prerequisites "A resource is expected to available to the user."
  skills_required "_networkx_list_start"
  skills_required [
    level "Low"
    description "Adversaries can often purchase low-cost technology to implement rogue access points."
  ]
  resources_required "[]"
  consequences "_networkx_list_start"
  consequences [
    scope "Confidentiality"
    scope "Integrity"
    impact "Other"
  ]
  mitigations "[]"
  example_instances "[]"
  related_weaknesses "_networkx_list_start"
  related_weaknesses "200"
  matched_cwes "_networkx_list_start"
  matched_cwes "200"
  taxonomy_mappings "_networkx_list_start"
  taxonomy_mappings [
    taxonomy_name "ATTACK"
    entry_id "1036.005"
    entry_name "Masquerading: Match Legitimate Name or Location"
  ]
  execution_flow "[]"
  node [
    id 0
    label "expect_a_resource"
  ]
]
