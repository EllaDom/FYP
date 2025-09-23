graph [
  directed 1
  capec_id "59"
  name "Session Credential Falsification through Prediction"
  abstraction "Detailed"
  status "Draft"
  description "This attack targets predictable session ID in order to gain privileges. The attacker can predict the session ID used during a transaction to perform spoofing and session hijacking."
  likelihood "High"
  severity "High"
  related_attack_patterns "_networkx_list_start"
  related_attack_patterns [
    capec_id "196"
    nature "ChildOf"
  ]
  prerequisites "The target host uses session IDs to keep track of the users."
  prerequisites "Session IDs are used to control access to resources."
  prerequisites "The session IDs used by the target host are predictable. For example, the session IDs are generated using predictable information (e.g., time)."
  skills_required [
    level "Low"
    description "There are tools to brute force session ID. Those tools require a low level of knowledge."
  ]
  skills_required [
    level "Medium"
    description "Predicting Session ID may require more computation work which uses advanced analysis such as statistical analysis."
  ]
  resources_required "[]"
  consequences "_networkx_list_start"
  consequences [
    scope "Confidentiality"
    scope "Access Control"
    scope "Authorization"
    impact "Gain Privileges"
  ]
  mitigations "Use a strong source of randomness to generate a session ID."
  mitigations "Use adequate length session IDs"
  mitigations "Do not use information available to the user in order to generate session ID (e.g., time)."
  mitigations "Ideas for creating random numbers are offered by Eastlake [RFC1750]"
  mitigations "Encrypt the session ID if you expose it to the user. For instance session ID can be stored in a cookie in encrypted format."
  example_instances "Jetty before 4.2.27, 5.1 before 5.1.12, 6.0 before 6.0.2, and 6.1 before 6.1.0pre3 generates predictable session identifiers using java.util.random, which makes it easier for remote attackers to guess a session identifier through brute force attacks, bypass authentication requirements, and possibly conduct cross-site request forgery attacks. See also: CVE-2006-6969"
  example_instances "mod_usertrack in Apache 1.3.11 through 1.3.20 generates session ID's using predictable information including host IP address, system time and server process ID, which allows local users to obtain session ID's and bypass authentication when these session ID's are used for authentication. See also: CVE-2001-1534"
  related_weaknesses "290"
  related_weaknesses "330"
  related_weaknesses "331"
  related_weaknesses "346"
  related_weaknesses "488"
  related_weaknesses "539"
  related_weaknesses "200"
  related_weaknesses "6"
  related_weaknesses "285"
  related_weaknesses "384"
  related_weaknesses "693"
  matched_cwes "290"
  matched_cwes "330"
  matched_cwes "693"
  matched_cwes "285"
  matched_cwes "200"
  matched_cwes "384"
  matched_cwes "331"
  taxonomy_mappings [
    taxonomy_name "WASC"
    entry_id "18"
    entry_name "Credential/Session Prediction"
  ]
  taxonomy_mappings [
    taxonomy_name "OWASP Attacks"
    entry_id ""
    entry_name "Session Prediction"
  ]
  execution_flow [
    step "1"
    phase "Explore"
    description "[Find Session IDs] The attacker interacts with the target host and finds that session IDs are used to authenticate users."
    techniques "An attacker makes many anonymous connections and records the session IDs assigned."
    techniques "An attacker makes authorized connections and records the session tokens or credentials issued."
  ]
  execution_flow [
    step "2"
    phase "Explore"
    description "[Characterize IDs] The attacker studies the characteristics of the session ID (size, format, etc.). As a results the attacker finds that legitimate session IDs are predictable."
    techniques "Cryptanalysis. The attacker uses cryptanalysis to determine if the session IDs contain any cryptographic protections."
    techniques "Pattern tests. The attacker looks for patterns (odd/even, repetition, multiples, or other arithmetic relationships) between IDs"
    techniques "Comparison against time. The attacker plots or compares the issued IDs to the time they were issued to check for correlation."
  ]
  execution_flow [
    step "3"
    phase "Experiment"
    description "[Match issued IDs] The attacker brute forces different values of session ID and manages to predict a valid session ID."
    techniques "_networkx_list_start"
    techniques "The attacker models the session ID algorithm enough to produce a compatible session IDs, or just one match."
  ]
  execution_flow [
    step "4"
    phase "Exploit"
    description "[Use matched Session ID] The attacker uses the falsified session ID to access the target system."
    techniques "The attacker loads the session ID into their web browser and browses to restricted data or functionality."
    techniques "The attacker loads the session ID into their network communications and impersonates a legitimate user to gain access to data or functionality."
  ]
  node [
    id 0
    label "make_many_anonymous_connections"
  ]
  node [
    id 1
    label "make_authorized_connections_and_records_the_session_tokens_or_credentials_issued"
  ]
  node [
    id 2
    label "characterize_ids"
  ]
  node [
    id 3
    label "study_the_characteristics_of_the_session_id_size_format_etc"
  ]
  node [
    id 4
    label "issue_ids"
  ]
  node [
    id 5
    label "model_the_session_id_algorithm_enough"
  ]
  node [
    id 6
    label "gain_access_to_the_target_system"
  ]
  node [
    id 7
    label "load_the_session_id"
  ]
  node [
    id 8
    label "generate_predictable_session_identifiers_using_java_util_random_which_makes_it_easier_for_remote_attackers_to_guess_a_session_identifier_through_brute_force_attacks"
  ]
  node [
    id 9
    label "keep_track_of_the_users"
  ]
  node [
    id 10
    label "control_access_to_resources"
  ]
  node [
    id 11
    label "exploit_session_ids"
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
