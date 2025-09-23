graph [
  directed 1
  capec_id "112"
  name "Brute Force"
  abstraction "Meta"
  status "Draft"
  description "In this attack, some asset (information, functionality, identity, etc.) is protected by a finite secret value. The attacker attempts to gain access to this asset by using trial-and-error to exhaustively explore all the possible secret values in the hope of finding the secret (or a value that is functionally equivalent) that will unlock the asset."
  likelihood ""
  severity "High"
  related_attack_patterns "[]"
  prerequisites "_networkx_list_start"
  prerequisites "The attacker must be able to determine when they have successfully guessed the secret. As such, one-time pads are immune to this type of attack since there is no way to determine when a guess is correct."
  skills_required "_networkx_list_start"
  skills_required [
    level "Low"
    description "The attack simply requires basic scripting ability to automate the exploration of the search space. More sophisticated attackers may be able to use more advanced methods to reduce the search space and increase the speed with which the secret is located."
  ]
  resources_required "_networkx_list_start"
  resources_required "None: No specialized resources are required to execute this type of attack. Ultimately, the speed with which an attacker discovers a secret is directly proportional to the computational resources the attacker has at their disposal. This attack method is resource expensive: having large amounts of computational power do not guarantee timely success, but having only minimal resources makes the problem intractable against all but the weakest secret selection procedures."
  consequences [
    scope "_networkx_list_start"
    scope "Confidentiality"
    impact "Read Data"
  ]
  consequences [
    scope "Confidentiality"
    scope "Access Control"
    scope "Authorization"
    impact "Gain Privileges"
  ]
  mitigations "Select a provably large secret space for selection of the secret. Provably large means that the procedure by which the secret is selected does not have artifacts that significantly reduce the size of the total secret space."
  mitigations "Use a secret space that is well known and with no known patterns that may reduce functional size."
  mitigations "Do not provide the means for an attacker to determine success independently. This forces the attacker to check their guesses against an external authority, which can slow the attack and warn the defender. This mitigation may not be possible if testing material must appear externally, such as with a transmitted cryptotext."
  example_instances "[]"
  related_weaknesses "330"
  related_weaknesses "326"
  related_weaknesses "521"
  matched_cwes "330"
  matched_cwes "326"
  matched_cwes "521"
  taxonomy_mappings [
    taxonomy_name "ATTACK"
    entry_id "1110"
    entry_name "Brute Force"
  ]
  taxonomy_mappings [
    taxonomy_name "WASC"
    entry_id "11"
    entry_name "Brute Force"
  ]
  taxonomy_mappings [
    taxonomy_name "OWASP Attacks"
    entry_id ""
    entry_name "Brute force attack"
  ]
  execution_flow [
    step "1"
    phase "Explore"
    description "[Determine secret testing procedure] Determine how a potential guess of the secret may be tested. This may be accomplished by comparing some manipulation of the secret to a known value, use of the secret to manipulate some known set of data and determining if the result displays specific characteristics (for example, turning cryptotext into plaintext), or by submitting the secret to some external authority and having the external authority respond as to whether the value was the correct secret. Ideally, the attacker will want to determine the correctness of their guess independently since involvement of an external authority is usually slower and can provide an indication to the defender that a brute-force attack is being attempted."
    techniques "_networkx_list_start"
    techniques "Determine if there is a way to parallelize the attack. Most brute force attacks can take advantage of parallel techniques by dividing the search space among available resources, thus dividing the average time to success by the number of resources available. If there is a single choke point, such as a need to check answers with an external authority, the attackers' position is significantly degraded."
  ]
  execution_flow [
    step "2"
    phase "Explore"
    description "[Reduce search space] Find ways to reduce the secret space. The smaller the attacker can make the space they need to search for the secret value, the greater their chances for success. There are a great many ways in which the search space may be reduced."
    techniques "If possible, determine how the secret was selected. If the secret was determined algorithmically (such as by a random number generator) the algorithm may have patterns or dependencies that reduce the size of the secret space. If the secret was created by a human, behavioral factors may, if not completely reduce the space, make some types of secrets more likely than others. (For example, humans may use the same secrets in multiple places or use secrets that look or sound familiar for ease of recall.)"
    techniques "If the secret was chosen algorithmically, cryptanalysis can be applied to the algorithm to discover patterns in this algorithm. (This is true even if the secret is not used in cryptography.) Periodicity, the need for seed values, or weaknesses in the generator all can result in a significantly smaller secret space."
    techniques "If the secret was chosen by a person, social engineering and simple espionage can indicate patterns in their secret selection. If old secrets can be learned (and a target may feel they have little need to protect a secret that has been replaced) hints as to their selection preferences can be gleaned. These can include character substitutions a target employs, patterns in sources (dates, famous phrases, music lyrics, family members, etc.). Once these patterns have been determined, the initial efforts of a brute-force attack can focus on these areas."
    techniques "Some algorithmic techniques for secret selection may leave indicators that can be tested for relatively easily and which could then be used to eliminate large areas of the search space for consideration. For example, it may be possible to determine that a secret does or does not start with a given character after a relatively small number of tests. Alternatively, it might be possible to discover the length of the secret relatively easily. These discoveries would significantly reduce the search space, thus increasing speed with which the attacker discovers the secret."
  ]
  execution_flow [
    step "3"
    phase "Explore"
    description "[Expand victory conditions] It is sometimes possible to expand victory conditions. For example, the attacker might not need to know the exact secret but simply needs a value that produces the same result using a one-way function. While doing this does not reduce the size of the search space, the presence of multiple victory conditions does reduce the likely amount of time that the attacker will need to explore the space before finding a workable value."
    techniques "[]"
  ]
  execution_flow [
    step "4"
    phase "Exploit"
    description "[Gather information so attack can be performed independently.] If possible, gather the necessary information so a successful search can be determined without consultation of an external authority. This can be accomplished by capturing cryptotext (if the goal is decoding the text) or the encrypted password dictionary (if the goal is learning passwords)."
    techniques "[]"
  ]
  node [
    id 0
    label "determine_secret_testing_procedure"
  ]
  node [
    id 1
    label "accomplish_this_use_of_the_secret_to_manipulate_some_known_set_of_data_and_determining"
  ]
  node [
    id 2
    label "want_to_determine_the_correctness_of_their_guess_independently_since_involvement_of_an_external_authority"
  ]
  node [
    id 3
    label "determine_if_there_is_a_way_to_parallelize_the_attack"
  ]
  node [
    id 4
    label "take_advantage"
  ]
  node [
    id 5
    label "check_answers"
  ]
  node [
    id 6
    label "reduce_the_search_space"
  ]
  node [
    id 7
    label "make_the_space_they_need_to_search_for_the_secret_value"
  ]
  node [
    id 8
    label "determine_if_possible"
  ]
  node [
    id 9
    label "determine_the_secret"
  ]
  node [
    id 10
    label "reduce_the_size_of_the_secret_space"
  ]
  node [
    id 11
    label "choose_the_secret"
  ]
  node [
    id 12
    label "learn_old_secrets"
  ]
  node [
    id 13
    label "include_character_substitutions"
  ]
  node [
    id 14
    label "determine_these_patterns"
  ]
  node [
    id 15
    label "leave_indicators_that_can_be_tested_for_relatively_easily"
  ]
  node [
    id 16
    label "perform_gather_information_so_attack"
  ]
  node [
    id 17
    label "gather_the_necessary_information"
  ]
  node [
    id 18
    label "achieve_this"
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
    source 6
    target 8
  ]
  edge [
    source 6
    target 9
  ]
  edge [
    source 6
    target 16
  ]
  edge [
    source 7
    target 6
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
    source 9
    target 6
  ]
  edge [
    source 10
    target 11
  ]
  edge [
    source 11
    target 11
  ]
  edge [
    source 11
    target 12
  ]
  edge [
    source 12
    target 13
  ]
  edge [
    source 13
    target 14
  ]
  edge [
    source 14
    target 15
  ]
  edge [
    source 15
    target 9
  ]
  edge [
    source 16
    target 17
  ]
  edge [
    source 17
    target 18
  ]
]
