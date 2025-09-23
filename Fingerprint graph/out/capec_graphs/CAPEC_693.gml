graph [
  directed 1
  capec_id "693"
  name "StarJacking"
  abstraction "Detailed"
  status "Stable"
  description "&#10;            "
  likelihood "Medium"
  severity "High"
  related_attack_patterns "_networkx_list_start"
  related_attack_patterns [
    capec_id "691"
    nature "ChildOf"
  ]
  prerequisites "_networkx_list_start"
  prerequisites "Identification of a popular open-source package whose popularity metadata is to be used for the malicious package."
  skills_required "_networkx_list_start"
  skills_required [
    level "Low"
    description "Ability to provide a package to a package manager and associate a popular package's source code repository URL."
  ]
  resources_required "[]"
  consequences [
    scope "_networkx_list_start"
    scope "Integrity"
    impact "Modify Data"
  ]
  consequences [
    scope "_networkx_list_start"
    scope "Accountability"
    impact "Hide Activities"
  ]
  consequences [
    scope "Access Control"
    scope "Authorization"
    impact "Execute Unauthorized Commands"
  ]
  mitigations "Before downloading open-source packages, perform precursory metadata checks to determine the author(s), frequency of updates, when the software was last updated, and if the software is widely leveraged."
  mitigations "Look for conflicting or non-unique repository references to determine if multiple packages share the same repository reference."
  mitigations "Reference vulnerability databases to determine if the software contains known vulnerabilities."
  mitigations "Only download open-source packages from reputable package managers."
  mitigations "After downloading open-source packages, ensure integrity values have not changed."
  mitigations "Before executing or incorporating the package, leverage automated testing techniques (e.g., static and dynamic analysis) to determine if the software behaves maliciously."
  example_instances "_networkx_list_start"
  example_instances "In April 2022, Checkmarx reported that packages hosted on NPM, PyPi, and Yarn do not properly validate that the provided GitHub repository URL actually pertains to the package being provided. Combined with additional attacks such as TypoSquatting, this allows adversaries to spoof popularity metadata by associating popular GitHub repository URLs with the malicious package. This can further lead to developers unintentionally including the malicious package within their development environments [REF-721]."
  related_weaknesses "_networkx_list_start"
  related_weaknesses "494"
  matched_cwes "_networkx_list_start"
  matched_cwes "494"
  taxonomy_mappings "[]"
  execution_flow [
    step "1"
    phase "Explore"
    description "[Identify target] The adversary must first identify a target package whose popularity statistics will be leveraged. This will be a popular and widely used package, as to increase the perceived pedigree of the malicious package."
    techniques "[]"
  ]
  execution_flow [
    step "2"
    phase "Experiment"
    description "[Spoof package popularity] The adversary provides their malicious package to a package manager and uses the source code repository URL identified in Step 1 to spoof the popularity of the package. This malicious package may also closely resemble the legitimate package whose statistics are being utilized."
    techniques "[]"
  ]
  execution_flow [
    step "3"
    phase "Exploit"
    description "[Exploit victims] The adversary infiltrates development environments with the goal of conducting additional attacks."
    techniques "Active: The adversary attempts to trick victims into downloading the malicious package by means such as phishing and social engineering."
    techniques "Passive: The adversary waits for victims to download and leverage the malicious package."
  ]
  node [
    id 0
    label "identify_a_target_package_whose_popularity_statistics_will_be_leveraged"
  ]
  node [
    id 1
    label "increase_the_perceived_pedigree_of_the_malicious_package"
  ]
  node [
    id 2
    label "provide_their_malicious_package"
  ]
  node [
    id 3
    label "resemble_the_legitimate_package_whose_statistics_are_being_utilized"
  ]
  node [
    id 4
    label "infiltrate_development_environments"
  ]
  node [
    id 5
    label "attempt_to_trick_victims_into_downloading_the_malicious_software_by_means_such_as_phishing_and_social_engineering"
  ]
  node [
    id 6
    label "wait_to_download_and_leverage_malicious_software"
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
]
