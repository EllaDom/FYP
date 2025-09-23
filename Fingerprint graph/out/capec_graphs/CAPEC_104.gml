graph [
  directed 1
  capec_id "104"
  name "Cross Zone Scripting"
  abstraction "Standard"
  status "Draft"
  description "An attacker is able to cause a victim to load content into their web-browser that bypasses security zone controls and gain access to increased privileges to execute scripting code or other web objects such as unsigned ActiveX controls or applets. This is a privilege elevation attack targeted at zone-based web-browser security."
  likelihood "Medium"
  severity "High"
  related_attack_patterns "_networkx_list_start"
  related_attack_patterns [
    capec_id "233"
    nature "ChildOf"
  ]
  prerequisites "_networkx_list_start"
  prerequisites "The target must be using a zone-aware browser."
  skills_required "_networkx_list_start"
  skills_required [
    level "Medium"
    description "Ability to craft malicious scripts or find them elsewhere and ability to identify functionality that is running web controls in the local zone and to find an injection vector into that functionality"
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
    scope "Confidentiality"
    scope "Access Control"
    scope "Authorization"
    impact "Gain Privileges"
  ]
  consequences [
    scope "Confidentiality"
    scope "Integrity"
    scope "Availability"
    impact "Execute Unauthorized Commands"
  ]
  mitigations "Disable script execution."
  mitigations "Ensure that sufficient input validation is performed for any potentially untrusted data before it is used in any privileged context or zone"
  mitigations "Limit the flow of untrusted data into the privileged areas of the system that run in the higher trust zone"
  mitigations "Limit the sites that are being added to the local machine zone and restrict the privileges of the code running in that zone to the bare minimum"
  mitigations "Ensure proper HTML output encoding before writing user supplied data to the page"
  example_instances "_networkx_list_start"
  example_instances "There was a cross zone scripting vulnerability discovered in Skype that allowed one user to upload a video with a maliciously crafted title that contains a script. Subsequently, when the victim attempts to use the &#34;add video to chat&#34; feature on attacker's video, the script embedded in the title of the video runs with local zone privileges. Skype is using IE web controls to render internal and external HTML pages. &#34;Add video to chat&#34; uses these web controls and they are running in the Local Zone. Any user who searched for the video in Skype with the same keywords as in the title field, would have the attackers' code executing in their browser with local zone privileges to their host machine (e.g. applications on the victim's host system could be executed)."
  related_weaknesses "250"
  related_weaknesses "638"
  related_weaknesses "285"
  related_weaknesses "116"
  related_weaknesses "20"
  matched_cwes "285"
  matched_cwes "250"
  matched_cwes "20"
  matched_cwes "116"
  taxonomy_mappings "[]"
  execution_flow [
    step "1"
    phase "Explore"
    description "[Find systems susceptible to the attack] Find systems that contain functionality that is accessed from both the internet zone and the local zone. There needs to be a way to supply input to that functionality from the internet zone and that original input needs to be used later on a page from a local zone."
    techniques "_networkx_list_start"
    techniques "Leverage knowledge of common local zone functionality on targeted platforms to guide attempted injection of code through relevant internet zone mechanisms. In some cases this may be due to standard system configurations enabling shared functionality between internet and local zones. The attacker can search for indicators that these standard configurations are in place."
  ]
  execution_flow [
    step "2"
    phase "Experiment"
    description "[Find the insertion point for the payload] The attacker first needs to find some system functionality or possibly another weakness in the system (e.g. susceptibility to cross site scripting) that would provide the attacker with a mechanism to deliver the payload (i.e. the code to be executed) to the user. The location from which this code is executed in the user's browser needs to be within the local machine zone."
    techniques "_networkx_list_start"
    techniques "Finding weaknesses in functionality used by both privileged and unprivileged users."
  ]
  execution_flow [
    step "3"
    phase "Exploit"
    description "[Craft and inject the payload] Develop the payload to be executed in the higher privileged zone in the user's browser. Inject the payload and attempt to lure the victim (if possible) into executing the functionality which unleashes the payload."
    techniques "The attacker makes it as likely as possible that the vulnerable functionality into which they have injected the payload has a high likelihood of being used by the victim."
    techniques "Leverage cross-site scripting vulnerability to inject payload."
  ]
  node [
    id 0
    label "find_systems_that_contain_functionality_that_is_accessed_from_both_the_internet_zone_and_the_local_zone"
  ]
  node [
    id 1
    label "need_to_be_a_way_to_supply_input_to_that_functionality_from_the_internet_zone"
  ]
  node [
    id 2
    label "enable_shared_functionality_between_internet_and_local_zones"
  ]
  node [
    id 3
    label "find_the_insertion_point_for_the_payload"
  ]
  node [
    id 4
    label "need_to_find_some_system_functionality_or_possibly_another_weakness_in_the_system_e_g_susceptibility_to_cross_site_scripting_that_would_provide_the_attacker_with_a_mechanism_to_deliver_the_payload_i_e_the_code_to_be_executed_to_the_user"
  ]
  node [
    id 5
    label "execute_this_code"
  ]
  node [
    id 6
    label "find_weaknesses"
  ]
  node [
    id 7
    label "inject_the_payload"
  ]
  node [
    id 8
    label "attempt_to_use_the"
  ]
  node [
    id 9
    label "render_internal_and_external_html_pages"
  ]
  node [
    id 10
    label "add_video"
  ]
  node [
    id 11
    label "use_a_zone_aware_browser"
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
