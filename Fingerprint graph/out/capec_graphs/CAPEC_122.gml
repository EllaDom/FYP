graph [
  directed 1
  capec_id "122"
  name "Privilege Abuse"
  abstraction "Meta"
  status "Draft"
  description "An adversary is able to exploit features of the target that should be reserved for privileged users or administrators but are exposed to use by lower or non-privileged accounts. Access to sensitive information and functionality must be controlled to ensure that only authorized users are able to access these resources."
  likelihood "High"
  severity "Medium"
  related_attack_patterns "_networkx_list_start"
  related_attack_patterns [
    capec_id "664"
    nature "CanPrecede"
  ]
  prerequisites "The target must have misconfigured their access control mechanisms such that sensitive information, which should only be accessible to more trusted users, remains accessible to less trusted users."
  prerequisites "The adversary must have access to the target, albeit with an account that is less privileged than would be appropriate for the targeted resources."
  skills_required "_networkx_list_start"
  skills_required [
    level "Low"
    description "Adversary can leverage privileged features they already have access to without additional effort or skill. Adversary is only required to have access to an account with improper priveleges."
  ]
  resources_required "_networkx_list_start"
  resources_required "None: No specialized resources are required to execute this type of attack. The ability to access the target is required."
  consequences [
    scope "_networkx_list_start"
    scope "Integrity"
    impact "Modify Data"
  ]
  consequences [
    scope "_networkx_list_start"
    scope "Confidentiality"
    impact "Read Data"
  ]
  consequences [
    scope "_networkx_list_start"
    scope "Authorization"
    impact "Execute Unauthorized Commands"
  ]
  consequences [
    scope "_networkx_list_start"
    scope "Authorization"
    impact "Gain Privileges"
  ]
  consequences [
    scope "Access Control"
    scope "Authorization"
    impact "Bypass Protection Mechanism"
  ]
  mitigations "_networkx_list_start"
  mitigations "Configure account privileges such privileged/administrator functionality is not exposed to non-privileged/lower accounts."
  example_instances "_networkx_list_start"
  example_instances "Improperly configured account privileges allowed unauthorized users on a hospital's network to access the medical records for over 3,000 patients. Thus compromising data integrity and confidentiality in addition to HIPAA violations."
  related_weaknesses "269"
  related_weaknesses "732"
  related_weaknesses "1317"
  matched_cwes "269"
  matched_cwes "732"
  taxonomy_mappings "_networkx_list_start"
  taxonomy_mappings [
    taxonomy_name "ATTACK"
    entry_id "1548"
    entry_name "Abuse Elevation Control Mechanism"
  ]
  execution_flow "[]"
  node [
    id 0
    label "configure_account_privileges"
  ]
  node [
    id 1
    label "compromise_data_integrity_and_confidentiality"
  ]
  node [
    id 2
    label "misconfigure_their_access_control_mechanisms_such_that_sensitive_information_which_should_only_be_accessible_to_more_trusted_users"
  ]
  edge [
    source 0
    target 1
  ]
  edge [
    source 1
    target 2
  ]
]
