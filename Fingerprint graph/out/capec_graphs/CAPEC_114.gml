graph [
  directed 1
  capec_id "114"
  name "Authentication Abuse"
  abstraction "Meta"
  status "Draft"
  description "An attacker obtains unauthorized access to an application, service or device either through knowledge of the inherent weaknesses of an authentication mechanism, or by exploiting a flaw in the authentication scheme's implementation. In such an attack an authentication mechanism is functioning but a carefully controlled sequence of events causes the mechanism to grant access to the attacker."
  likelihood ""
  severity "Medium"
  related_attack_patterns "[]"
  prerequisites "_networkx_list_start"
  prerequisites "An authentication mechanism or subsystem implementing some form of authentication such as passwords, digest authentication, security certificates, etc. which is flawed in some way."
  skills_required "[]"
  resources_required "_networkx_list_start"
  resources_required "A client application, command-line access to a binary, or scripting language capable of interacting with the authentication mechanism."
  consequences "[]"
  mitigations "[]"
  example_instances "[]"
  related_weaknesses "287"
  related_weaknesses "1244"
  matched_cwes "_networkx_list_start"
  matched_cwes "287"
  taxonomy_mappings "_networkx_list_start"
  taxonomy_mappings [
    taxonomy_name "ATTACK"
    entry_id "1548"
    entry_name "Abuse Elevation Control Mechanism"
  ]
  execution_flow "[]"
  node [
    id 0
    label "implement_some_form_of_authentication_such_as_passwords_digest_authentication_security_certificates_etc"
  ]
]
