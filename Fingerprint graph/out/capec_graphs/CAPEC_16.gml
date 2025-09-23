graph [
  directed 1
  capec_id "16"
  name "Dictionary-based Password Attack"
  abstraction "Detailed"
  status "Draft"
  description "&#10;            "
  likelihood "Medium"
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
  prerequisites "The system uses one factor password based authentication."
  prerequisites "The system does not have a sound password policy that is being enforced."
  prerequisites "The system does not implement an effective password throttling mechanism."
  skills_required "_networkx_list_start"
  skills_required [
    level "Low"
    description "A variety of password cracking tools and dictionaries are available to launch this type of an attack."
  ]
  resources_required "_networkx_list_start"
  resources_required "A machine with sufficient resources for the job (e.g. CPU, RAM, HD). Applicable dictionaries are required. Also a password cracking tool or a custom script that leverages the dictionary database to launch the attack."
  consequences [
    scope "Confidentiality"
    scope "Access Control"
    scope "Authentication"
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
  mitigations "Create a strong password policy and ensure that your system enforces this policy."
  mitigations "Implement an intelligent password throttling mechanism. Care must be taken to assure that these mechanisms do not excessively enable account lockout attacks such as CAPEC-2."
  mitigations "Leverage multi-factor authentication for all authentication services."
  example_instances "A system user selects the word &#34;treacherous&#34; as their passwords believing that it would be very difficult to guess. The password-based dictionary attack is used to crack this password and gain access to the account."
  example_instances "The Cisco LEAP challenge/response authentication mechanism uses passwords in a way that is susceptible to dictionary attacks, which makes it easier for remote attackers to gain privileges via brute force password guessing attacks. Cisco LEAP is a mutual authentication algorithm that supports dynamic derivation of session keys. With Cisco LEAP, mutual authentication relies on a shared secret, the user's logon password (which is known by the client and the network), and is used to respond to challenges between the user and the Remote Authentication Dial-In User Service (RADIUS) server. Methods exist for someone to write a tool to launch an offline dictionary attack on password-based authentications that leverage Microsoft MS-CHAP, such as Cisco LEAP. The tool leverages large password lists to efficiently launch offline dictionary attacks against LEAP user accounts, collected through passive sniffing or active techniques. See also: CVE-2003-1096"
  related_weaknesses "521"
  related_weaknesses "262"
  related_weaknesses "263"
  related_weaknesses "654"
  related_weaknesses "307"
  related_weaknesses "308"
  related_weaknesses "309"
  matched_cwes "307"
  matched_cwes "521"
  taxonomy_mappings "[]"
  execution_flow [
    step "1"
    phase "Explore"
    description "[Determine application's/system's password policy] Determine the password policies of the target application/system."
    techniques "Determine minimum and maximum allowed password lengths."
    techniques "Determine format of allowed passwords (whether they are required or allowed to contain numbers, special characters, etc., or whether they are allowed to contain words from the dictionary)."
    techniques "Determine account lockout policy (a strict account lockout policy will prevent brute force attacks)."
  ]
  execution_flow [
    step "2"
    phase "Explore"
    description "[Select dictionaries] Pick the dictionaries to be used in the attack (e.g. different languages, specific terminology, etc.)"
    techniques "Select dictionary based on particular users' preferred languages."
    techniques "Select dictionary based on the application/system's supported languages."
  ]
  execution_flow [
    step "3"
    phase "Explore"
    description "[Determine username(s) to target] Determine username(s) whose passwords to crack."
    techniques "Obtain username(s) by sniffing network packets."
    techniques "Obtain username(s) by querying application/system (e.g. if upon a failed login attempt, the system indicates whether the entered username was valid or not)"
    techniques "Obtain usernames from filesystem (e.g. list of directories in C:\Documents and Settings\ in Windows, and list in /etc/passwd in UNIX-like systems)"
  ]
  execution_flow [
    step "4"
    phase "Exploit"
    description "[Use dictionary to crack passwords.] Use a password cracking tool that will leverage the dictionary to feed passwords to the system and see if they work."
    techniques "Try all words in the dictionary, as well as common misspellings of the words as passwords for the chosen username(s)."
    techniques "Try common combinations of words in the dictionary, as well as common misspellings of the combinations as passwords for the chosen username(s)."
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
    label "pick_the_dictionaries_to_be_used_in_the_attack_e_g_different_languages_specific_terminology_etc"
  ]
  node [
    id 4
    label "crack_whose_passwords"
  ]
  node [
    id 5
    label "obtain_usernames_from_filesystem_e_g_list_of_directories_in_c_documents_and_settings_in_windows_and_list_in_etc_passwd_in_unix_like_systems"
  ]
  node [
    id 6
    label "try_all_words_in_the_dictionary_as_well_as_common_misspellings_of_the_words_as_passwords_for_the_chosen_username_s"
  ]
  node [
    id 7
    label "try_common_combinations_of_words_in_the_dictionary"
  ]
  node [
    id 8
    label "select_the_word_treacherous"
  ]
  node [
    id 9
    label "support_dynamic_derivation_of_session_keys"
  ]
  node [
    id 10
    label "rely_the_user_s_logon_password_which_is_known_by_the_client_and_the_network"
  ]
  node [
    id 11
    label "exist_for_someone_to_write_a_tool_to_launch_an_offline_dictionary_attack_on_password_based_authentications_that_leverage_microsoft_ms_chap_such_as_cisco_leap"
  ]
  node [
    id 12
    label "leverage_large_password_lists"
  ]
  node [
    id 13
    label "see_1096"
  ]
  node [
    id 14
    label "enforce_that"
  ]
  node [
    id 15
    label "implement_an_effective_password_throttling_mechanism"
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
    source 4
    target 6
  ]
  edge [
    source 5
    target 4
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
    target 15
  ]
]
