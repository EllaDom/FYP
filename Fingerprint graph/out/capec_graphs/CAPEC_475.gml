graph [
  directed 1
  capec_id "475"
  name "Signature Spoofing by Improper Validation"
  abstraction "Detailed"
  status "Draft"
  description "An adversary exploits a cryptographic weakness in the signature verification algorithm implementation to generate a valid signature without knowing the key."
  likelihood "Low"
  severity "High"
  related_attack_patterns [
    capec_id "473"
    nature "ChildOf"
  ]
  related_attack_patterns [
    capec_id "542"
    nature "CanPrecede"
  ]
  prerequisites "_networkx_list_start"
  prerequisites "Recipient is using a weak cryptographic signature verification algorithm or a weak implementation of a cryptographic signature verification algorithm, or the configuration of the recipient's application accepts the use of keys generated using cryptographically weak signature verification algorithms."
  skills_required [
    level "High"
    description "Cryptanalysis of signature verification algorithm"
  ]
  skills_required [
    level "High"
    description "Reverse engineering and cryptanalysis of signature verification algorithm implementation"
  ]
  resources_required "[]"
  consequences "[]"
  mitigations "_networkx_list_start"
  mitigations "Use programs and products that contain cryptographic elements that have been thoroughly tested for flaws in the signature verification routines."
  example_instances "_networkx_list_start"
  example_instances "The Windows CryptoAPI (Crypt32.dll) was shown to be vulnerable to signature spoofing by failing to properly validate Elliptic Curve Cryptography (ECC) certificates. If the CryptoAPI's signature validator allows the specification of a nonstandard base point (G): &#34;An adversary can create a custom ECDSA certificate with an elliptic curve (ECC) signature that appears to match a known standard curve, like P-256 that includes a public key for an existing known trusted certificate authority, but which was in fact not signed by that certificate authority. Windows checks the public key and other curve parameters, but not the (bespoke adversary-supplied) base point generator (G) parameter constant which actually generated the curve&#34; [REF-562]. Exploiting this vulnerability allows the adversary to leverage a spoofed certificate to dupe trusted network connections and deliver/execute malicious code, while appearing as legitimately trusted entity [REF-563]. This ultimately tricks the victim into believing the malicious website or executable is legitimate and originates from a properly verified source. See also: CVE-2020-0601"
  related_weaknesses "347"
  related_weaknesses "327"
  related_weaknesses "295"
  matched_cwes "295"
  matched_cwes "347"
  matched_cwes "327"
  taxonomy_mappings "[]"
  execution_flow "[]"
  node [
    id 0
    label "show_the_windows_cryptoapi_crypt32_dll"
  ]
  node [
    id 1
    label "check_the_public_key_and_other_curve_parameters"
  ]
  node [
    id 2
    label "exploit_that"
  ]
  node [
    id 3
    label "trick_the_victim"
  ]
  node [
    id 4
    label "accept_the_use_of_keys_generated_using_cryptographically_weak_signature_verification_algorithms"
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
  edge [
    source 3
    target 4
  ]
]
