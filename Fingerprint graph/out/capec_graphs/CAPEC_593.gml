graph [
  directed 1
  capec_id "593"
  name "Session Hijacking"
  abstraction "Standard"
  status "Stable"
  description "This type of attack involves an adversary that exploits weaknesses in an application's use of sessions in performing authentication. The adversary is able to steal or manipulate an active session and use it to gain unathorized access to the application."
  likelihood "High"
  severity "Very High"
  related_attack_patterns "_networkx_list_start"
  related_attack_patterns [
    capec_id "21"
    nature "ChildOf"
  ]
  prerequisites "_networkx_list_start"
  prerequisites "An application that leverages sessions to perform authentication."
  skills_required "_networkx_list_start"
  skills_required [
    level "Low"
    description "Exploiting a poorly protected identity token is a well understood attack with many helpful resources available."
  ]
  resources_required "_networkx_list_start"
  resources_required "The adversary must have the ability to communicate with the application over the network."
  consequences "_networkx_list_start"
  consequences [
    scope "Confidentiality"
    scope "Integrity"
    scope "Availability"
    impact "Gain Privileges"
  ]
  mitigations "_networkx_list_start"
  mitigations "Properly encrypt and sign identity tokens in transit, and use industry standard session key generation mechanisms that utilize high amount of entropy to generate the session key. Many standard web and application servers will perform this task on your behalf. Utilize a session timeout for all sessions. If the user does not explicitly logout, terminate their session after this period of inactivity. If the user logs back in then a new session key should be generated."
  example_instances "[]"
  related_weaknesses "_networkx_list_start"
  related_weaknesses "287"
  matched_cwes "_networkx_list_start"
  matched_cwes "287"
  taxonomy_mappings [
    taxonomy_name "ATTACK"
    entry_id "1185"
    entry_name "Browser Session Hijacking"
  ]
  taxonomy_mappings [
    taxonomy_name "ATTACK"
    entry_id "1550.001"
    entry_name "Use Alternate Authentication Material:Application Access Token"
  ]
  taxonomy_mappings [
    taxonomy_name "ATTACK"
    entry_id "1563"
    entry_name "Remote Service Session Hijacking"
  ]
  taxonomy_mappings [
    taxonomy_name "OWASP Attacks"
    entry_id ""
    entry_name "Session hijacking attack"
  ]
  execution_flow [
    step "1"
    phase "Explore"
    description "[Discover Existing Session Token] Through varrying means, an adversary will discover and store an existing session token for some other authenticated user session."
    techniques "[]"
  ]
  execution_flow [
    step "2"
    phase "Experiment"
    description "[Insert Found Session Token] The attacker attempts to insert a found session token into communication with the targeted application to confirm viability for exploitation."
    techniques "[]"
  ]
  execution_flow [
    step "3"
    phase "Exploit"
    description "[Session Token Exploitation] The attacker leverages the captured session token to interact with the targeted application in a malicious fashion, impersonating the victim."
    techniques "[]"
  ]
  node [
    id 0
    label "discover_existing_session"
  ]
  node [
    id 1
    label "find_session_token"
  ]
  node [
    id 2
    label "leverage_the_captured_session_token_to_interact_with_the_targeted_application_in_a_malicious_fashion"
  ]
  node [
    id 3
    label "leverage_sessions"
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
    target 2
  ]
  edge [
    source 2
    target 3
  ]
]
