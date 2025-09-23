graph [
  directed 1
  capec_id "565"
  name "Password Spraying"
  abstraction "Detailed"
  status "Draft"
  description "&#10;            "
  likelihood "High"
  severity "High"
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
  prerequisites "The system/application uses one factor password based authentication."
  prerequisites "The system/application does not have a sound password policy that is being enforced."
  prerequisites "The system/application does not implement an effective password throttling mechanism."
  prerequisites "The adversary possesses a list of known user accounts on the target system/application."
  skills_required "_networkx_list_start"
  skills_required [
    level "Low"
    description "A Password Spraying attack is very straightforward. A variety of password cracking tools are widely available."
  ]
  resources_required "A machine with sufficient resources for the job (e.g. CPU, RAM, HD)."
  resources_required "Applicable password lists."
  resources_required "A password cracking tool or a custom script that leverages the password list to launch the attack."
  consequences [
    scope "Confidentiality"
    scope "Access Control"
    scope "Authentication"
    impact "Gain Privileges"
  ]
  consequences [
    scope "Confidentiality"
    scope "Authorization"
    impact "Read Data"
  ]
  consequences [
    scope "_networkx_list_start"
    scope "Integrity"
    impact "Modify Data"
  ]
  mitigations "Create a strong password policy and ensure that your system enforces this policy."
  mitigations "Implement an intelligent password throttling mechanism. Care must be taken to assure that these mechanisms do not excessively enable account lockout attacks such as CAPEC-2."
  mitigations "Leverage multi-factor authentication for all authentication services and prior to granting an entity access to the domain network."
  example_instances "A user selects the phrase &#34;Password123&#34; as their password, believing that it would be very difficult to guess. Password Spraying, leveraging a list of commonly used passwords, is used to crack this password and gain access to the account."
  example_instances "The Iranian hacker group APT33 (AKA Holmium, Refined Kitten, or Elfin) carried out numerous Password Spraying attacks in 2019. On average, APT33 targeted 2,000 organizations per month, with upwards of 10 million authentication attempts each day. The majority of these attacks targeted manufacturers, suppliers, or maintainers of industrial control system equipment."
  related_weaknesses "521"
  related_weaknesses "262"
  related_weaknesses "263"
  related_weaknesses "654"
  related_weaknesses "307"
  related_weaknesses "308"
  related_weaknesses "309"
  matched_cwes "307"
  matched_cwes "521"
  taxonomy_mappings "_networkx_list_start"
  taxonomy_mappings [
    taxonomy_name "ATTACK"
    entry_id "1110.003"
    entry_name "Brute Force:Password Spraying"
  ]
  execution_flow [
    step "1"
    phase "Explore"
    description "[Determine target's password policy] Determine the password policies of the target system/application."
    techniques "Determine minimum and maximum allowed password lengths."
    techniques "Determine format of allowed passwords (whether they are required or allowed to contain numbers, special characters, etc., or whether they are allowed to contain words from the dictionary)."
    techniques "Determine account lockout policy (a strict account lockout policy will prevent brute force attacks)."
  ]
  execution_flow [
    step "2"
    phase "Explore"
    description "[Select passwords] Pick the passwords to be used in the attack (e.g. commonly used passwords, passwords tailored to individual users, etc.)"
    techniques "Select passwords based on common use or a particular user's additional details."
    techniques "Select passwords based on the target's password complexity policies."
  ]
  execution_flow [
    step "3"
    phase "Exploit"
    description "[Brute force password] Given the finite space of possible passwords dictated by information determined in the previous steps, try each password for all known user accounts until the target grants access."
    techniques "Manually or automatically enter the first password for each known user account through the target's interface. In most systems, start with the shortest and simplest possible passwords, because most users tend to select such passwords if allowed to do so."
    techniques "Iterate through the remaining passwords for each known user account."
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
    label "pick_the_passwords_to_be_used_in_the_attack_e_g_commonly_used_passwords"
  ]
  node [
    id 4
    label "give_the_finite_space_of_possible_passwords_dictated_by_the_password_policy_determined_in_the_previous_step"
  ]
  node [
    id 5
    label "enter_the_first_password_for_each_known_user"
  ]
  node [
    id 6
    label "start_because_most_users_tend_to_select_such_passwords_if_allowed_to_do_so"
  ]
  node [
    id 7
    label "select_the_phrase_password123_as_their_password"
  ]
  node [
    id 8
    label "leverage_large_password_lists"
  ]
  node [
    id 9
    label "carry_numerous_password_spraying_attacks"
  ]
  node [
    id 10
    label "target_2_000_organizations_per_month"
  ]
  node [
    id 11
    label "enforce_that"
  ]
  node [
    id 12
    label "implement_an_effective_password_throttling_mechanism"
  ]
  node [
    id 13
    label "possess_a_list_of_known_user_accounts_and_corresponding_passwords_that_may_exist_on_the_target"
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
]
