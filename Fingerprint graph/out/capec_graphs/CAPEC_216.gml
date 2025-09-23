graph [
  directed 1
  capec_id "216"
  name "Communication Channel Manipulation"
  abstraction "Meta"
  status "Stable"
  description "An adversary manipulates a setting or parameter on communications channel in order to compromise its security. This can result in information exposure, insertion/removal of information from the communications stream, and/or potentially system compromise."
  likelihood ""
  severity ""
  related_attack_patterns "_networkx_list_start"
  related_attack_patterns [
    capec_id "94"
    nature "CanPrecede"
  ]
  prerequisites "The target application must leverage an open communications channel."
  prerequisites "The channel on which the target communicates must be vulnerable to interception (e.g., adversary in the middle attack - CAPEC-94)."
  skills_required "[]"
  resources_required "_networkx_list_start"
  resources_required "A tool that is capable of viewing network traffic and generating custom inputs to be used in the attack."
  consequences [
    scope "_networkx_list_start"
    scope "Integrity"
    impact "Read Data"
  ]
  consequences [
    scope "_networkx_list_start"
    scope "Confidentiality"
    impact "Read Data"
  ]
  mitigations "Encrypt all sensitive communications using properly-configured cryptography."
  mitigations "Design the communication system such that it associates proper authentication/authorization with each channel/message."
  example_instances "[]"
  related_weaknesses "_networkx_list_start"
  related_weaknesses "306"
  matched_cwes "_networkx_list_start"
  matched_cwes "306"
  taxonomy_mappings "[]"
  execution_flow "[]"
  node [
    id 0
    label "leverage_an_open_communications_channel"
  ]
]
