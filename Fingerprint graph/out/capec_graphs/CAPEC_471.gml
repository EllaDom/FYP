graph [
  directed 1
  capec_id "471"
  name "Search Order Hijacking"
  abstraction "Detailed"
  status "Stable"
  description "An adversary exploits a weakness in an application's specification of external libraries to exploit the functionality of the loader where the process loading the library searches first in the same directory in which the process binary resides and then in other directories. Exploitation of this preferential search order can allow an attacker to make the loading process load the adversary's rogue library rather than the legitimate library. This attack can be leveraged with many different libraries and with many different loading processes. No forensic trails are left in the system's registry or file system that an incorrect library had been loaded."
  likelihood ""
  severity "Medium"
  related_attack_patterns "_networkx_list_start"
  related_attack_patterns [
    capec_id "159"
    nature "ChildOf"
  ]
  prerequisites "_networkx_list_start"
  prerequisites "Attacker has a mechanism to place its malicious libraries in the needed location on the file system."
  skills_required "_networkx_list_start"
  skills_required [
    level "Medium"
    description "Ability to create a malicious library."
  ]
  resources_required "[]"
  consequences "[]"
  mitigations "Design: Fix the Windows loading process to eliminate the preferential search order by looking for DLLs in the precise location where they are expected"
  mitigations "Design: Sign system DLLs so that unauthorized DLLs can be detected."
  example_instances "For instance, an attacker with access to the file system may place a malicious ntshrui.dll in the C:\Windows directory. This DLL normally resides in the System32 folder. Process explorer.exe which also resides in C:\Windows, upon trying to load the ntshrui.dll from the System32 folder will actually load the DLL supplied by the attacker simply because of the preferential search order. Since the attacker has placed its malicious ntshrui.dll in the same directory as the loading explorer.exe process, the DLL supplied by the attacker will be found first and thus loaded in lieu of the legitimate DLL. Since explorer.exe is loaded during the boot cycle, the attackers' malware is guaranteed to execute."
  example_instances "macOS and OS X use a common method to look for required dynamic libraries (dylib) to load into a program based on search paths. Adversaries can take advantage of ambiguous paths to plant dylibs to gain privilege escalation or persistence. A common method is to see what dylibs an application uses, then plant a malicious version with the same name higher up in the search path. This typically results in the dylib being in the same folder as the application itself. If the program is configured to run at a higher privilege level than the current user, then when the dylib is loaded into the application, the dylib will also run at that elevated level."
  related_weaknesses "_networkx_list_start"
  related_weaknesses "427"
  matched_cwes "_networkx_list_start"
  matched_cwes "427"
  taxonomy_mappings [
    taxonomy_name "ATTACK"
    entry_id "1574.001"
    entry_name "Hijack Execution Flow:DLL search order hijacking"
  ]
  taxonomy_mappings [
    taxonomy_name "ATTACK"
    entry_id "1574.004"
    entry_name "Hijack Execution Flow: Dylib Hijacking"
  ]
  taxonomy_mappings [
    taxonomy_name "ATTACK"
    entry_id "1574.008"
    entry_name "Hijack Execution Flow: Path Interception by Search Order Hijacking"
  ]
  execution_flow [
    step "1"
    phase "Explore"
    description "[Identify target general susceptibility] An attacker uses an automated tool or manually finds whether the target application uses dynamically linked libraries and the configuration file or look up table (such as Procedure Linkage Table) which contains the entries for dynamically linked libraries."
    techniques "The attacker uses a tool such as the OSX &#34;otool&#34; utility or manually probes whether the target application uses dynamically linked libraries."
    techniques "The attacker finds the configuration files containing the entries to the dynamically linked libraries and modifies the entries to point to the malicious libraries the attacker crafted."
  ]
  execution_flow [
    step "2"
    phase "Experiment"
    description "[Craft malicious libraries] The attacker uses knowledge gained in the Explore phase to craft malicious libraries that they will redirect the target to leverage. These malicious libraries could have the same APIs as the legitimate library and additional malicious code."
    techniques "_networkx_list_start"
    techniques "The attacker monitors the file operations performed by the target application using a tool like dtrace or FileMon. And the attacker can delay the operations by using &#34;sleep(2)&#34; and &#34;usleep()&#34; to prepare the appropriate conditions for the attack, or make the application perform expansive tasks (large files parsing, etc.) depending on the purpose of the application."
  ]
  execution_flow [
    step "3"
    phase "Exploit"
    description "[Redirect the access to libraries to the malicious libraries] The attacker redirects the target to the malicious libraries they crafted in the Experiment phase. The attacker will be able to force the targeted application to execute arbitrary code when the application attempts to access the legitimate libraries."
    techniques "The attacker modifies the entries in the configuration files pointing to the malicious libraries they crafted."
    techniques "The attacker leverages symlink/timing issues to redirect the target to access the malicious libraries they crafted. See also: CAPEC-132."
    techniques "The attacker leverages file search path order issues to redirect the target to access the malicious libraries they crafted. See also: CAPEC-38."
  ]
  node [
    id 0
    label "identify_target_general_susceptibility"
  ]
  node [
    id 1
    label "find_the_configuration_files_containing_the_entries_to_the_dynamically_linked_libraries"
  ]
  node [
    id 2
    label "craft_malicious_libraries"
  ]
  node [
    id 3
    label "have_the_same_apis_as_the_legitimate_library_and_additional_malicious_code"
  ]
  node [
    id 4
    label "monitor_the_file_operations_performed_by_the_target_application_using_a_tool_like_dtrace_or_filemon"
  ]
  node [
    id 5
    label "delay_the_operations"
  ]
  node [
    id 6
    label "redirect_the_access_to_libraries_to_the_malicious_libraries"
  ]
  node [
    id 7
    label "redirect_the_target"
  ]
  node [
    id 8
    label "force_the_targeted_application_to_execute_arbitrary_code_when_the_application_attempts_to_access_the_legitimate_libraries"
  ]
  node [
    id 9
    label "modify_the_entries_in_the_configuration_files_pointing_to_the_malicious_libraries_they_crafted"
  ]
  node [
    id 10
    label "leverage_symlink_timing_issues"
  ]
  node [
    id 11
    label "leverage_file_search_path_order_issues"
  ]
  node [
    id 12
    label "place_a_malicious_ntshrui_dll_in_the_c_windows_directory"
  ]
  node [
    id 13
    label "load_explorer_exe"
  ]
  node [
    id 14
    label "look_to_load_into_a_program_based_on_search_paths"
  ]
  node [
    id 15
    label "take_advantage"
  ]
  node [
    id 16
    label "result_being_in_the_same_folder_as_the_application_itself"
  ]
  node [
    id 17
    label "configure_the_program"
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
    target 2
  ]
]
