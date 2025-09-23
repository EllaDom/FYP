graph [
  directed 1
  capec_id "186"
  name "Malicious Software Update"
  abstraction "Standard"
  status "Draft"
  description "An adversary uses deceptive methods to cause a user or an automated process to download and install dangerous code believed to be a valid update that originates from an adversary controlled source."
  likelihood ""
  severity "High"
  related_attack_patterns [
    capec_id "184"
    nature "ChildOf"
  ]
  related_attack_patterns [
    capec_id "98"
    nature "CanFollow"
  ]
  prerequisites "[]"
  skills_required "_networkx_list_start"
  skills_required [
    level "High"
    description "This attack requires advanced cyber capabilities"
  ]
  resources_required "_networkx_list_start"
  resources_required "Manual or user-assisted attacks require deceptive mechanisms to trick the user into clicking a link or downloading and installing software. Automated update attacks require the adversary to host a payload and then trigger the installation of the payload code."
  consequences "_networkx_list_start"
  consequences [
    scope "Access Control"
    scope "Availability"
    scope "Confidentiality"
    impact "Execute Unauthorized Commands"
  ]
  mitigations "_networkx_list_start"
  mitigations "Validate software updates before installing."
  example_instances "_networkx_list_start"
  example_instances "Using an automated process to download and install dangerous code was key part of the NotPeyta attack [REF-697]"
  related_weaknesses "_networkx_list_start"
  related_weaknesses "494"
  matched_cwes "_networkx_list_start"
  matched_cwes "494"
  taxonomy_mappings "_networkx_list_start"
  taxonomy_mappings [
    taxonomy_name "ATTACK"
    entry_id "1195.002"
    entry_name "Supply Chain Compromise: Compromise Software Supply Chain"
  ]
  execution_flow [
    step "1"
    phase "Explore"
    description "[Identify target] The adversary must first identify what they want their target to be. Because malicious software updates can be carried out in a variety of ways, the adversary will first not only identify a target program, but also what users they wish to target. This attack can be targeted (a particular user or group of users) or untargeted (many different users)."
    techniques "[]"
  ]
  execution_flow [
    step "2"
    phase "Experiment"
    description "[Craft a deployment mechanism based on the target] The adversary must craft a deployment mechanism to deploy the malicious software update. This mechanism will differ based on if the attack is targeted or untargeted."
    techniques "Targeted attack: hosting what appears to be a software update, then harvesting actual email addresses for an organization, or generating commonly used email addresses, and then sending spam, phishing, or spear-phishing emails to the organization's users requesting that they manually download and install the malicious software update."
    techniques "Targeted attack: Instant Messaging virus payload, which harvests the names from a user's contact list and sends instant messages to those users to download and apply the update"
    techniques "Untargeted attack: Spam the malicious update to as many users as possible through unsolicited email, instant messages, or social media messages."
    techniques "Untargeted attack: Send phishing emails to as many users as possible and pretend to be a legitimate source suggesting to download an important software update."
    techniques "Untargeted attack: Use trojans/botnets to aid in either of the two untargeted attacks."
  ]
  execution_flow [
    step "3"
    phase "Exploit"
    description "[Deploy malicious software update] Using the deployment mechanism from the previous step, the adversary gets a user to install the malicious software update."
    techniques "[]"
  ]
  node [
    id 0
    label "carry_malicious_software_updates"
  ]
  node [
    id 1
    label "target_a_particular_user_or_group_of_users_or"
  ]
  node [
    id 2
    label "craft_a_deployment_mechanism_based_on_the_target"
  ]
  node [
    id 3
    label "harvest_the_names"
  ]
  node [
    id 4
    label "spam_the_malicious_update_to_as_many_users_as_possible"
  ]
  node [
    id 5
    label "send_a_phishing_email"
  ]
  edge [
    source 0
    target 1
  ]
  edge [
    source 0
    target 3
  ]
  edge [
    source 1
    target 2
  ]
  edge [
    source 2
    target 0
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
    target 0
  ]
]
