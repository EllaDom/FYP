graph [
  directed 1
  capec_id "558"
  name "Replace Trusted Executable"
  abstraction "Detailed"
  status "Stable"
  description "An adversary exploits weaknesses in privilege management or access control to replace a trusted executable with a malicious version and enable the execution of malware when that trusted executable is called."
  likelihood "Low"
  severity "High"
  related_attack_patterns "_networkx_list_start"
  related_attack_patterns [
    capec_id "542"
    nature "ChildOf"
  ]
  prerequisites "[]"
  skills_required "[]"
  resources_required "[]"
  consequences "[]"
  mitigations "[]"
  example_instances "_networkx_list_start"
  example_instances "Specific versions of Windows contain accessibility features that may be launched with a key combination before a user has logged in (for example when they are on the Windows Logon screen). On Windows XP and Windows Server 2003/R2, the program (e.g. &#34;C:\Windows\System32\utilman.exe&#34;) may be replaced with cmd.exe (or another program that provides backdoor access). Then pressing the appropriate key combination at the login screen while sitting at the keyboard or when connected over RDP will cause the replaced file to be executed with SYSTEM privileges."
  related_weaknesses "_networkx_list_start"
  related_weaknesses "284"
  matched_cwes "_networkx_list_start"
  matched_cwes "284"
  taxonomy_mappings [
    taxonomy_name "ATTACK"
    entry_id "1505.005"
    entry_name "Server Software Component: Terminal Services DLL"
  ]
  taxonomy_mappings [
    taxonomy_name "ATTACK"
    entry_id "1546.008"
    entry_name "Event Triggered Execution: Accessibility Features"
  ]
  execution_flow "[]"
  node [
    id 0
    label "contain_accessibility_features_that_may_be_launched_with_a_key_combination_before_a_user_has_logged_in_for_example_when_they_are_on_the_windows_logon_screen"
  ]
  node [
    id 1
    label "replace_the_program_e_g_c_windows_system32_utilman_exe"
  ]
  node [
    id 2
    label "press_the_appropriate_key_combination_at_the_login_screen"
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
