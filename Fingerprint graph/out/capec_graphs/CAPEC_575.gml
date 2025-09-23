graph [
  directed 1
  capec_id "575"
  name "Account Footprinting"
  abstraction "Standard"
  status "Stable"
  description "An adversary exploits functionality meant to identify information about the domain accounts and their permissions on the target system to an authorized user. By knowing what accounts are registered on the target system, the adversary can inform further and more targeted malicious behavior. Example Windows commands which can acquire this information are: &#34;net user&#34; and &#34;dsquery&#34;."
  likelihood "Low"
  severity "Low"
  related_attack_patterns "_networkx_list_start"
  related_attack_patterns [
    capec_id "169"
    nature "ChildOf"
  ]
  prerequisites "_networkx_list_start"
  prerequisites "The adversary must have gained access to the target system via physical or logical means in order to carry out this attack."
  skills_required "[]"
  resources_required "[]"
  consequences [
    scope "_networkx_list_start"
    scope "Confidentiality"
    impact "Other"
  ]
  consequences [
    scope "Confidentiality"
    scope "Access Control"
    scope "Authorization"
    impact "Bypass Protection Mechanism"
  ]
  mitigations "_networkx_list_start"
  mitigations "Identify programs that may be used to acquire account information and block them by using a software restriction policy or tools that restrict program execution by uysing a process allowlist."
  example_instances "[]"
  related_weaknesses "_networkx_list_start"
  related_weaknesses "200"
  matched_cwes "_networkx_list_start"
  matched_cwes "200"
  taxonomy_mappings "_networkx_list_start"
  taxonomy_mappings [
    taxonomy_name "ATTACK"
    entry_id "1087"
    entry_name "Account Discovery"
  ]
  execution_flow "[]"
  node [
    id 0
    label "gain_access_to_the_target_system"
  ]
]
