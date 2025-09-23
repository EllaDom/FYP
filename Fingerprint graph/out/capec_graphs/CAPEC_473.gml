graph [
  directed 1
  capec_id "473"
  name "Signature Spoof"
  abstraction "Standard"
  status "Draft"
  description "An attacker generates a message or datablock that causes the recipient to believe that the message or datablock was generated and cryptographically signed by an authoritative or reputable source, misleading a victim or victim operating system into performing malicious actions."
  likelihood ""
  severity ""
  related_attack_patterns "_networkx_list_start"
  related_attack_patterns [
    capec_id "151"
    nature "ChildOf"
  ]
  prerequisites "The victim or victim system is dependent upon a cryptographic signature-based verification system for validation of one or more security events or actions."
  prerequisites "The validation can be bypassed via an attacker-provided signature that makes it appear that the legitimate authoritative or reputable source provided the signature."
  skills_required "_networkx_list_start"
  skills_required [
    level "High"
    description "Technical understanding of how signature verification algorithms work with data and applications"
  ]
  resources_required "[]"
  consequences "_networkx_list_start"
  consequences [
    scope "Access Control"
    scope "Authentication"
    impact "Gain Privileges"
  ]
  mitigations "[]"
  example_instances "An attacker provides a victim with a malicious executable disguised as a legitimate executable from an established software by signing the executable with a forged cryptographic key. The victim's operating system attempts to verify the executable by checking the signature, the signature is considered valid, and the attackers' malicious executable runs."
  example_instances "An attacker exploits weaknesses in a cryptographic algorithm to that allow a private key for a legitimate software vendor to be reconstructed, attacker-created malicious software is cryptographically signed with the reconstructed key, and is installed by the victim operating system disguised as a legitimate software update from the software vendor."
  related_weaknesses "20"
  related_weaknesses "327"
  related_weaknesses "290"
  matched_cwes "20"
  matched_cwes "327"
  matched_cwes "290"
  taxonomy_mappings [
    taxonomy_name "ATTACK"
    entry_id "1036.001"
    entry_name "Masquerading: Invalid Code Signature"
  ]
  taxonomy_mappings [
    taxonomy_name "ATTACK"
    entry_id "1553.002"
    entry_name "Subvert Trust Controls: Code Signing"
  ]
  execution_flow "[]"
  node [
    id 0
    label "provide_a_victim"
  ]
  node [
    id 1
    label "attempt_to_verify_the_executable_by_checking_the_signature"
  ]
  node [
    id 2
    label "verify_the_exploitable_security_weaknesses"
  ]
  node [
    id 3
    label "bypass_input_validation"
  ]
  edge [
    source 0
    target 1
  ]
  edge [
    source 1
    target 2
  ]
  edge [
    source 2
    target 3
  ]
]
