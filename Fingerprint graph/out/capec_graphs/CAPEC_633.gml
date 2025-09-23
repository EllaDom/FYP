graph [
  directed 1
  capec_id "633"
  name "Token Impersonation"
  abstraction "Detailed"
  status "Stable"
  description "An adversary exploits a weakness in authentication to create an access token (or equivalent) that impersonates a different entity, and then associates a process/thread to that that impersonated token. This action causes a downstream user to make a decision or take action that is based on the assumed identity, and not the response that blocks the adversary."
  likelihood ""
  severity "Medium"
  related_attack_patterns "_networkx_list_start"
  related_attack_patterns [
    capec_id "194"
    nature "ChildOf"
  ]
  prerequisites "_networkx_list_start"
  prerequisites "This pattern of attack is only applicable when a downstream user leverages tokens to verify identity, and then takes action based on that identity."
  skills_required "[]"
  resources_required "[]"
  consequences [
    scope "_networkx_list_start"
    scope "Integrity"
    impact "Alter Execution Logic"
  ]
  consequences [
    scope "_networkx_list_start"
    scope "Integrity"
    impact "Gain Privileges"
  ]
  consequences [
    scope "_networkx_list_start"
    scope "Integrity"
    impact "Hide Activities"
  ]
  mitigations "[]"
  example_instances "[]"
  related_weaknesses "287"
  related_weaknesses "1270"
  matched_cwes "_networkx_list_start"
  matched_cwes "287"
  taxonomy_mappings "_networkx_list_start"
  taxonomy_mappings [
    taxonomy_name "ATTACK"
    entry_id "1134"
    entry_name "Access Token Manipulation"
  ]
  execution_flow "[]"
  node [
    id 0
    label "verify_identity"
  ]
]
