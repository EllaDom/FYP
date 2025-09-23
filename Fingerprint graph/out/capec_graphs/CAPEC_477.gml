graph [
  directed 1
  capec_id "477"
  name "Signature Spoofing by Mixing Signed and Unsigned Content"
  abstraction "Detailed"
  status "Draft"
  description "An attacker exploits the underlying complexity of a data structure that allows for both signed and unsigned content, to cause unsigned data to be processed as though it were signed data."
  likelihood "Low"
  severity "High"
  related_attack_patterns "_networkx_list_start"
  related_attack_patterns [
    capec_id "473"
    nature "ChildOf"
  ]
  prerequisites "Signer and recipient are using complex data storage structures that allow for a mix between signed and unsigned data"
  prerequisites "Recipient is using signature verification software that does not maintain separation between signed and unsigned data once the signature has been verified."
  skills_required [
    level "High"
    description "The attacker may need to continuously monitor a stream of signed data, waiting for an exploitable message to appear."
  ]
  skills_required [
    level "High"
    description "Attacker must be able to create malformed data blobs and know how to insert them in a location that the recipient will visit."
  ]
  resources_required "[]"
  consequences "[]"
  mitigations "_networkx_list_start"
  mitigations "Ensure the application is fully patched and does not allow the processing of unsigned data as if it is signed data."
  example_instances "[]"
  related_weaknesses "693"
  related_weaknesses "311"
  related_weaknesses "319"
  matched_cwes "693"
  matched_cwes "311"
  matched_cwes "319"
  taxonomy_mappings "[]"
  execution_flow "[]"
  node [
    id 0
    label "maintain_separation_between_signed_and_unsigned_data"
  ]
]
