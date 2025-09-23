graph [
  directed 1
  capec_id "692"
  name "Spoof Version Control System Commit Metadata"
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
  prerequisites "Identification of a popular open-source repository whose metadata is to be spoofed."
  skills_required "_networkx_list_start"
  skills_required [
    level "Medium"
    description "Ability to spoof a variety of repository metadata to convince victims the source is trusted."
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
  mitigations "Before downloading open-source software, perform precursory metadata checks to determine the author(s), frequency of updates, when the software was last updated, and if the software is widely leveraged."
  mitigations "Reference vulnerability databases to determine if the software contains known vulnerabilities."
  mitigations "Only download open-source software from reputable hosting sites or package managers."
  mitigations "Only download open-source software that has been adequately signed by the developer(s). For repository commits/tags, look for the &#34;Verified&#34; status and for developers leveraging &#34;Vigilant Mode&#34; (GitHub) or similar modes."
  mitigations "After downloading open-source software, ensure integrity values have not changed."
  mitigations "Before executing or incorporating the software, leverage automated testing techniques (e.g., static and dynamic analysis) to determine if the software behaves maliciously."
  example_instances "_networkx_list_start"
  example_instances "In July 2022, Checkmarx reported that GitHub commit metadata could be spoofed if unsigned commits were leveraged by the repository. Adversaries were able to spoof commit contributors, as well as the date/time of the commit. This resulted in commits appearing to originate from trusted developers and a GitHub activity graph that duped users into believing that the repository had been maintained for a significant period of time. The lack of commit metadata validation ultimately allowed adversaries to propagate malware to unsuspecting victims [REF-719] [REF-720]."
  related_weaknesses "_networkx_list_start"
  related_weaknesses "494"
  matched_cwes "_networkx_list_start"
  matched_cwes "494"
  taxonomy_mappings "[]"
  execution_flow [
    step "1"
    phase "Explore"
    description "[Identify target] The adversary must first identify a target repository for them to spoof. Typically, this will be a popular and widely used repository, as to increase the amount of victims a successful attack will exploit."
    techniques "[]"
  ]
  execution_flow [
    step "2"
    phase "Experiment"
    description "[Create malicious repository] The adversary must create a malicious repository that imitates the legitimate repository being spoofed. This may include creating a username that closely matches the legitimate repository owner; creating a repository name that closely matches the legitimate repository name; uploading the legitimate source code; and more."
    techniques "[]"
  ]
  execution_flow [
    step "3"
    phase "Experiment"
    description "[Spoof commit metadata] Once the malicious repository has been created, the adversary must then spoof the commit metadata to make the repository appear to be frequently maintained and originating from trusted sources."
    techniques "Git Commit Timestamps: The adversary generates numerous fake commits while setting the &#34;GIT_AUTHOR_DATE&#34; and &#34;GIT_COMMITTER_DATE&#34; environment variables to a date which is to be spoofed."
    techniques "Git Commit Contributors: The adversary obtains a legitimate and trusted user's email address and then sets this information via the &#34;git config&#34; command. The adversary can then commit changes leveraging this username."
  ]
  execution_flow [
    step "4"
    phase "Exploit"
    description "[Exploit victims] The adversary infiltrates software and/or system environments with the goal of conducting additional attacks."
    techniques "Active: The adversary attempts to trick victims into downloading the malicious software by means such as phishing and social engineering."
    techniques "Passive: The adversary waits for victims to download and leverage malicious software."
  ]
  node [
    id 0
    label "identify_a_target_repository_for_them"
  ]
  node [
    id 1
    label "increase_the_amount_of_victims"
  ]
  node [
    id 2
    label "create_malicious_repository"
  ]
  node [
    id 3
    label "include_creating_a_username_that_closely_matches_the_legitimate_repository_owner_creating_a_repository_name_that_closely_matches_the_legitimate_repository_name_uploading_the_legitimate_source_code_and_more"
  ]
  node [
    id 4
    label "commit_metadata"
  ]
  node [
    id 5
    label "generate_numerous_fake_commits"
  ]
  node [
    id 6
    label "obtain_a_legitimate_and_trusted_user_s_email_address"
  ]
  node [
    id 7
    label "commit_changes_leveraging_this_username"
  ]
  node [
    id 8
    label "infiltrate_software_and_or_system_environments_with_the_goal_of_conducting_additional_attacks"
  ]
  node [
    id 9
    label "attempt_to_trick_victims_into_downloading_the_malicious_software_by_means_such_as_phishing_and_social_engineering"
  ]
  node [
    id 10
    label "wait_to_download_and_leverage_malicious_software"
  ]
  node [
    id 11
    label "spoof_commit_contributors"
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
]
