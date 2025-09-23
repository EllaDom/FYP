graph [
  directed 1
  capec_id "49"
  name "Password Brute Forcing"
  abstraction "Standard"
  status "Draft"
  description "An adversary tries every possible value for a password until they succeed. A brute force attack, if feasible computationally, will always be successful because it will essentially go through all possible passwords given the alphabet used (lower case letters, upper case letters, numbers, symbols, etc.) and the maximum length of the password."
  likelihood "Medium"
  severity "High"
  related_attack_patterns [
    capec_id "112"
    nature "ChildOf"
  ]
  related_attack_patterns [
    capec_id "600"
    nature "CanPrecede"
  ]
  related_attack_patterns [
    capec_id "151"
    nature "CanPrecede"
  ]
  related_attack_patterns [
    capec_id "560"
    nature "CanPrecede"
  ]
  related_attack_patterns [
    capec_id "561"
    nature "CanPrecede"
  ]
  related_attack_patterns [
    capec_id "653"
    nature "CanPrecede"
  ]
  prerequisites "An adversary needs to know a username to target."
  prerequisites "The system uses password based authentication as the one factor authentication mechanism."
  prerequisites "An application does not have a password throttling mechanism in place. A good password throttling mechanism will make it almost impossible computationally to brute force a password as it may either lock out the user after a certain number of incorrect attempts or introduce time out periods. Both of these would make a brute force attack impractical."
  skills_required "_networkx_list_start"
  skills_required [
    level "Low"
    description "A brute force attack is very straightforward. A variety of password cracking tools are widely available."
  ]
  resources_required "_networkx_list_start"
  resources_required "A powerful enough computer for the job with sufficient CPU, RAM and HD. Exact requirements will depend on the size of the brute force job and the time requirement for completion. Some brute forcing jobs may require grid or distributed computing (e.g. DES Challenge)."
  consequences [
    scope "Confidentiality"
    scope "Access Control"
    scope "Authorization"
    impact "Gain Privileges"
  ]
  consequences [
    scope "_networkx_list_start"
    scope "Confidentiality"
    impact "Read Data"
  ]
  consequences [
    scope "_networkx_list_start"
    scope "Integrity"
    impact "Modify Data"
  ]
  mitigations "Implement a password throttling mechanism. This mechanism should take into account both the IP address and the log in name of the user."
  mitigations "Put together a strong password policy and make sure that all user created passwords comply with it. Alternatively automatically generate strong passwords for users."
  mitigations "Passwords need to be recycled to prevent aging, that is every once in a while a new password must be chosen."
  example_instances "A system does not enforce a strong password policy and the user picks a five letter password consisting of lower case English letters only. The system does not implement any password throttling mechanism. Assuming the adversary does not know the length of the users' password, an adversary can brute force this password in maximum 1+26+26^2+26^3+26^4+26^5 = 1 + 26 + 676 + 17576 + 456976 + 11,881,376 = 12,356,631 attempts, and half these tries (6,178,316) on average. Using modern hardware this attack is trivial. If the adversary were to assume that the user password could also contain upper case letters (and it was case sensitive) and/or numbers, than the number of trials would have been larger. An adversary's job would have most likely been even easier because many users who choose easy to brute force passwords like this are also likely to use a word that can be found in the dictionary. Since there are far fewer valid English words containing up to five letters than 12,356,631, an attack that tries each of the entries in the English dictionary would go even faster."
  example_instances "A weakness exists in the automatic password generation routine of Mailman prior to 2.1.5 that causes only about five million different passwords to be generated. This makes it easy to brute force the password for all users who decided to let Mailman automatically generate their passwords for them. Users who chose their own passwords during the sign up process would not have been affected (assuming that they chose strong passwords). See also: CVE-2004-1143"
  related_weaknesses "521"
  related_weaknesses "262"
  related_weaknesses "263"
  related_weaknesses "257"
  related_weaknesses "654"
  related_weaknesses "307"
  related_weaknesses "308"
  related_weaknesses "309"
  matched_cwes "307"
  matched_cwes "521"
  matched_cwes "257"
  taxonomy_mappings "_networkx_list_start"
  taxonomy_mappings [
    taxonomy_name "ATTACK"
    entry_id "1110.001"
    entry_name "Brute Force:Password Guessing"
  ]
  execution_flow [
    step "1"
    phase "Explore"
    description "[Determine application's/system's password policy] Determine the password policies of the target application/system."
    techniques "Determine minimum and maximum allowed password lengths."
    techniques "Determine format of allowed passwords (whether they are required or allowed to contain numbers, special characters, etc.)."
    techniques "Determine account lockout policy (a strict account lockout policy will prevent brute force attacks)."
  ]
  execution_flow [
    step "2"
    phase "Exploit"
    description "[Brute force password] Given the finite space of possible passwords dictated by the password policy determined in the previous step, try all possible passwords for a known user ID until application/system grants access."
    techniques "Manually or automatically enter all possible passwords through the application/system's interface. In most systems, start with the shortest and simplest possible passwords, because most users tend to select such passwords if allowed to do so."
    techniques "Perform an offline dictionary attack or a rainbow table attack against a known password hash."
  ]
  node [
    id 0
    label "determine_the_password_policies_of_the_target_application_system"
  ]
  node [
    id 1
    label "determine_minimum_and_maximum_allowed_password_lengths"
  ]
  node [
    id 2
    label "determine_account"
  ]
  node [
    id 3
    label "give_the_finite_space_of_possible_passwords_dictated_by_the_password_policy_determined_in_the_previous_step"
  ]
  node [
    id 4
    label "enter_all_possible_passwords"
  ]
  node [
    id 5
    label "start_because_most_users_tend_to_select_such_passwords_if_allowed_to_do_so"
  ]
  node [
    id 6
    label "perform_an_offline_dictionary_attack_or_a_rainbow_table_attack_against_a_known_password_hash"
  ]
  node [
    id 7
    label "enforce_a_strong_password_policy"
  ]
  node [
    id 8
    label "implement_an_effective_password_throttling_mechanism"
  ]
  node [
    id 9
    label "allow_the_adversary"
  ]
  node [
    id 10
    label "use_modern_hardware"
  ]
  node [
    id 11
    label "choose_easy"
  ]
  node [
    id 12
    label "contain_up_to_five_letters_than_12_356_631"
  ]
  node [
    id 13
    label "choose_their_own_passwords"
  ]
  node [
    id 14
    label "need_to_know_a_username_to_target"
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
    target 8
  ]
]
