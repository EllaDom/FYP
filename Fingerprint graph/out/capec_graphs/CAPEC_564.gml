graph [
  directed 1
  capec_id "564"
  name "Run Software at Logon"
  abstraction "Detailed"
  status "Draft"
  description "Operating system allows logon scripts to be run whenever a specific user or users logon to a system. If adversaries can access these scripts, they may insert additional code into the logon script. This code can allow them to maintain persistence or move laterally within an enclave because it is executed every time the affected user or users logon to a computer. Modifying logon scripts can effectively bypass workstation and enclave firewalls. Depending on the access configuration of the logon scripts, either local credentials or a remote administrative account may be necessary."
  likelihood ""
  severity ""
  related_attack_patterns "_networkx_list_start"
  related_attack_patterns [
    capec_id "542"
    nature "ChildOf"
  ]
  prerequisites "[]"
  skills_required "[]"
  resources_required "[]"
  consequences "[]"
  mitigations "_networkx_list_start"
  mitigations "Restrict write access to logon scripts to necessary administrators."
  example_instances "[]"
  related_weaknesses "_networkx_list_start"
  related_weaknesses "284"
  matched_cwes "_networkx_list_start"
  matched_cwes "284"
  taxonomy_mappings [
    taxonomy_name "ATTACK"
    entry_id "1037"
    entry_name "Boot or Logon Initialization Scripts"
  ]
  taxonomy_mappings [
    taxonomy_name "ATTACK"
    entry_id "1543.001"
    entry_name "Create or Modify System Process: Launch Agent"
  ]
  taxonomy_mappings [
    taxonomy_name "ATTACK"
    entry_id "1543.004"
    entry_name "Create or Modify System Process: Launch Daemon"
  ]
  taxonomy_mappings [
    taxonomy_name "ATTACK"
    entry_id "1547"
    entry_name "Boot or Logon Autostart Execution"
  ]
  execution_flow "[]"
]
