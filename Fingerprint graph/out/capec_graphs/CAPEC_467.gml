graph [
  directed 1
  capec_id "467"
  name "Cross Site Identification"
  abstraction "Detailed"
  status "Draft"
  description "An attacker harvests identifying information about a victim via an active session that the victim's browser has with a social networking site. A victim may have the social networking site open in one tab or perhaps is simply using the &#34;remember me&#34; feature to keep their session with the social networking site active. An attacker induces a payload to execute in the victim's browser that transparently to the victim initiates a request to the social networking site (e.g., via available social network site APIs) to retrieve identifying information about a victim. While some of this information may be public, the attacker is able to harvest this information in context and may use it for further attacks on the user (e.g., spear phishing)."
  likelihood ""
  severity "Low"
  related_attack_patterns "_networkx_list_start"
  related_attack_patterns [
    capec_id "62"
    nature "ChildOf"
  ]
  prerequisites "_networkx_list_start"
  prerequisites "The victim has an active session with the social networking site."
  skills_required [
    level "High"
    description "An attacker should be able to create a payload and deliver it to the victim's browser."
  ]
  skills_required [
    level "Medium"
    description "An attacker needs to know how to interact with various social networking sites (e.g., via available APIs) to request information and how to send the harvested data back to the attacker."
  ]
  resources_required "[]"
  consequences "[]"
  mitigations "Usage: Users should always explicitly log out from the social networking sites when done using them."
  mitigations "Usage: Users should not open other tabs in the browser when using a social networking site."
  example_instances "_networkx_list_start"
  example_instances "An attacker may post a malicious posting that contains an image with an embedded link. The link actually requests identifying information from the social networking site. A victim who views the malicious posting in their browser will have sent identifying information to the attacker, as long as the victim had an active session with the social networking site."
  related_weaknesses "352"
  related_weaknesses "359"
  matched_cwes "352"
  matched_cwes "359"
  taxonomy_mappings "[]"
  execution_flow "[]"
  node [
    id 0
    label "post_a_malicious_posting_that_contains_an_image_with_an_embedded_link"
  ]
  node [
    id 1
    label "request_identifying_information_from_the_social_networking_site"
  ]
  node [
    id 2
    label "view_the_malicious_posting_in_their_browser"
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
