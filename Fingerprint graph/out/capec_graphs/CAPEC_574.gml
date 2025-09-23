graph [
  directed 1
  capec_id "574"
  name "Services Footprinting"
  abstraction "Standard"
  status "Stable"
  description "An adversary exploits functionality meant to identify information about the services on the target system to an authorized user. By knowing what services are registered on the target system, the adversary can learn about the target environment as a means towards further malicious behavior. Depending on the operating system, commands that can obtain services information include &#34;sc&#34; and &#34;tasklist/svc&#34; using Tasklist, and &#34;net start&#34; using Net."
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
  mitigations "Identify programs that may be used to acquire service information and block them by using a software restriction policy or tools that restrict program execution by uaing a process allowlist."
  example_instances "[]"
  related_weaknesses "_networkx_list_start"
  related_weaknesses "200"
  matched_cwes "_networkx_list_start"
  matched_cwes "200"
  taxonomy_mappings "_networkx_list_start"
  taxonomy_mappings [
    taxonomy_name "ATTACK"
    entry_id "1007"
    entry_name "System Service Discovery"
  ]
  execution_flow "[]"
  node [
    id 0
    label "gain_access_to_the_target_system"
  ]
]
