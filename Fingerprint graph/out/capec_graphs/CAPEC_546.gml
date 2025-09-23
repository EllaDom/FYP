graph [
  directed 1
  capec_id "546"
  name "Incomplete Data Deletion in a Multi-Tenant Environment"
  abstraction "Detailed"
  status "Draft"
  description "An adversary obtains unauthorized information due to insecure or incomplete data deletion in a multi-tenant environment. If a cloud provider fails to completely delete storage and data from former cloud tenants' systems/resources, once these resources are allocated to new, potentially malicious tenants, the latter can probe the provided resources for sensitive information still there."
  likelihood "Low"
  severity "Medium"
  related_attack_patterns "_networkx_list_start"
  related_attack_patterns [
    capec_id "545"
    nature "ChildOf"
  ]
  prerequisites "_networkx_list_start"
  prerequisites "The cloud provider must not assuredly delete part or all of the sensitive data for which they are responsible.The adversary must have the ability to interact with the system."
  skills_required "_networkx_list_start"
  skills_required [
    level "Low"
    description "The adversary requires the ability to traverse directory structure."
  ]
  resources_required "[]"
  consequences "_networkx_list_start"
  consequences [
    scope "_networkx_list_start"
    scope "Confidentiality"
    impact "Read Data"
  ]
  mitigations "Cloud providers should completely delete data to render it irrecoverable and inaccessible from any layer and component of infrastructure resources."
  mitigations "Deletion of data should be completed promptly when requested."
  example_instances "[]"
  related_weaknesses "284"
  related_weaknesses "1266"
  related_weaknesses "1272"
  matched_cwes "_networkx_list_start"
  matched_cwes "284"
  taxonomy_mappings "[]"
  execution_flow "[]"
]
