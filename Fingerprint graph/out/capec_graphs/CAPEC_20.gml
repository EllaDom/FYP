graph [
  directed 1
  capec_id "20"
  name "Encryption Brute Forcing"
  abstraction "Standard"
  status "Draft"
  description "An attacker, armed with the cipher text and the encryption algorithm used, performs an exhaustive (brute force) search on the key space to determine the key that decrypts the cipher text to obtain the plaintext."
  likelihood "Low"
  severity "Low"
  related_attack_patterns [
    capec_id "112"
    nature "ChildOf"
  ]
  related_attack_patterns [
    capec_id "668"
    nature "CanPrecede"
  ]
  prerequisites "Ciphertext is known."
  prerequisites "Encryption algorithm and key size are known."
  skills_required "_networkx_list_start"
  skills_required [
    level "Low"
    description "Brute forcing encryption does not require much skill."
  ]
  resources_required "_networkx_list_start"
  resources_required "A powerful enough computer for the job with sufficient CPU, RAM and HD. Exact requirements will depend on the size of the brute force job and the time requirement for completion. Some brute forcing jobs may require grid or distributed computing (e.g. DES Challenge). On average, for a binary key of size N, 2^(N/2) trials will be needed to find the key that would decrypt the ciphertext to obtain the original plaintext. Obviously as N gets large the brute force approach becomes infeasible."
  consequences "_networkx_list_start"
  consequences [
    scope "_networkx_list_start"
    scope "Confidentiality"
    impact "Read Data"
  ]
  mitigations "Use commonly accepted algorithms and recommended key sizes. The key size used will depend on how important it is to keep the data confidential and for how long."
  mitigations "In theory a brute force attack performing an exhaustive key space search will always succeed, so the goal is to have computational security. Moore's law needs to be taken into account that suggests that computing resources double every eighteen months."
  example_instances "_networkx_list_start"
  example_instances "In 1997 the original DES challenge used distributed net computing to brute force the encryption key and decrypt the ciphertext to obtain the original plaintext. Each machine was given its own section of the key space to cover. The ciphertext was decrypted in 96 days."
  related_weaknesses "326"
  related_weaknesses "327"
  related_weaknesses "693"
  related_weaknesses "1204"
  matched_cwes "693"
  matched_cwes "326"
  matched_cwes "327"
  taxonomy_mappings "[]"
  execution_flow [
    step "1"
    phase "Explore"
    description "Determine the ciphertext and the encryption algorithm."
    techniques "[]"
  ]
  execution_flow [
    step "2"
    phase "Experiment"
    description "Perform an exhaustive brute force search of the key space, producing candidate plaintexts and observing if they make sense."
    techniques "[]"
  ]
  node [
    id 0
    label "determine_the_ciphertext_and_the_encryption_algorithm"
  ]
  node [
    id 1
    label "perform_an_exhaustive_brute_force_search_of_the_key_space"
  ]
  node [
    id 2
    label "distribute_net_computing"
  ]
  node [
    id 3
    label "give_its_own_section_of_the_key_space_to_cover"
  ]
  node [
    id 4
    label "decrypt_the_ciphertext"
  ]
  node [
    id 5
    label "know_ciphertext"
  ]
  node [
    id 6
    label "know_encryption_algorithm_and_key_size"
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
  edge [
    source 4
    target 5
  ]
  edge [
    source 5
    target 6
  ]
]
