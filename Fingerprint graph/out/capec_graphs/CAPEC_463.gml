graph [
  directed 1
  capec_id "463"
  name "Padding Oracle Crypto Attack"
  abstraction "Detailed"
  status "Draft"
  description "An adversary is able to efficiently decrypt data without knowing the decryption key if a target system leaks data on whether or not a padding error happened while decrypting the ciphertext. A target system that leaks this type of information becomes the padding oracle and an adversary is able to make use of that oracle to efficiently decrypt data without knowing the decryption key by issuing on average 128*b calls to the padding oracle (where b is the number of bytes in the ciphertext block). In addition to performing decryption, an adversary is also able to produce valid ciphertexts (i.e., perform encryption) by using the padding oracle, all without knowing the encryption key."
  likelihood ""
  severity "High"
  related_attack_patterns "_networkx_list_start"
  related_attack_patterns [
    capec_id "97"
    nature "ChildOf"
  ]
  prerequisites "The decryption routine does not properly authenticate the message / does not verify its integrity prior to performing the decryption operation"
  prerequisites "The target system leaks data (in some way) on whether a padding error has occurred when attempting to decrypt the ciphertext."
  prerequisites "The padding oracle remains available for enough time / for as many requests as needed for the adversary to decrypt the ciphertext."
  skills_required "[]"
  resources_required "_networkx_list_start"
  resources_required "Ability to detect instances where a target system is vulnerable to an oracle padding attack Sufficient cryptography knowledge and tools needed to take advantage of the presence of the padding oracle to perform decryption / encryption of data without a key"
  consequences "[]"
  mitigations "Design: Use a message authentication code (MAC) or another mechanism to perform verification of message authenticity / integrity prior to decryption"
  mitigations "Implementation: Do not leak information back to the user as to any cryptography (e.g., padding) encountered during decryption."
  example_instances "_networkx_list_start"
  example_instances "An adversary sends a request containing ciphertext to the target system. Due to the browser's same origin policy, the adversary is not able to see the response directly, but can use cross-domain information leak techniques to still get the information needed (i.e., information on whether or not a padding error has occurred). This can be done using &#34;img&#34; tag plus the onerror()/onload() events. The adversary's JavaScript can make web browsers to load an image on the target site, and know if the image is loaded or not. This is 1-bit information needed for the padding oracle attack to work: if the image is loaded, then it is valid padding, otherwise it is not."
  related_weaknesses "209"
  related_weaknesses "514"
  related_weaknesses "649"
  related_weaknesses "347"
  related_weaknesses "354"
  related_weaknesses "696"
  matched_cwes "209"
  matched_cwes "347"
  taxonomy_mappings "[]"
  execution_flow "[]"
  node [
    id 0
    label "send_a_request_containing_ciphertext_to_the_target_system"
  ]
  node [
    id 1
    label "read_the_response"
  ]
  node [
    id 2
    label "do_this"
  ]
  node [
    id 3
    label "authenticate_the_message"
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
