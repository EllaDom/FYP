graph [
  directed 1
  capec_id "121"
  name "Exploit Non-Production Interfaces"
  abstraction "Standard"
  status "Stable"
  description "&#10;            "
  likelihood "Low"
  severity "High"
  related_attack_patterns "_networkx_list_start"
  related_attack_patterns [
    capec_id "113"
    nature "ChildOf"
  ]
  prerequisites "_networkx_list_start"
  prerequisites "The target must have configured non-production interfaces and failed to secure or remove them when brought into a production environment."
  skills_required "_networkx_list_start"
  skills_required [
    level "High"
    description "Exploiting non-production interfaces requires significant skill and knowledge about the potential non-production interfaces left enabled in production."
  ]
  resources_required "_networkx_list_start"
  resources_required "For some interfaces, the adversary will need that appropriate client application or hardware that interfaces with the interface. Other non-production interfaces can be executed using simple tools, such as web browsers or console windows. In some cases, an adversary may need to be able to authenticate to the target before it can access the vulnerable interface."
  consequences [
    scope "Confidentiality"
    scope "Access Control"
    scope "Authentication"
    impact "Gain Privileges"
  ]
  consequences [
    scope "Confidentiality"
    scope "Access Control"
    scope "Authorization"
    impact "Read Data"
  ]
  consequences [
    scope "Access Control"
    scope "Integrity"
    impact "Modify Data"
  ]
  mitigations "_networkx_list_start"
  mitigations "Ensure that production systems do not contain non-production interfaces and that these interfaces are only used in development environments."
  example_instances "Some software applications include application programming interfaces (APIs) that are intended to allow an administrator to test and refine their domain. These APIs are typically disabled once a system enters a production environment, but may be left in an insecure state due to a configuration error or mismanagement."
  example_instances "Many hardware systems leverage bits typically reserved for future functionality for testing and debugging purposes. If these reserved bits remain enabled in a production environment, it could allow an adversary to induce unwanted/unsupported behavior in the hardware."
  related_weaknesses "489"
  related_weaknesses "1209"
  related_weaknesses "1259"
  related_weaknesses "1267"
  related_weaknesses "1270"
  related_weaknesses "1294"
  related_weaknesses "1295"
  related_weaknesses "1296"
  related_weaknesses "1302"
  related_weaknesses "1313"
  matched_cwes "_networkx_list_start"
  matched_cwes "1259"
  taxonomy_mappings "[]"
  execution_flow [
    step "1"
    phase "Explore"
    description "[Determine Vulnerable Interface] An adversary explores a target system for sample or test interfaces that have not been disabled by a system administrator and which may be exploitable by the adversary."
    techniques "_networkx_list_start"
    techniques "If needed, the adversary explores an organization's network to determine if any specific systems of interest exist."
  ]
  execution_flow [
    step "2"
    phase "Exploit"
    description "[Leverage Test Interface to Execute Attacks] Once an adversary has discovered a system with a non-production interface, the interface is leveraged to exploit the system and/or conduct various attacks."
    techniques "_networkx_list_start"
    techniques "The adversary can leverage the sample or test interface to conduct several types of attacks such as Adversary-in-the-Middle attacks (CAPEC-94), keylogging, Cross Site Scripting (XSS), hardware manipulation attacks, and more."
  ]
  node [
    id 0
    label "determine_vulnerable_interface"
  ]
  node [
    id 1
    label "explore_a_target_system_for_sample_or_test_interfaces_that_have_not_been_disabled_by_a_system_administrator_and"
  ]
  node [
    id 2
    label "leverage_the_sample_or_test_interface"
  ]
  node [
    id 3
    label "include_application_programming_interfaces_apis_that_are_intended_to_allow_an_administrator_to_test_and_refine_their_domain"
  ]
  node [
    id 4
    label "enter_a_production_environment"
  ]
  node [
    id 5
    label "configure_non_production_interfaces"
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
]
