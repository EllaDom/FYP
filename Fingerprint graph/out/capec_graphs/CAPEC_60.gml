graph [
  directed 1
  capec_id "60"
  name "Reusing Session IDs (aka Session Replay)"
  abstraction "Detailed"
  status "Draft"
  description "This attack targets the reuse of valid session ID to spoof the target system in order to gain privileges. The attacker tries to reuse a stolen session ID used previously during a transaction to perform spoofing and session hijacking. Another name for this type of attack is Session Replay."
  likelihood "High"
  severity "High"
  related_attack_patterns "_networkx_list_start"
  related_attack_patterns [
    capec_id "593"
    nature "ChildOf"
  ]
  prerequisites "The target host uses session IDs to keep track of the users."
  prerequisites "Session IDs are used to control access to resources."
  prerequisites "The session IDs used by the target host are not well protected from session theft."
  skills_required [
    level "Low"
    description "If an attacker can steal a valid session ID, they can then try to be authenticated with that stolen session ID."
  ]
  skills_required [
    level "Medium"
    description "More sophisticated attack can be used to hijack a valid session from a user and spoof a legitimate user by reusing their valid session ID."
  ]
  resources_required "[]"
  consequences "_networkx_list_start"
  consequences [
    scope "Confidentiality"
    scope "Access Control"
    scope "Authorization"
    impact "Gain Privileges"
  ]
  mitigations "Always invalidate a session ID after the user logout."
  mitigations "Setup a session time out for the session IDs."
  mitigations "Protect the communication between the client and server. For instance it is best practice to use SSL to mitigate adversary in the middle attacks (CAPEC-94)."
  mitigations "Do not code send session ID with GET method, otherwise the session ID will be copied to the URL. In general avoid writing session IDs in the URLs. URLs can get logged in log files, which are vulnerable to an attacker."
  mitigations "Encrypt the session data associated with the session ID."
  mitigations "Use multifactor authentication."
  example_instances "OpenSSL and SSLeay allow remote attackers to reuse SSL sessions and bypass access controls. See also: CVE-1999-0428"
  example_instances "Merak Mail IceWarp Web Mail uses a static identifier as a user session ID that does not change across sessions, which could allow remote attackers with access to the ID to gain privileges as that user, e.g. by extracting the ID from the user's answer or forward URLs. See also: CVE-2002-0258"
  related_weaknesses "294"
  related_weaknesses "290"
  related_weaknesses "346"
  related_weaknesses "384"
  related_weaknesses "488"
  related_weaknesses "539"
  related_weaknesses "200"
  related_weaknesses "285"
  related_weaknesses "664"
  related_weaknesses "732"
  matched_cwes "732"
  matched_cwes "294"
  matched_cwes "290"
  matched_cwes "285"
  matched_cwes "200"
  matched_cwes "384"
  taxonomy_mappings [
    taxonomy_name "ATTACK"
    entry_id "1134.001"
    entry_name "Access Token Manipulation:Token Impersonation/Theft"
  ]
  taxonomy_mappings [
    taxonomy_name "ATTACK"
    entry_id "1550.004"
    entry_name "Use Alternate Authentication Material:Web Session Cookie"
  ]
  execution_flow [
    step "1"
    phase "Explore"
    description "The attacker interacts with the target host and finds that session IDs are used to authenticate users."
    techniques "[]"
  ]
  execution_flow [
    step "2"
    phase "Explore"
    description "The attacker steals a session ID from a valid user."
    techniques "[]"
  ]
  execution_flow [
    step "3"
    phase "Exploit"
    description "The attacker tries to use the stolen session ID to gain access to the system with the privileges of the session ID's original owner."
    techniques "[]"
  ]
  node [
    id 0
    label "steal_a_session_id"
  ]
  node [
    id 1
    label "see_0258"
  ]
  node [
    id 2
    label "keep_track_of_the_users"
  ]
  node [
    id 3
    label "control_access_to_resources"
  ]
  node [
    id 4
    label "protect_the_session_ids_used_by_the_target_host"
  ]
  edge [
    source 0
    target 0
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
]
