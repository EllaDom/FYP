graph [
  directed 1
  capec_id "694"
  name "System Location Discovery"
  abstraction "Standard"
  status "Stable"
  description "&#10;            "
  likelihood "High"
  severity "Very Low"
  related_attack_patterns "_networkx_list_start"
  related_attack_patterns [
    capec_id "169"
    nature "ChildOf"
  ]
  prerequisites "_networkx_list_start"
  prerequisites "The adversary must have some level of access to the system and have a basic understanding of the operating system in order to query the appropriate sources for relevant information."
  skills_required "_networkx_list_start"
  skills_required [
    level "Low"
    description "The adversary must know how to query various system sources of information respective of the system's operating system to obtain the relevant information."
  ]
  resources_required "_networkx_list_start"
  resources_required "The adversary requires access to the target's operating system tools to query relevant system information. On windows, registry queries can be conducted with powershell, wmi, or regedit. On Linux or macOS, queries can be performed with through a shell."
  consequences "_networkx_list_start"
  consequences [
    scope "_networkx_list_start"
    scope "Confidentiality"
    impact "Read Data"
  ]
  mitigations "_networkx_list_start"
  mitigations "To reduce the amount of information gathered, one could disable various geolocation features of the operating system not required for system operation."
  example_instances "[]"
  related_weaknesses "_networkx_list_start"
  related_weaknesses "497"
  matched_cwes "_networkx_list_start"
  matched_cwes "497"
  taxonomy_mappings "_networkx_list_start"
  taxonomy_mappings [
    taxonomy_name "ATTACK"
    entry_id "1614"
    entry_name "System Language Discovery"
  ]
  execution_flow "_networkx_list_start"
  execution_flow [
    step "1"
    phase "Explore"
    description "[System Locale Information Discovery] The adversary examines system information from various sources such as registry and native API functions and correlates the gathered information to infer the geographical location of the target system"
    techniques "Registry Query: Query the registry key HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\ContentIndex\Language\Language_Dialect on Windows to obtain system language, Computer\HKEY_CURRENT_USER\Keyboard Layout\Preload to obtain the hexadecimal language IDs of the current user's preloaded keyboard layouts, and Computer\HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\TimeZoneInformation to obtain the system timezone configuration"
    techniques "Native API Requests: Parse the outputs of Windows API functions GetTimeZoneInformation, GetUserDefaultUILanguage, GetSystemDefaultUILanguage, GetKeyboardLayoutList and GetUserDefaultLangID to obtain information about languages, keyboard layouts, and timezones installed on the system or on macOS or Linux systems, query locale to obtain the $LANG environment variable and view keyboard layout information or use timeanddatectl status to show the system clock settings."
    techniques "Read Configuration Files: For macOS and Linux-based systems, view the /etc/vconsole.conf file to get information about the keyboard mapping and console font."
  ]
  node [
    id 0
    label "examine_system_information"
  ]
  node [
    id 1
    label "obtain_system_language"
  ]
  node [
    id 2
    label "parse_the_outputs_of_windows_api_functions_gettimezoneinformation_getuserdefaultuilanguage_getsystemdefaultuilanguage_getkeyboardlayoutlist_and_getuserdefaultlangid"
  ]
  node [
    id 3
    label "query_the_appropriate_sources_for_relevant_information"
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
]
