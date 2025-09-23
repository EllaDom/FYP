graph [
  directed 1
  capec_id "21"
  name "Exploitation of Trusted Identifiers"
  abstraction "Meta"
  status "Stable"
  description "&#10;            "
  likelihood "High"
  severity "High"
  related_attack_patterns "[]"
  prerequisites "Server software must rely on weak identifier proof and/or verification schemes."
  prerequisites "Identifiers must have long lifetimes and potential for reusability."
  prerequisites "Server software must allow concurrent sessions to exist."
  skills_required "_networkx_list_start"
  skills_required [
    level "Low"
    description "To achieve a direct connection with the weak or non-existent server session access control, and pose as an authorized user"
  ]
  resources_required "Ability to deploy software on network."
  resources_required "Ability to communicate synchronously or asynchronously with server."
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
  mitigations "Design: utilize strong federated identity such as SAML to encrypt and sign identity tokens in transit."
  mitigations "Implementation: Use industry standards session key generation mechanisms that utilize high amount of entropy to generate the session key. Many standard web and application servers will perform this task on your behalf."
  mitigations "Implementation: If the identifier is used for authentication, such as in the so-called single sign on use cases, then ensure that it is protected at the same level of assurance as authentication tokens."
  mitigations "Implementation: If the web or application server supports it, then encrypting and/or signing the identifier (such as cookie) can protect the ID if intercepted."
  mitigations "Design: Use strong session identifiers that are protected in transit and at rest."
  mitigations "Implementation: Utilize a session timeout for all sessions, for example 20 minutes. If the user does not explicitly logout, the server terminates their session after this period of inactivity. If the user logs back in then a new session key is generated."
  mitigations "Implementation: Verify authenticity of all identifiers at runtime."
  example_instances "Thin client applications like web applications are particularly vulnerable to session ID attacks. Since the server has very little control over the client, but still must track sessions, data, and objects on the server side, cookies and other mechanisms have been used to pass the key to the session data between the client and server. When these session keys are compromised it is trivial for an adversary to impersonate a user's session in effect, have the same capabilities as the authorized user. There are two main ways for an adversary to exploit session IDs. A brute force attack involves an adversary repeatedly attempting to query the system with a spoofed session header in the HTTP request. A web server that uses a short session ID can be easily spoofed by trying many possible combinations so the parameters session-ID= 1234 has few possible combinations, and an adversary can retry several hundred or thousand request with little to no issue on their side. The second method is interception, where a tool such as wireshark is used to sniff the wire and pull off any unprotected session identifiers. The adversary can then use these variables and access the application."
  example_instances "For example, in a message queuing system that allows service requesters to post messages to its queue through an open channel (such as anonymous FTP), authorization is done through checking group or role membership contained in the posted message. However, there is no proof that the message itself, the information in the message (such group or role membership), or the process that wrote the message to the queue is authentic and authorized to do so."
  related_weaknesses "290"
  related_weaknesses "302"
  related_weaknesses "346"
  related_weaknesses "539"
  related_weaknesses "6"
  related_weaknesses "384"
  related_weaknesses "664"
  related_weaknesses "602"
  related_weaknesses "642"
  matched_cwes "384"
  matched_cwes "602"
  matched_cwes "290"
  taxonomy_mappings [
    taxonomy_name "ATTACK"
    entry_id "1134"
    entry_name "Access Token Manipulation"
  ]
  taxonomy_mappings [
    taxonomy_name "ATTACK"
    entry_id "1528"
    entry_name "Steal Application Access Token"
  ]
  taxonomy_mappings [
    taxonomy_name "ATTACK"
    entry_id "1539"
    entry_name "Steal Web Session Cookie"
  ]
  execution_flow [
    step "1"
    phase "Explore"
    description "[Survey the application for Indicators of Susceptibility] Using a variety of methods, until one is found that applies to the target, the adversary probes for cookies, session tokens, or entry points that bypass identifiers altogether."
    techniques "Spider all available pages"
    techniques "Attack known bad interfaces"
    techniques "Search outward-facing configuration and properties files for identifiers."
  ]
  execution_flow [
    step "2"
    phase "Experiment"
    description "[Fetch samples] The adversary fetches many samples of identifiers. This may be through legitimate access (logging in, legitimate connections, etc.) or via systematic probing."
    techniques "An adversary makes many anonymous connections and records the session IDs assigned."
    techniques "An adversary makes authorized connections and records the session tokens or credentials issued."
    techniques "An adversary gains access to (legitimately or illegitimately) a nearby system (e.g., in the same operations network, DMZ, or local network) and makes a connection from it, attempting to gain the same privileges as a trusted system."
  ]
  execution_flow [
    step "3"
    phase "Exploit"
    description "[Impersonate] An adversary can use successful experiments or authentications to impersonate an authorized user or system or to laterally move within a system or application"
    techniques "[]"
  ]
  execution_flow [
    step "4"
    phase "Exploit"
    description "[Spoofing] Malicious data can be injected into the target system or into a victim user's system by an adversary. The adversary can also pose as a legitimate user to perform social engineering attacks."
    techniques "[]"
  ]
  execution_flow [
    step "5"
    phase "Exploit"
    description "[Data Exfiltration] The adversary can obtain sensitive data contained within the system or application."
    techniques "[]"
  ]
  node [
    id 0
    label "survey_the_application_for_indicators_of_susceptibility"
  ]
  node [
    id 1
    label "spider_the_web_site_for_all_available_links"
  ]
  node [
    id 2
    label "know_bad_interfaces"
  ]
  node [
    id 3
    label "examine_outward_facing_configuration_and_properties"
  ]
  node [
    id 4
    label "fetch_many_samples_of_identifiers"
  ]
  node [
    id 5
    label "make_many_anonymous_connections"
  ]
  node [
    id 6
    label "make_authorized_connections_and_records_the_session_tokens_or_credentials_issued"
  ]
  node [
    id 7
    label "gain_access_to_legitimately_or_illegitimately"
  ]
  node [
    id 8
    label "impersonate_an_authorized_user_or_system"
  ]
  node [
    id 9
    label "obtain_sensitive_data_contained_within_the_system_or_application"
  ]
  node [
    id 10
    label "track_sessions_data_and_objects_on_the_server_side_cookies_and_other_mechanisms"
  ]
  node [
    id 11
    label "compromise_these_session_keys"
  ]
  node [
    id 12
    label "exploit_session_ids"
  ]
  node [
    id 13
    label "involve_an_adversary_repeatedly_attempting_to_query_the_system_with_a_spoofed_session_header_in_the_http_request"
  ]
  node [
    id 14
    label "spoof_id"
  ]
  node [
    id 15
    label "sniff_the_wire"
  ]
  node [
    id 16
    label "access_the_application"
  ]
  node [
    id 17
    label "send_a_message"
  ]
  node [
    id 18
    label "have_long_lifetimes_and_potential_for_reusability"
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
]
