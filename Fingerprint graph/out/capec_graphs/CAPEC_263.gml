graph [
  directed 1
  capec_id "263"
  name "Force Use of Corrupted Files"
  abstraction "Detailed"
  status "Draft"
  description "This describes an attack where an application is forced to use a file that an attacker has corrupted. The result is often a denial of service caused by the application being unable to process the corrupted file, but other results, including the disabling of filters or access controls (if the application fails in an unsafe way rather than failing by locking down) or buffer overflows are possible."
  likelihood ""
  severity "Medium"
  related_attack_patterns "_networkx_list_start"
  related_attack_patterns [
    capec_id "17"
    nature "ChildOf"
  ]
  prerequisites "The targeted application must utilize a configuration file that an attacker is able to corrupt. In some cases, the attacker must be able to force the (re-)reading of the corrupted file if the file is normally only consulted at startup."
  prerequisites "The severity of the attack hinges on how the application responds to the corrupted file. If the application detects the corruption and locks down, this may result in the denial of services provided by the application. If the application fails to detect the corruption, the result could be a more severe denial of service (crash or hang) or even an exploitable buffer overflow. If the application detects the corruption but fails in an unsafe way, this attack could result in the continuation of services but without certain security structures, such as filters or access controls. For example, if the corrupted file configures filters, an unsafe response from an application could result in simply disabling the filtering mechanisms due to the lack of usable configuration data."
  skills_required "[]"
  resources_required "_networkx_list_start"
  resources_required "This varies depending on the resources necessary to corrupt the configuration file and the resources needed to force the application to re-read it (if any)."
  consequences "[]"
  mitigations "[]"
  example_instances "[]"
  related_weaknesses "_networkx_list_start"
  related_weaknesses "829"
  matched_cwes "_networkx_list_start"
  matched_cwes "829"
  taxonomy_mappings "[]"
  execution_flow "[]"
  node [
    id 0
    label "force_the_re_reading_of_the_corrupted_file"
  ]
  node [
    id 1
    label "detect_the_corruption_and_locks_down"
  ]
  edge [
    source 0
    target 1
  ]
  edge [
    source 1
    target 1
  ]
]
