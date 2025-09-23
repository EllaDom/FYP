graph [
  directed 1
  capec_id "573"
  name "Process Footprinting"
  abstraction "Standard"
  status "Stable"
  description "An adversary exploits functionality meant to identify information about the currently running processes on the target system to an authorized user. By knowing what processes are running on the target system, the adversary can learn about the target environment as a means towards further malicious behavior."
  likelihood "Low"
  severity "Low"
  related_attack_patterns "_networkx_list_start"
  related_attack_patterns [
    capec_id "169"
    nature "ChildOf"
  ]
  prerequisites "_networkx_list_start"
  prerequisites "The adversary must have gained access to the target system via physical or logical means in order to carry out this attack."
  skills_required "[]"
  resources_required "[]"
  consequences [
    scope "_networkx_list_start"
    scope "Confidentiality"
    impact "Other"
  ]
  consequences [
    scope "Confidentiality"
    scope "Access Control"
    scope "Authorization"
    impact "Bypass Protection Mechanism"
  ]
  mitigations "_networkx_list_start"
  mitigations "Identify programs that may be used to acquire process information and block them by using a software restriction policy or tools that restrict program execution by using a process allowlist."
  example_instances "On a Windows system, the command, &#34;tasklist,&#34; displays information about processes. The same function on a Mac OS system is done with the command, &#34;ps.&#34;"
  example_instances "In addition to manual discovery of running processes, an adversary can develop malware that carries out this attack pattern before subsequent malicious action."
  related_weaknesses "_networkx_list_start"
  related_weaknesses "200"
  matched_cwes "_networkx_list_start"
  matched_cwes "200"
  taxonomy_mappings "_networkx_list_start"
  taxonomy_mappings [
    taxonomy_name "ATTACK"
    entry_id "1057"
    entry_name "Process Discovery"
  ]
  execution_flow "[]"
  node [
    id 0
    label "display_information_about_processes"
  ]
  node [
    id 1
    label "do_the_same_function_on_a_mac_os_system"
  ]
  node [
    id 2
    label "develop_malware_that_carries_out_this_attack_pattern_before_subsequent_malicious_action"
  ]
  node [
    id 3
    label "gain_access_to_the_target_system"
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
