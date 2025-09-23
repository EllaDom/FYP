graph [
  directed 1
  capec_id "508"
  name "Shoulder Surfing"
  abstraction "Detailed"
  status "Draft"
  description "In a shoulder surfing attack, an adversary observes an unaware individual's keystrokes, screen content, or conversations with the goal of obtaining sensitive information. One motive for this attack is to obtain sensitive information about the target for financial, personal, political, or other gains. From an insider threat perspective, an additional motive could be to obtain system/application credentials or cryptographic keys. Shoulder surfing attacks are accomplished by observing the content &#34;over the victim's shoulder&#34;, as implied by the name of this attack."
  likelihood "High"
  severity "High"
  related_attack_patterns [
    capec_id "651"
    nature "ChildOf"
  ]
  related_attack_patterns [
    capec_id "560"
    nature "CanPrecede"
  ]
  prerequisites "_networkx_list_start"
  prerequisites "The adversary typically requires physical proximity to the target's environment, in order to observe their screen or conversation. This may not be the case if the adversary is able to record the target and obtain sensitive information upon review of the recording."
  skills_required "_networkx_list_start"
  skills_required [
    level "Low"
    description "In most cases, an adversary can simply observe and retain the desired information."
  ]
  resources_required "[]"
  consequences "_networkx_list_start"
  consequences [
    scope "_networkx_list_start"
    scope "Confidentiality"
    impact "Read Data"
  ]
  mitigations "Be mindful of your surroundings when discussing or viewing sensitive information in public areas."
  mitigations "Pertaining to insider threats, ensure that sensitive information is not displayed to nor discussed around individuals without need-to-know access to said information."
  example_instances "An adversary can capture a target's banking credentials and transfer money to adversary-controlled accounts."
  example_instances "An adversary observes the target's mobile device lock screen pattern/passcode and then steals the device, which can now be unlocked."
  example_instances "An insider could obtain database credentials for an application and sell the credentials on the black market."
  example_instances "An insider overhears a conversation pertaining to classified information, which could then be posted on an anonymous online forum."
  related_weaknesses "200"
  related_weaknesses "359"
  matched_cwes "200"
  matched_cwes "359"
  taxonomy_mappings "[]"
  execution_flow "[]"
  node [
    id 0
    label "capture_a_target_s_banking_credentials"
  ]
  node [
    id 1
    label "observe_the_target_s_mobile_device_lock_screen_pattern_passcode"
  ]
  node [
    id 2
    label "obtain_database_credentials_for_an_application"
  ]
  node [
    id 3
    label "overhear_a_conversation_pertaining_to_classified_information_which_could_then_be_posted_on_an_anonymous_online_forum"
  ]
  node [
    id 4
    label "require_physical_proximity"
  ]
  node [
    id 5
    label "record_the_target"
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
