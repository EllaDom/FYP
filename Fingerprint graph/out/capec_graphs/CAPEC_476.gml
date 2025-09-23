graph [
  directed 1
  capec_id "476"
  name "Signature Spoofing by Misrepresentation"
  abstraction "Detailed"
  status "Draft"
  description "An attacker exploits a weakness in the parsing or display code of the recipient software to generate a data blob containing a supposedly valid signature, but the signer's identity is falsely represented, which can lead to the attacker manipulating the recipient software or its victim user to perform compromising actions."
  likelihood "Low"
  severity "High"
  related_attack_patterns "_networkx_list_start"
  related_attack_patterns [
    capec_id "473"
    nature "ChildOf"
  ]
  prerequisites "_networkx_list_start"
  prerequisites "Recipient is using signature verification software that does not clearly indicate potential homographs in the signer identity.Recipient is using signature verification software that contains a parsing vulnerability, or allows control characters in the signer identity field, such that a signature is mistakenly displayed as valid and from a known or authoritative signer."
  skills_required [
    level "High"
    description "Attacker needs to understand the layout and composition of data blobs used by the target application."
  ]
  skills_required [
    level "High"
    description "To discover a specific vulnerability, attacker needs to reverse engineer signature parsing, signature verification and signer representation code."
  ]
  skills_required [
    level "High"
    description "Attacker may be required to create malformed data blobs and know how to insert them in a location that the recipient will visit."
  ]
  resources_required "[]"
  consequences "[]"
  mitigations "_networkx_list_start"
  mitigations "Ensure the application is using parsing and data display techniques that will accurately display control characters, international symbols and markings, and ultimately recognize potential homograph attacks."
  example_instances "[]"
  related_weaknesses "_networkx_list_start"
  related_weaknesses "290"
  matched_cwes "_networkx_list_start"
  matched_cwes "290"
  taxonomy_mappings "[]"
  execution_flow "[]"
  node [
    id 0
    label "indicate_potential_homographs_in_the_signer_identity"
  ]
  node [
    id 1
    label "contain_a_parsing_vulnerability"
  ]
  edge [
    source 0
    target 1
  ]
]
