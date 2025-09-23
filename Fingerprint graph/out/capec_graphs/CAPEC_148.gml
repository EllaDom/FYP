graph [
  directed 1
  capec_id "148"
  name "Content Spoofing"
  abstraction "Meta"
  status "Stable"
  description "An adversary modifies content to make it contain something other than what the original content producer intended while keeping the apparent source of the content unchanged. The term content spoofing is most often used to describe modification of web pages hosted by a target to display the adversary's content instead of the owner's content. However, any content can be spoofed, including the content of email messages, file transfers, or the content of other network communication protocols. Content can be modified at the source (e.g. modifying the source file for a web page) or in transit (e.g. intercepting and modifying a message between the sender and recipient). Usually, the adversary will attempt to hide the fact that the content has been modified, but in some cases, such as with web site defacement, this is not necessary. Content Spoofing can lead to malware exposure, financial fraud (if the content governs financial transactions), privacy violations, and other unwanted outcomes."
  likelihood "Medium"
  severity "Medium"
  related_attack_patterns "[]"
  prerequisites "_networkx_list_start"
  prerequisites "The target must provide content but fail to adequately protect it against modification.The adversary must have the means to alter data to which they are not authorized. If the content is to be modified in transit, the adversary must be able to intercept the targeted messages."
  skills_required "[]"
  resources_required "_networkx_list_start"
  resources_required "If the content is to be modified in transit, the adversary requires a tool capable of intercepting the target's communication and generating/creating custom packets to impact the communications. In some variants, the targeted content is altered so that all or some of it is redirected towards content published by the attacker (for example, images and frames in the target's web site might be modified to be loaded from a source controlled by the attacker). In these cases, the attacker requires the necessary resources to host the replacement content."
  consequences "_networkx_list_start"
  consequences [
    scope "_networkx_list_start"
    scope "Integrity"
    impact "Modify Data"
  ]
  mitigations "[]"
  example_instances "[]"
  related_weaknesses "_networkx_list_start"
  related_weaknesses "345"
  matched_cwes "_networkx_list_start"
  matched_cwes "345"
  taxonomy_mappings [
    taxonomy_name "ATTACK"
    entry_id "1491"
    entry_name "Defacement"
  ]
  taxonomy_mappings [
    taxonomy_name "WASC"
    entry_id "12"
    entry_name "Content Spoofing"
  ]
  taxonomy_mappings [
    taxonomy_name "OWASP Attacks"
    entry_id ""
    entry_name "Content Spoofing"
  ]
  execution_flow "[]"
  node [
    id 0
    label "post_content"
  ]
  node [
    id 1
    label "alter_data_to_which_they_are_not_authorized"
  ]
  edge [
    source 0
    target 1
  ]
]
