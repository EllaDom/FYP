graph [
  directed 1
  capec_id "538"
  name "Open-Source Library Manipulation"
  abstraction "Detailed"
  status "Stable"
  description "Adversaries implant malicious code in open source software (OSS) libraries to have it widely distributed, as OSS is commonly downloaded by developers and other users to incorporate into software development projects. The adversary can have a particular system in mind to target, or the implantation can be the first stage of follow-on attacks on many systems."
  likelihood "Low"
  severity "High"
  related_attack_patterns "_networkx_list_start"
  related_attack_patterns [
    capec_id "444"
    nature "ChildOf"
  ]
  prerequisites "_networkx_list_start"
  prerequisites "Access to the open source code base being used by the manufacturer in a system being developed or currently deployed at a victim location."
  skills_required "_networkx_list_start"
  skills_required [
    level "High"
    description "Advanced knowledge about the inclusion and specific usage of an open source code project within system being targeted for infiltration."
  ]
  resources_required "[]"
  consequences "[]"
  mitigations "[]"
  example_instances "_networkx_list_start"
  example_instances "An adversary with access to an open source code project introduces a hard-to-find bug in the software that allows under very specific conditions for encryption to be disabled on data streams. The adversary commits the change to the code which is picked up by a manufacturer who develops VPN software. It is eventually deployed at the victim's location where the very specific conditions are met giving the adversary the ability to sniff plaintext traffic thought to be encrypted. This can provide to the adversary access to sensitive data of the victim."
  related_weaknesses "494"
  related_weaknesses "829"
  matched_cwes "494"
  matched_cwes "829"
  taxonomy_mappings "_networkx_list_start"
  taxonomy_mappings [
    taxonomy_name "ATTACK"
    entry_id "1195.001"
    entry_name "Supply Chain Compromise: Software Dependencies and Development Tools"
  ]
  execution_flow [
    step "1"
    phase "Explore"
    description "[Determine the relevant open-source code project to target] The adversary will make the selection based on various criteria:"
    techniques "[]"
  ]
  execution_flow [
    step "2"
    phase "Experiment"
    description "[Develop a plan for malicious contribution] The adversary develops a plan to contribute malicious code, taking the following into consideration:"
    techniques "[]"
  ]
  execution_flow [
    step "3"
    phase "Exploit"
    description "[Execute the plan for malicious contribution] Write the code to be contributed based on the plan and then submit the contribution. Multiple commits, possibly using multiple identities, will help obscure the attack. Monitor the contribution site to try to determine if the code has been uploaded to the target system."
    techniques "[]"
  ]
  node [
    id 0
    label "determine_the_relevant_open_source_code_project"
  ]
  node [
    id 1
    label "make_the_selection"
  ]
  node [
    id 2
    label "develop_a_plan_for_malicious_contribution"
  ]
  node [
    id 3
    label "help_obscure_the_attack"
  ]
  node [
    id 4
    label "monitor_the_contribution_site"
  ]
  node [
    id 5
    label "introduce_a_hard_to_find_bug_in_the_software_that_allows_under_very_specific_conditions_for_encryption_to_be_disabled_on_data_streams"
  ]
  node [
    id 6
    label "commit_the_change_to_the_code_which_is_picked_up_by_a_manufacturer_who_develops_vpn_software"
  ]
  node [
    id 7
    label "deploy_it"
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
]
