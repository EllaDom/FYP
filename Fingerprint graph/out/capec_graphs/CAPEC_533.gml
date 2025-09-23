graph [
  directed 1
  capec_id "533"
  name "Malicious Manual Software Update"
  abstraction "Detailed"
  status "Draft"
  description "An attacker introduces malicious code to the victim's system by altering the payload of a software update, allowing for additional compromise or site disruption at the victim location. These manual, or user-assisted attacks, vary from requiring the user to download and run an executable, to as streamlined as tricking the user to click a URL. Attacks which aim at penetrating a specific network infrastructure often rely upon secondary attack methods to achieve the desired impact. Spamming, for example, is a common method employed as an secondary attack vector. Thus the attacker has in their arsenal a choice of initial attack vectors ranging from traditional SMTP/POP/IMAP spamming and its varieties, to web-application mechanisms which commonly implement both chat and rich HTML messaging within the user interface."
  likelihood "Low"
  severity "High"
  related_attack_patterns "_networkx_list_start"
  related_attack_patterns [
    capec_id "186"
    nature "ChildOf"
  ]
  prerequisites "Advanced knowledge about the download and update installation processes."
  prerequisites "Advanced knowledge about the deployed system and its various software subcomponents and processes."
  skills_required "_networkx_list_start"
  skills_required [
    level "High"
    description "Able to develop malicious code that can be used on the victim's system while maintaining normal functionality."
  ]
  resources_required "[]"
  consequences "[]"
  mitigations "_networkx_list_start"
  mitigations "Only accept software updates from an official source."
  example_instances "_networkx_list_start"
  example_instances "An email campaign was initiated, targetting victims of a ransomware attack. The email claimed to be a patch to address the ransomware attack, but was instead an attachment that caused the Cobalt Strike tools to be installed, which enabled further attacks."
  related_weaknesses "_networkx_list_start"
  related_weaknesses "494"
  matched_cwes "_networkx_list_start"
  matched_cwes "494"
  taxonomy_mappings "[]"
  execution_flow "[]"
  node [
    id 0
    label "initiate_an_email_campaign"
  ]
  node [
    id 1
    label "claim_to_be_a_patch_to_address_the_ransomware_attack"
  ]
  node [
    id 2
    label "update_installation_processes"
  ]
  edge [
    source 0
    target 1
  ]
  edge [
    source 1
    target 2
  ]
]
