graph [
  directed 1
  capec_id "474"
  name "Signature Spoofing by Key Theft"
  abstraction "Detailed"
  status "Draft"
  description "An attacker obtains an authoritative or reputable signer's private signature key by theft and then uses this key to forge signatures from the original signer to mislead a victim into performing actions that benefit the attacker."
  likelihood "Medium"
  severity "High"
  related_attack_patterns "_networkx_list_start"
  related_attack_patterns [
    capec_id "473"
    nature "ChildOf"
  ]
  prerequisites "_networkx_list_start"
  prerequisites "An authoritative or reputable signer is storing their private signature key with insufficient protection."
  skills_required [
    level "Low"
    description "Knowledge of common location methods and access methods to sensitive data"
  ]
  skills_required [
    level "High"
    description "Ability to compromise systems containing sensitive data"
  ]
  resources_required "[]"
  consequences "[]"
  mitigations "Restrict access to private keys from non-supervisory accounts"
  mitigations "Restrict access to administrative personnel and processes only"
  mitigations "Ensure all remote methods are secured"
  mitigations "Ensure all services are patched and up to date"
  example_instances "[]"
  related_weaknesses "_networkx_list_start"
  related_weaknesses "522"
  matched_cwes "_networkx_list_start"
  matched_cwes "522"
  taxonomy_mappings "_networkx_list_start"
  taxonomy_mappings [
    taxonomy_name "ATTACK"
    entry_id "1552.004"
    entry_name "Unsecured Credentials: Private Keys"
  ]
  execution_flow "[]"
  node [
    id 0
    label "store_their_private_signature_key_with_insufficient_protection"
  ]
]
