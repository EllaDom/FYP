graph [
  directed 1
  capec_id "61"
  name "Session Fixation"
  abstraction "Detailed"
  status "Draft"
  description "The attacker induces a client to establish a session with the target software using a session identifier provided by the attacker. Once the user successfully authenticates to the target software, the attacker uses the (now privileged) session identifier in their own transactions. This attack leverages the fact that the target software either relies on client-generated session identifiers or maintains the same session identifiers after privilege elevation."
  likelihood "Medium"
  severity "High"
  related_attack_patterns "_networkx_list_start"
  related_attack_patterns [
    capec_id "593"
    nature "ChildOf"
  ]
  prerequisites "Session identifiers that remain unchanged when the privilege levels change."
  prerequisites "Permissive session management mechanism that accepts random user-generated session identifiers"
  prerequisites "Predictable session identifiers"
  skills_required "_networkx_list_start"
  skills_required [
    level "Low"
    description "Only basic skills are required to determine and fixate session identifiers in a user's browser. Subsequent attacks may require greater skill levels depending on the attackers' motives."
  ]
  resources_required "_networkx_list_start"
  resources_required "None: No specialized resources are required to execute this type of attack."
  consequences "_networkx_list_start"
  consequences [
    scope "Confidentiality"
    scope "Access Control"
    scope "Authorization"
    impact "Gain Privileges"
  ]
  mitigations "Use a strict session management mechanism that only accepts locally generated session identifiers: This prevents attackers from fixating session identifiers of their own choice."
  mitigations "Regenerate and destroy session identifiers when there is a change in the level of privilege: This ensures that even though a potential victim may have followed a link with a fixated identifier, a new one is issued when the level of privilege changes."
  mitigations "Use session identifiers that are difficult to guess or brute-force: One way for the attackers to obtain valid session identifiers is by brute-forcing or guessing them. By choosing session identifiers that are sufficiently random, brute-forcing or guessing becomes very difficult."
  example_instances "Consider a banking application that issues a session identifier in the URL to a user before login, and uses the same identifier to identify the customer following successful authentication. An attacker can easily leverage session fixation to access a victim's account by having the victim click on a forged link that contains a valid session identifier from a trapped session setup by the attacker. Once the victim is authenticated, the attacker can take over the session and continue with the same levels of privilege as the victim."
  example_instances "An attacker can hijack user sessions, bypass authentication controls and possibly gain administrative privilege by fixating the session of a user authenticating to the Management Console on certain versions of Macromedia JRun 4.0. This can be achieved by setting the session identifier in the user's browser and having the user authenticate to the Management Console. Session fixation is possible since the application server does not regenerate session identifiers when there is a change in the privilege levels. See also: CVE-2004-2182"
  related_weaknesses "384"
  related_weaknesses "664"
  related_weaknesses "732"
  matched_cwes "384"
  matched_cwes "732"
  taxonomy_mappings [
    taxonomy_name "WASC"
    entry_id "37"
    entry_name "Session Fixation"
  ]
  taxonomy_mappings [
    taxonomy_name "OWASP Attacks"
    entry_id ""
    entry_name "Session fixation"
  ]
  execution_flow [
    step "1"
    phase "Explore"
    description "[Setup the Attack] Setup a session: The attacker has to setup a trap session that provides a valid session identifier, or select an arbitrary identifier, depending on the mechanism employed by the application. A trap session is a dummy session established with the application by the attacker and is used solely for the purpose of obtaining valid session identifiers. The attacker may also be required to periodically refresh the trap session in order to obtain valid session identifiers."
    techniques "The attacker chooses a predefined identifier that they know."
    techniques "The attacker creates a trap session for the victim."
  ]
  execution_flow [
    step "2"
    phase "Experiment"
    description "[Attract a Victim] Fixate the session: The attacker now needs to transfer the session identifier from the trap session to the victim by introducing the session identifier into the victim's browser. This is known as fixating the session. The session identifier can be introduced into the victim's browser by leveraging cross site scripting vulnerability, using META tags or setting HTTP response headers in a variety of ways."
    techniques "Attackers can put links on web sites (such as forums, blogs, or comment forms)."
    techniques "Attackers can establish rogue proxy servers for network protocols that give out the session ID and then redirect the connection to the legitimate service."
    techniques "Attackers can email attack URLs to potential victims through spam and phishing techniques."
  ]
  execution_flow [
    step "3"
    phase "Exploit"
    description "[Abuse the Victim's Session] Takeover the fixated session: Once the victim has achieved a higher level of privilege, possibly by logging into the application, the attacker can now take over the session using the fixated session identifier."
    techniques "The attacker loads the predefined session ID into their browser and browses to protected data or functionality."
    techniques "The attacker loads the predefined session ID into their software and utilizes functionality with the rights of the victim."
  ]
  node [
    id 0
    label "setup_the_attack"
  ]
  node [
    id 1
    label "setup_a_trap_session_that_provides_a_valid_session_identifier"
  ]
  node [
    id 2
    label "enable_the_attacker"
  ]
  node [
    id 3
    label "choose_a_predefined_identifier"
  ]
  node [
    id 4
    label "create_a_trap_session_for_the_victim"
  ]
  node [
    id 5
    label "attract_a_victim"
  ]
  node [
    id 6
    label "know_this"
  ]
  node [
    id 7
    label "exploit_session_ids"
  ]
  node [
    id 8
    label "put_links_on_web_sites_such_as_forums_blogs_or_comment_forms"
  ]
  node [
    id 9
    label "establish_rogue_proxy_servers_for_network_protocols_that_give_out_the_session_id_and_then_redirect_the_connection_to_the_legitimate_service"
  ]
  node [
    id 10
    label "email_attack_urls"
  ]
  node [
    id 11
    label "achieve_a_higher_level_of_privilege"
  ]
  node [
    id 12
    label "load_the_session_id"
  ]
  node [
    id 13
    label "consider_a_banking_application_that_issues_a_session_identifier_in_the_url_to_a_user_before_login"
  ]
  node [
    id 14
    label "leverage_sessions"
  ]
  node [
    id 15
    label "authenticate_the_victim"
  ]
  node [
    id 16
    label "hijack_user_sessions_bypass_authentication_controls"
  ]
  node [
    id 17
    label "achieve_this"
  ]
  node [
    id 18
    label "regenerate_session_identifiers"
  ]
  node [
    id 19
    label "remain_when_the_privilege_levels_change"
  ]
  node [
    id 20
    label "accept_random_user_generated_session_identifiers"
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
    target 16
  ]
  edge [
    source 16
    target 17
  ]
  edge [
    source 17
    target 18
  ]
  edge [
    source 18
    target 19
  ]
  edge [
    source 19
    target 20
  ]
]
