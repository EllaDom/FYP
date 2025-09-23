graph [
  directed 1
  capec_id "55"
  name "Rainbow Table Password Cracking"
  abstraction "Detailed"
  status "Draft"
  description "An attacker gets access to the database table where hashes of passwords are stored. They then use a rainbow table of pre-computed hash chains to attempt to look up the original password. Once the original password corresponding to the hash is obtained, the attacker uses the original password to gain access to the system."
  likelihood "Medium"
  severity "Medium"
  related_attack_patterns [
    capec_id "49"
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
  prerequisites "Hash of the original password is available to the attacker. For a better chance of success, an attacker should have more than one hash of the original password, and ideally the whole table."
  prerequisites "Salt was not used to create the hash of the original password. Otherwise the rainbow tables have to be re-computed, which is very expensive and will make the attack effectively infeasible (especially if salt was added in iterations)."
  prerequisites "The system uses one factor password based authentication."
  skills_required "_networkx_list_start"
  skills_required [
    level "Low"
    description "A variety of password cracking tools are available that can leverage a rainbow table. The more difficult part is to obtain the password hash(es) in the first place."
  ]
  resources_required "_networkx_list_start"
  resources_required "Rainbow table of password hash chains with the right algorithm used. A password cracking tool that leverages this rainbow table will also be required. Hash(es) of the password is required."
  consequences "_networkx_list_start"
  consequences [
    scope "Confidentiality"
    scope "Access Control"
    scope "Authorization"
    impact "Gain Privileges"
  ]
  mitigations "_networkx_list_start"
  mitigations "Use salt when computing password hashes. That is, concatenate the salt (random bits) with the original password prior to hashing it."
  example_instances "_networkx_list_start"
  example_instances "BusyBox 1.1.1 does not use a salt when generating passwords, which makes it easier for local users to guess passwords from a stolen password file using techniques such as rainbow tables. See also: CVE-2006-1058"
  related_weaknesses "261"
  related_weaknesses "521"
  related_weaknesses "262"
  related_weaknesses "263"
  related_weaknesses "654"
  related_weaknesses "916"
  related_weaknesses "308"
  related_weaknesses "309"
  matched_cwes "521"
  matched_cwes "916"
  taxonomy_mappings "_networkx_list_start"
  taxonomy_mappings [
    taxonomy_name "ATTACK"
    entry_id "1110.002"
    entry_name "Brute Force:Password Cracking"
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
    phase "Explore"
    description "[Obtain password hashes] An attacker gets access to the database table storing hashes of passwords or potentially just discovers a hash of an individual password."
    techniques "Obtain copy of database table or flat file containing password hashes (by breaking access controls, using SQL Injection, etc.)"
    techniques "Obtain password hashes from platform-specific storage locations (e.g. Windows registry)"
    techniques "Sniff network packets containing password hashes."
  ]
  execution_flow [
    step "3"
    phase "Exploit"
    description "[Run rainbow table-based password cracking tool] An attacker finds or writes a password cracking tool that uses a previously computed rainbow table for the right hashing algorithm. It helps if the attacker knows what hashing algorithm was used by the password system."
    techniques "_networkx_list_start"
    techniques "Run rainbow table-based password cracking tool such as Ophcrack or RainbowCrack. Reduction function must depend on application's/system's password policy."
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
    label "obtain_password_hashes"
  ]
  node [
    id 4
    label "get_access_to_the_database_table_storing_hashes_of_passwords_or"
  ]
  node [
    id 5
    label "obtain_copy_of_database_table_or_flat_file_containing_password_hashes"
  ]
  node [
    id 6
    label "run_rainbow_table_based_password_cracking_tool"
  ]
  node [
    id 7
    label "help_if_the_attacker_knows_what_hashing_algorithm_was_used_by_the_password_system"
  ]
  node [
    id 8
    label "generate_passwords_which_makes_it_easier_for_local_users_to_guess_passwords_from_a_stolen_password_file_using_techniques_such_as_rainbow_tables"
  ]
  node [
    id 9
    label "have_more_than_one_hash_of_the_original_password"
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
    source 3
    target 3
  ]
  edge [
    source 3
    target 6
  ]
  edge [
    source 4
    target 5
  ]
  edge [
    source 5
    target 3
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
    source 7
    target 6
  ]
  edge [
    source 8
    target 9
  ]
  edge [
    source 9
    target 9
  ]
]
