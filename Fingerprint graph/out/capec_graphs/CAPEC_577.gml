graph [
  directed 1
  capec_id "577"
  name "Owner Footprinting"
  abstraction "Standard"
  status "Draft"
  description "An adversary exploits functionality meant to identify information about the primary users on the target system to an authorized user. They may do this, for example, by reviewing logins or file modification times. By knowing what owners use the target system, the adversary can inform further and more targeted malicious behavior. An example Windows command that may accomplish this is &#34;dir /A ntuser.dat&#34;. Which will display the last modified time of a user's ntuser.dat file when run within the root folder of a user. This time is synonymous with the last time that user was logged in."
  likelihood "Low"
  severity "Low"
  related_attack_patterns "_networkx_list_start"
  related_attack_patterns [
    capec_id "169"
    nature "ChildOf"
  ]
  prerequisites "The adversary must have gained access to the target system via physical or logical means in order to carry out this attack."
  prerequisites "Administrator permissions are required to view the home folder of other users."
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
  mitigations "Ensure that proper permissions on files and folders are enacted to limit accessibility."
  example_instances "[]"
  related_weaknesses "_networkx_list_start"
  related_weaknesses "200"
  matched_cwes "_networkx_list_start"
  matched_cwes "200"
  taxonomy_mappings "_networkx_list_start"
  taxonomy_mappings [
    taxonomy_name "ATTACK"
    entry_id "1033"
    entry_name "System Owner/User Discovery"
  ]
  execution_flow "[]"
  node [
    id 0
    label "gain_access_to_the_target_system"
  ]
  node [
    id 1
    label "require_administrator_permissions"
  ]
  edge [
    source 0
    target 1
  ]
]
