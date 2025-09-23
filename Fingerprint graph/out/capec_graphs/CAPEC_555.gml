graph [
  directed 1
  capec_id "555"
  name "Remote Services with Stolen Credentials"
  abstraction "Standard"
  status "Stable"
  description "This pattern of attack involves an adversary that uses stolen credentials to leverage remote services such as RDP, telnet, SSH, and VNC to log into a system. Once access is gained, any number of malicious activities could be performed."
  likelihood ""
  severity "Very High"
  related_attack_patterns [
    capec_id "560"
    nature "ChildOf"
  ]
  related_attack_patterns [
    capec_id "151"
    nature "CanPrecede"
  ]
  prerequisites "[]"
  skills_required "[]"
  resources_required "[]"
  consequences "[]"
  mitigations "_networkx_list_start"
  mitigations "Disable RDP, telnet, SSH and enable firewall rules to block such traffic. Limit users and accounts that have remote interactive login access. Remove the Local Administrators group from the list of groups allowed to login through RDP. Limit remote user permissions. Use remote desktop gateways and multifactor authentication for remote logins."
  example_instances "Remote desktop is a common feature in operating systems. It allows a user to log into an interactive session with a system desktop graphical user interface on a remote system. Microsoft refers to its implementation of the Remote Desktop Protocol (RDP) as Remote Desktop Services (RDS). There are other implementations and third-party tools that provide graphical access Remote Services similar to RDS. Adversaries may connect to a remote system over RDP/RDS to expand access if the service is enabled and allows access to accounts with known credentials."
  example_instances "Windows Remote Management (WinRM) is the name of both a Windows service and a protocol that allows a user to interact with a remote system (e.g., run an executable, modify the Registry, modify services). It may be called with the winrm command or by any number of programs such as PowerShell."
  related_weaknesses "522"
  related_weaknesses "308"
  related_weaknesses "309"
  related_weaknesses "294"
  related_weaknesses "263"
  related_weaknesses "262"
  related_weaknesses "521"
  matched_cwes "521"
  matched_cwes "522"
  matched_cwes "294"
  taxonomy_mappings [
    taxonomy_name "ATTACK"
    entry_id "1021"
    entry_name "Remote Services"
  ]
  taxonomy_mappings [
    taxonomy_name "ATTACK"
    entry_id "1114.002"
    entry_name "Email Collection:Remote Email Collection"
  ]
  taxonomy_mappings [
    taxonomy_name "ATTACK"
    entry_id "1133"
    entry_name "External Remote Services"
  ]
  execution_flow "[]"
  node [
    id 0
    label "provide_graphical_access_remote_services_similar_to_rds"
  ]
  node [
    id 1
    label "connect_to_expand_access_if_the_service_is_enabled_and_allows_access_to_accounts_with_known_credentials"
  ]
  node [
    id 2
    label "call_it"
  ]
  edge [
    source 0
    target 1
  ]
  edge [
    source 1
    target 2
  ]
]
