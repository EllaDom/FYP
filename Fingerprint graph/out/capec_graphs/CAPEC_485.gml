graph [
  directed 1
  capec_id "485"
  name "Signature Spoofing by Key Recreation"
  abstraction "Detailed"
  status "Draft"
  description "An attacker obtains an authoritative or reputable signer's private signature key by exploiting a cryptographic weakness in the signature algorithm or pseudorandom number generation and then uses this key to forge signatures from the original signer to mislead a victim into performing actions that benefit the attacker."
  likelihood "Low"
  severity "High"
  related_attack_patterns "_networkx_list_start"
  related_attack_patterns [
    capec_id "473"
    nature "ChildOf"
  ]
  prerequisites "An authoritative signer is using a weak method of random number generation or weak signing software that causes key leakage or permits key inference."
  prerequisites "An authoritative signer is using a signature algorithm with a direct weakness or with poorly chosen parameters that enable the key to be recovered using signatures from that signer."
  skills_required [
    level "High"
    description "Cryptanalysis of signature generation algorithm"
  ]
  skills_required [
    level "High"
    description "Reverse engineering and cryptanalysis of signature generation algorithm implementation and random number generation"
  ]
  skills_required [
    level "High"
    description "Ability to create malformed data blobs and know how to present them directly or indirectly to a victim."
  ]
  resources_required "[]"
  consequences "[]"
  mitigations "_networkx_list_start"
  mitigations "Ensure cryptographic elements have been sufficiently tested for weaknesses."
  example_instances "[]"
  related_weaknesses "_networkx_list_start"
  related_weaknesses "330"
  matched_cwes "_networkx_list_start"
  matched_cwes "330"
  taxonomy_mappings "_networkx_list_start"
  taxonomy_mappings [
    taxonomy_name "ATTACK"
    entry_id "1552.004"
    entry_name "Unsecure Credentials: Private Keys"
  ]
  execution_flow "[]"
  node [
    id 0
    label "cause_key_leakage"
  ]
]
