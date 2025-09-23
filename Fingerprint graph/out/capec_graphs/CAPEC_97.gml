graph [
  directed 1
  capec_id "97"
  name "Cryptanalysis"
  abstraction "Standard"
  status "Draft"
  description "Cryptanalysis is a process of finding weaknesses in cryptographic algorithms and using these weaknesses to decipher the ciphertext without knowing the secret key (instance deduction). Sometimes the weakness is not in the cryptographic algorithm itself, but rather in how it is applied that makes cryptanalysis successful. An attacker may have other goals as well, such as: Total Break (finding the secret key), Global Deduction (finding a functionally equivalent algorithm for encryption and decryption that does not require knowledge of the secret key), Information Deduction (gaining some information about plaintexts or ciphertexts that was not previously known) and Distinguishing Algorithm (the attacker has the ability to distinguish the output of the encryption (ciphertext) from a random permutation of bits)."
  likelihood "Low"
  severity "Very High"
  related_attack_patterns [
    capec_id "192"
    nature "ChildOf"
  ]
  related_attack_patterns [
    capec_id "20"
    nature "CanPrecede"
  ]
  prerequisites "The target software utilizes some sort of cryptographic algorithm."
  prerequisites "An underlying weaknesses exists either in the cryptographic algorithm used or in the way that it was applied to a particular chunk of plaintext."
  prerequisites "The encryption algorithm is known to the attacker."
  prerequisites "An attacker has access to the ciphertext."
  skills_required "_networkx_list_start"
  skills_required [
    level "High"
    description "Cryptanalysis generally requires a very significant level of understanding of mathematics and computation."
  ]
  resources_required "_networkx_list_start"
  resources_required "Computing resource requirements will vary based on the complexity of a given cryptanalysis technique. Access to the encryption/decryption routines of the algorithm is also required."
  consequences "_networkx_list_start"
  consequences [
    scope "_networkx_list_start"
    scope "Confidentiality"
    impact "Read Data"
  ]
  mitigations "Use proven cryptographic algorithms with recommended key sizes."
  mitigations "Ensure that the algorithms are used properly. That means: 1. Not rolling out your own crypto; Use proven algorithms and implementations. 2. Choosing initialization vectors with sufficiently random numbers 3. Generating key material using good sources of randomness and avoiding known weak keys 4. Using proven protocols and their implementations. 5. Picking the most appropriate cryptographic algorithm for your usage context and data"
  example_instances "_networkx_list_start"
  example_instances "A very easy to understand example is a cryptanalysis technique called frequency analysis that can be successfully applied to the very basic classic encryption algorithms that performed mono-alphabetic substitution replacing each letter in the plaintext with its predetermined mapping letter from the same alphabet. This was considered an improvement over a more basic technique that would simply shift all of the letters of the plaintext by some constant number of positions and replace the original letters with the new letter with the resultant alphabet position. While mono-alphabetic substitution ciphers are resilient to blind brute force, they can be broken easily with nothing more than a pen and paper. Frequency analysis uses the fact that natural language is not random and mono-alphabetic substitution does not hide the statistical properties of the natural language. So if the letter &#34;E&#34; in an English language occurs with a certain known frequency (about 12.7%), whatever &#34;E&#34; was substituted with to get to the ciphertext, will occur with the similar frequency. Having this frequency information allows the cryptanalyst to quickly determine the substitutions and decipher the ciphertext. Frequency analysis techniques are not applicable to modern ciphers as they are all resilient to it (unless this is a very bad case of a homegrown encryption algorithm). This example is inapplicable to modern cryptographic ciphers but is here to illustrate a rudimentary example of cryptanalysis."
  related_weaknesses "327"
  related_weaknesses "1204"
  related_weaknesses "1240"
  related_weaknesses "1241"
  related_weaknesses "1279"
  matched_cwes "_networkx_list_start"
  matched_cwes "327"
  taxonomy_mappings "_networkx_list_start"
  taxonomy_mappings [
    taxonomy_name "OWASP Attacks"
    entry_id ""
    entry_name "Cryptanalysis"
  ]
  execution_flow [
    step "1"
    phase "Explore"
    description "An attacker discovers a weakness in the cryptographic algorithm or a weakness in how it was applied to a particular chunk of plaintext."
    techniques "[]"
  ]
  execution_flow [
    step "2"
    phase "Exploit"
    description "An attacker leverages the discovered weakness to decrypt, partially decrypt or infer some information about the contents of the encrypted message. All of that is done without knowing the secret key."
    techniques "[]"
  ]
  node [
    id 0
    label "discover_a_weakness_in_the_cryptographic_algorithm_or_a_weakness_in_how_it_was_applied_to_a_particular_chunk_of_plaintext"
  ]
  node [
    id 1
    label "leverage_some_other_weakness"
  ]
  node [
    id 2
    label "know_the_secret_key"
  ]
  node [
    id 3
    label "understand_example"
  ]
  node [
    id 4
    label "consider_this"
  ]
  node [
    id 5
    label "break_while_mono_alphabetic_substitution_ciphers_are_resilient_to_blind_brute_force"
  ]
  node [
    id 6
    label "hide_the_statistical_properties_of_the_natural_language"
  ]
  node [
    id 7
    label "allow_having"
  ]
  node [
    id 8
    label "illustrate_a_rudimentary_example_of_cryptanalysis"
  ]
  node [
    id 9
    label "utilize_some_sort_of_cryptographic_algorithm"
  ]
  node [
    id 10
    label "determine_the_ciphertext_and_the_encryption_algorithm"
  ]
  node [
    id 11
    label "have_access_to_the_ciphertext"
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
  edge [
    source 6
    target 7
  ]
  edge [
    source 7
    target 8
  ]
  edge [
    source 8
    target 9
  ]
  edge [
    source 9
    target 10
  ]
  edge [
    source 10
    target 11
  ]
]
