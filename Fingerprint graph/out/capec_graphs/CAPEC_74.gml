graph [
  directed 1
  capec_id "74"
  name "Manipulating State"
  abstraction "Meta"
  status "Stable"
  description "&#10;            "
  likelihood "Medium"
  severity "High"
  related_attack_patterns "[]"
  prerequisites "User state is maintained at least in some way in user-controllable locations, such as cookies or URL parameters."
  prerequisites "There is a faulty finite state machine in the hardware logic that can be exploited."
  skills_required "_networkx_list_start"
  skills_required [
    level "Medium"
    description "The adversary needs to have knowledge of state management as employed by the target application, and also the ability to manipulate the state in a meaningful way."
  ]
  resources_required "_networkx_list_start"
  resources_required "The adversary needs a data tampering tool capable of generating and creating custom inputs to aid in the attack, like Fiddler, Wireshark, or a similar in-browser plugin (e.g., Tamper Data for Firefox)."
  consequences [
    scope "Confidentiality"
    scope "Access Control"
    scope "Authorization"
    impact "Gain Privileges"
  ]
  consequences [
    scope "_networkx_list_start"
    scope "Integrity"
    impact "Modify Data"
  ]
  consequences [
    scope "_networkx_list_start"
    scope "Availability"
    impact "Unreliable Execution"
  ]
  mitigations "Do not rely solely on user-controllable locations, such as cookies or URL parameters, to maintain user state."
  mitigations "Avoid sensitive information, such as usernames or authentication and authorization information, in user-controllable locations."
  mitigations "Sensitive information that is part of the user state must be appropriately protected to ensure confidentiality and integrity at each request."
  mitigations "All possible states must be handled by hardware finite state machines."
  example_instances "_networkx_list_start"
  example_instances "During the authentication process, an application stores the authentication decision (auth=0/1) in unencrypted cookies. At every request, this cookie is checked to permit or deny a request. An adversary can easily violate this representation of user state and set auth=1 at every request in order to gain illegitimate access and elevated privilege in the application."
  related_weaknesses "372"
  related_weaknesses "315"
  related_weaknesses "353"
  related_weaknesses "693"
  related_weaknesses "1245"
  related_weaknesses "1253"
  related_weaknesses "1265"
  related_weaknesses "1271"
  matched_cwes "_networkx_list_start"
  matched_cwes "693"
  taxonomy_mappings "[]"
  execution_flow [
    step "1"
    phase "Explore"
    description "Adversary determines the nature of state management employed by the target. This includes determining the location (client-side, server-side or both applications) and possibly the items stored as part of user state."
    techniques "[]"
  ]
  execution_flow [
    step "2"
    phase "Experiment"
    description "The adversary now tries to modify the user state contents (possibly indiscriminately if the contents are encrypted or otherwise obfuscated) or cause a state transition and observe the effects of this change on the target."
    techniques "[]"
  ]
  execution_flow [
    step "3"
    phase "Exploit"
    description "Having determined how to manipulate the state, the adversary can perform illegitimate actions."
    techniques "[]"
  ]
  node [
    id 0
    label "determine_the_nature_of_state_management_employed_by_the_target"
  ]
  node [
    id 1
    label "include_determining_the_location_client_side_server_side_or_both_applications_and_possibly_the_items_stored_as_part_of_user_state"
  ]
  node [
    id 2
    label "try_to_modify_the_user_state_contents"
  ]
  node [
    id 3
    label "determine_how_to_manipulate_the_state"
  ]
  node [
    id 4
    label "store_the_authentication_decision_auth_0_1_in_unencrypted_cookies"
  ]
  node [
    id 5
    label "check_this_cookie"
  ]
  node [
    id 6
    label "violate_this_representation_of_user_state"
  ]
  node [
    id 7
    label "maintain_user_state"
  ]
  node [
    id 8
    label "exploit_that"
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
    source 6
    target 7
  ]
  edge [
    source 7
    target 8
  ]
]
