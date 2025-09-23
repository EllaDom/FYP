graph [
  directed 1
  capec_id "196"
  name "Session Credential Falsification through Forging"
  abstraction "Standard"
  status "Draft"
  description "An attacker creates a false but functional session credential in order to gain or usurp access to a service. Session credentials allow users to identify themselves to a service after an initial authentication without needing to resend the authentication information (usually a username and password) with every message. If an attacker is able to forge valid session credentials they may be able to bypass authentication or piggy-back off some other authenticated user's session. This attack differs from Reuse of Session IDs and Session Sidejacking attacks in that in the latter attacks an attacker uses a previous or existing credential without modification while, in a forging attack, the attacker must create their own credential, although it may be based on previously observed credentials."
  likelihood "Medium"
  severity "Medium"
  related_attack_patterns [
    capec_id "384"
    nature "CanPrecede"
  ]
  related_attack_patterns [
    capec_id "61"
    nature "CanPrecede"
  ]
  related_attack_patterns [
    capec_id "21"
    nature "ChildOf"
  ]
  prerequisites "_networkx_list_start"
  prerequisites "The targeted application must use session credentials to identify legitimate users. Session identifiers that remains unchanged when the privilege levels change. Predictable session identifiers."
  skills_required "_networkx_list_start"
  skills_required [
    level "Medium"
    description "Forge the session credential and reply the request."
  ]
  resources_required "_networkx_list_start"
  resources_required "Attackers may require tools to craft messages containing their forged credentials, and ability to send HTTP request to a web application."
  consequences [
    scope "_networkx_list_start"
    scope "Integrity"
    impact "Modify Data"
  ]
  consequences [
    scope "_networkx_list_start"
    scope "Confidentiality"
    impact "Read Data"
  ]
  consequences [
    scope "_networkx_list_start"
    scope "Authorization"
    impact "Execute Unauthorized Commands"
  ]
  consequences [
    scope "Accountability"
    scope "Authentication"
    scope "Authorization"
    scope "Non-Repudiation"
    impact "Gain Privileges"
  ]
  consequences [
    scope "Access Control"
    scope "Authorization"
    impact "Bypass Protection Mechanism"
  ]
  mitigations "Implementation: Use session IDs that are difficult to guess or brute-force: One way for the attackers to obtain valid session IDs is by brute-forcing or guessing them. By choosing session identifiers that are sufficiently random, brute-forcing or guessing becomes very difficult."
  mitigations "Implementation: Regenerate and destroy session identifiers when there is a change in the level of privilege: This ensures that even though a potential victim may have followed a link with a fixated identifier, a new one is issued when the level of privilege changes."
  example_instances "_networkx_list_start"
  example_instances "This example uses client side scripting to set session ID in the victim's browser. The JavaScript code document.cookie=&#34;sessionid=0123456789&#34; fixates a falsified session credential into victim's browser, with the help of crafted a URL link. http://www.example.com/<script>document.cookie=&#34;sessionid=0123456789&#34;;</script> A similar example uses session ID as an argument of the URL. http://www.example.com/index.php/sessionid=0123456789 Once the victim clicks the links, the attacker may be able to bypass authentication or piggy-back off some other authenticated victim's session."
  related_weaknesses "384"
  related_weaknesses "664"
  matched_cwes "_networkx_list_start"
  matched_cwes "384"
  taxonomy_mappings [
    taxonomy_name "ATTACK"
    entry_id "1134.002"
    entry_name "Access Token Manipulation: Create Process with Token"
  ]
  taxonomy_mappings [
    taxonomy_name "ATTACK"
    entry_id "1134.003"
    entry_name "Access Token Manipulation: Make and Impersonate Token"
  ]
  taxonomy_mappings [
    taxonomy_name "ATTACK"
    entry_id "1606"
    entry_name "Forge Web Credentials"
  ]
  execution_flow [
    step "1"
    phase "Explore"
    description "[Analyze and Understand Session IDs] The attacker finds that the targeted application use session credentials to identify legitimate users."
    techniques "An attacker makes many anonymous connections and records the session IDs."
    techniques "An attacker makes authorized connections and records the session tokens or credentials."
  ]
  execution_flow [
    step "2"
    phase "Experiment"
    description "[Create Session IDs.] Attackers craft messages containing their forged credentials in GET, POST request, HTTP headers or cookies."
    techniques "_networkx_list_start"
    techniques "The attacker manipulates the HTTP request message and adds their forged session IDs in to the requests or cookies."
  ]
  execution_flow [
    step "3"
    phase "Exploit"
    description "[Abuse the Victim's Session Credentials] The attacker fixates falsified session ID to the victim when victim access the system. Once the victim has achieved a higher level of privilege, possibly by logging into the application, the attacker can now take over the session using the forged session identifier."
    techniques "The attacker loads the predefined or predicted session ID into their browser and browses to protected data or functionality."
    techniques "The attacker loads the predefined or predicted session ID into their software and utilizes functionality with the rights of the victim."
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
    label "craft_messages_containing_their_forged_credentials_in_get_post_request_http_headers_or_cookies"
  ]
  node [
    id 3
    label "manipulate_the_http_request_message"
  ]
  node [
    id 4
    label "achieve_a_higher_level_of_privilege"
  ]
  node [
    id 5
    label "load_the_predefined_or_predicted_session_id"
  ]
  node [
    id 6
    label "load_the_session_id"
  ]
  node [
    id 7
    label "fixate_a_falsified_session_credential"
  ]
  node [
    id 8
    label "click_the_links"
  ]
  node [
    id 9
    label "remain_when_the_privilege_levels_change"
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
    source 7
    target 6
  ]
  edge [
    source 8
    target 9
  ]
]
