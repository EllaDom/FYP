graph [
  directed 1
  capec_id "222"
  name "iFrame Overlay"
  abstraction "Detailed"
  status "Draft"
  description "In an iFrame overlay attack the victim is tricked into unknowingly initiating some action in one system while interacting with the UI from seemingly completely different system."
  likelihood "Medium"
  severity "High"
  related_attack_patterns "_networkx_list_start"
  related_attack_patterns [
    capec_id "103"
    nature "ChildOf"
  ]
  prerequisites "_networkx_list_start"
  prerequisites "The victim is communicating with the target application via a web based UI and not a thick client. The victim's browser security policies allow iFrames. The victim uses a modern browser that supports UI elements like clickable buttons (i.e. not using an old text only browser). The victim has an active session with the target system. The target system's interaction window is open in the victim's browser and supports the ability for initiating sensitive actions on behalf of the user in the target system."
  skills_required "_networkx_list_start"
  skills_required [
    level "High"
    description "Crafting the proper malicious site and luring the victim to this site is not a trivial task."
  ]
  resources_required "_networkx_list_start"
  resources_required "None: No specialized resources are required to execute this type of attack."
  consequences [
    scope "_networkx_list_start"
    scope "Integrity"
    impact "Modify Data"
  ]
  consequences [
    scope "_networkx_list_start"
    scope "Confidentiality"
    impact "Read Data"
  ]
  consequences [
    scope "_networkx_list_start"
    scope "Authorization"
    impact "Execute Unauthorized Commands"
  ]
  consequences [
    scope "Accountability"
    scope "Authentication"
    scope "Authorization"
    scope "Non-Repudiation"
    impact "Gain Privileges"
  ]
  consequences [
    scope "Access Control"
    scope "Authorization"
    impact "Bypass Protection Mechanism"
  ]
  mitigations "Configuration: Disable iFrames in the Web browser."
  mitigations "Operation: When maintaining an authenticated session with a privileged target system, do not use the same browser to navigate to unfamiliar sites to perform other activities. Finish working with the target system and logout first before proceeding to other tasks."
  mitigations "Operation: If using the Firefox browser, use the NoScript plug-in that will help forbid iFrames."
  example_instances "_networkx_list_start"
  example_instances "The following example is a real-world iFrame overlay attack [2]. In this attack, the malicious page embeds Twitter.com on a transparent IFRAME. The status-message field is initialized with the URL of the malicious page itself. To provoke the click, which is necessary to publish the entry, the malicious page displays a button labeled &#34;Don't Click.&#34; This button is aligned with the invisible &#34;Update&#34; button of Twitter. Once the user performs the click, the status message (i.e., a link to the malicious page itself) is posted to their Twitter profile."
  related_weaknesses "_networkx_list_start"
  related_weaknesses "1021"
  matched_cwes "_networkx_list_start"
  matched_cwes "1021"
  taxonomy_mappings "[]"
  execution_flow [
    step "1"
    phase "Explore"
    description "[Craft an iFrame Overlay page] The adversary crafts a malicious iFrame overlay page."
    techniques "_networkx_list_start"
    techniques "The adversary leverages iFrame overlay capabilities to craft a malicious iFrame overlay page."
  ]
  execution_flow [
    step "2"
    phase "Exploit"
    description "[adversary tricks victim to load the iFrame overlay page] adversary utilizes some form of temptation, misdirection or coercion to trick the victim to loading and interacting with the iFrame overlay page in a way that increases the chances that the victim will visit the malicious page."
    techniques "Trick the victim to the malicious site by sending the victim an e-mail with a URL to the site."
    techniques "Trick the victim to the malicious site by manipulating URLs on a site trusted by the victim."
    techniques "Trick the victim to the malicious site through a cross-site scripting attack."
  ]
  execution_flow [
    step "3"
    phase "Exploit"
    description "[Trick victim into interacting with the iFrame overlay page in the desired manner] The adversary tricks the victim into clicking on the areas of the UI which contain the hidden action controls and thereby interacts with the target system maliciously with the victim's level of privilege."
    techniques "Hide action controls over very commonly used functionality."
    techniques "Hide action controls over very psychologically tempting content."
  ]
  node [
    id 0
    label "craft_an_iframe_overlay_page"
  ]
  node [
    id 1
    label "leverage_iframe_overlay_capabilities"
  ]
  node [
    id 2
    label "trick_the_victim"
  ]
  node [
    id 3
    label "hide_action_controls_over_very_commonly_used_functionality"
  ]
  node [
    id 4
    label "hide_action_controls_over_very_psychologically_tempting_content"
  ]
  node [
    id 5
    label "embed_twitter_com"
  ]
  node [
    id 6
    label "initialize_the_status_message_field"
  ]
  node [
    id 7
    label "provoke_the_click_which_is_necessary_to_publish_the_entry"
  ]
  node [
    id 8
    label "align_this_button"
  ]
  node [
    id 9
    label "perform_the_click"
  ]
  node [
    id 10
    label "allow_iframes"
  ]
  node [
    id 11
    label "support_ui_elements"
  ]
  node [
    id 12
    label "have_an_active_session_with_the_target_system"
  ]
  node [
    id 13
    label "support_the_ability_for_initiating_sensitive_actions_on_behalf_of_the_user_in_the_target_system"
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
  edge [
    source 11
    target 12
  ]
  edge [
    source 12
    target 13
  ]
]
