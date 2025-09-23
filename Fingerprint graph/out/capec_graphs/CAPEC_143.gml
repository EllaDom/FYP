graph [
  directed 1
  capec_id "143"
  name "Detect Unpublicized Web Pages"
  abstraction "Detailed"
  status "Draft"
  description "An adversary searches a targeted web site for web pages that have not been publicized. In doing this, the adversary may be able to gain access to information that the targeted site did not intend to make public."
  likelihood ""
  severity "Low"
  related_attack_patterns "_networkx_list_start"
  related_attack_patterns [
    capec_id "150"
    nature "ChildOf"
  ]
  prerequisites "_networkx_list_start"
  prerequisites "The targeted web site must include pages within its published tree that are not connected to its tree of links. The sensitivity of the content of these pages determines the severity of this attack."
  skills_required "[]"
  resources_required "_networkx_list_start"
  resources_required "Spidering tools to explore the target web site are extremely useful in this attack especially when attacking large sites. Some tools might also be able to automatically construct common page locations from known paths."
  consequences "[]"
  mitigations "[]"
  example_instances "[]"
  related_weaknesses "_networkx_list_start"
  related_weaknesses "425"
  matched_cwes "_networkx_list_start"
  matched_cwes "425"
  taxonomy_mappings "[]"
  execution_flow [
    step "1"
    phase "Explore"
    description "[Find target web site] An adversary finds a target web site that they think may have unpublicized web pages"
    techniques "[]"
  ]
  execution_flow [
    step "2"
    phase "Explore"
    description "[Map the published web site] The adversary will map the published web site either by using an automated tool or by manually accessing well-known debugging or logging pages, or otherwise predictable pages within the site tree"
    techniques "Use Dirbuster to brute force directories and file names to find unpublicized pages"
    techniques "Find a pattern in the naming of documents and extrapolate this pattern to discover additional documents that have been created but are no longer externally linked"
  ]
  execution_flow [
    step "3"
    phase "Experiment"
    description "[Try to find weaknesses or information] The adversary will try to find weaknesses or information on the unpublicized pages that the targeted site did not intend to be public"
    techniques "Manually analyze files or pages for information that could be useful in a further attack"
    techniques "Use a static analysis tool to find weaknesses in unpublished web pages"
  ]
  execution_flow [
    step "4"
    phase "Exploit"
    description "[Follow-up attack] Use any information or weaknesses found to carry out a follow-up attack"
    techniques "[]"
  ]
  node [
    id 0
    label "find_target_web_site"
  ]
  node [
    id 1
    label "find_a_target_web_site_they_think_that_may_have_unpublicized_web_pages"
  ]
  node [
    id 2
    label "map_the_published_web_site"
  ]
  node [
    id 3
    label "brute_force_directories"
  ]
  node [
    id 4
    label "find_a_pattern_in_the_naming_of_documents"
  ]
  node [
    id 5
    label "find_weaknesses"
  ]
  node [
    id 6
    label "try_to_find_weaknesses_or_information_on_the_unpublicized_pages_that_the_targeted_site_did_not_intend_to_be_public"
  ]
  node [
    id 7
    label "analyze_files_or_pages_for_information_that_could_be_useful_in_a_further_attack"
  ]
  node [
    id 8
    label "determine_the_severity_of_this_attack"
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
    source 5
    target 8
  ]
  edge [
    source 6
    target 7
  ]
  edge [
    source 7
    target 5
  ]
]
