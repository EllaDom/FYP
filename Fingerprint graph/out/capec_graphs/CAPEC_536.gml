graph [
  directed 1
  capec_id "536"
  name "Data Injected During Configuration"
  abstraction "Standard"
  status "Stable"
  description "An attacker with access to data files and processes on a victim's system injects malicious data into critical operational data during configuration or recalibration, causing the victim's system to perform in a suboptimal manner that benefits the adversary."
  likelihood "Low"
  severity "High"
  related_attack_patterns "_networkx_list_start"
  related_attack_patterns [
    capec_id "176"
    nature "ChildOf"
  ]
  prerequisites "The attacker must have previously compromised the victim's systems or have physical access to the victim's systems."
  prerequisites "Advanced knowledge of software and hardware capabilities of a manufacturer's product."
  skills_required "_networkx_list_start"
  skills_required [
    level "High"
    description "Ability to generate and inject false data into operational data into a system with the intent of causing the victim to alter the configuration of the system."
  ]
  resources_required "[]"
  consequences "[]"
  mitigations "_networkx_list_start"
  mitigations "Ensure that proper access control is implemented on all systems to prevent unauthorized access to system files and processes."
  example_instances "_networkx_list_start"
  example_instances "An adversary wishes to bypass a security system to access an additional network segment where critical data is kept. The adversary knows that some configurations of the security system will allow for remote bypass under certain conditions, such as switching a specific parameter to a different value. The adversary knows the bypass will work but also will be detected within the logging data of the security system. The adversary waits until an upgrade is performed to the security system by the victim's system administrators, and the adversary has access to an external logging system. The adversary injects false log entries that cause the administrators to think there are two different error states within the security system - one involving the specific parameter and the other involving the logging entries. The specific parameter is adjusted to a different value, and the logging level is reduced to a lower level that will not cause an adversary bypass to be detected. The adversary stops injecting false log data, and the administrators of the security system believe the issues were caused by the upgrade and are now resolved. The adversary is then able to bypass the security system."
  related_weaknesses "_networkx_list_start"
  related_weaknesses "284"
  matched_cwes "_networkx_list_start"
  matched_cwes "284"
  taxonomy_mappings "[]"
  execution_flow [
    step "1"
    phase "Explore"
    description "[Determine configuration process] The adversary, through a previously compromised system, either remotely or physically, determines what the configuration process is. They look at configuration files, data files, and running processes on the system to identify areas where they could inject malicious data."
    techniques "[]"
  ]
  execution_flow [
    step "2"
    phase "Explore"
    description "[Determine when configuration occurs] The adversary needs to then determine when configuration or recalibration of a system occurs so they know when to inject malicious data."
    techniques "Look for a weekly update cycle or repeated update schedule."
    techniques "Insert a malicious process into the target system that notifies the adversary when configuration is occurring."
  ]
  execution_flow [
    step "3"
    phase "Experiment"
    description "[Determine malicious data to inject] By looking at the configuration process, the adversary needs to determine what malicious data they want to insert and where to insert it."
    techniques "Add false log data"
    techniques "Change configuration files"
    techniques "Change data files"
  ]
  execution_flow [
    step "4"
    phase "Exploit"
    description "[Inject malicious data] Right before, or during system configuration, the adversary injects the malicious data. This leads to the system behaving in a way that is beneficial to the adversary and is often followed by other attacks."
    techniques "[]"
  ]
  node [
    id 0
    label "look_to_identify_areas_where_they_could_inject_malicious_data"
  ]
  node [
    id 1
    label "determine_when_configuration_occurs"
  ]
  node [
    id 2
    label "alert_the_adversary"
  ]
  node [
    id 3
    label "use_malicious_data"
  ]
  node [
    id 4
    label "add_false_log_data"
  ]
  node [
    id 5
    label "remove_data"
  ]
  node [
    id 6
    label "wish_to_bypass_a_security_system_to_access_an_additional_network_segment_where_critical_data_is_kept"
  ]
  node [
    id 7
    label "wait_until_an_upgrade_is_performed_to_the_security_system_by_the_victim_s_system_administrators"
  ]
  node [
    id 8
    label "inject_false_log_entries_that_cause_the_administrators_to_think_there_are_two_different_error_states_within_the_security_system_one_involving_the_specific_parameter_and_the_other_involving_the_logging_entries"
  ]
  node [
    id 9
    label "modify_the_parameters"
  ]
  node [
    id 10
    label "bypass_the_security_system"
  ]
  node [
    id 11
    label "compromise_the_victim_s_systems"
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
    source 3
    target 6
  ]
  edge [
    source 4
    target 5
  ]
  edge [
    source 4
    target 10
  ]
  edge [
    source 5
    target 3
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
    target 4
  ]
  edge [
    source 10
    target 11
  ]
]
