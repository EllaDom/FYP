graph [
  directed 1
  capec_id "500"
  name "WebView Injection"
  abstraction "Detailed"
  status "Draft"
  description "An adversary, through a previously installed malicious application, injects code into the context of a web page displayed by a WebView component. Through the injected code, an adversary is able to manipulate the DOM tree and cookies of the page, expose sensitive information, and can launch attacks against the web application from within the web page."
  likelihood ""
  severity ""
  related_attack_patterns "_networkx_list_start"
  related_attack_patterns [
    capec_id "253"
    nature "ChildOf"
  ]
  prerequisites "_networkx_list_start"
  prerequisites "An adversary must be able install a purpose built malicious application onto the device and convince the user to execute it. The malicious application is designed to target a specific web application and is used to load the target web pages via the WebView component. For example, an adversary may develop an application that interacts with Facebook via WebView and adds a new feature that a user desires. The user would install this 3rd party app instead of the Facebook app."
  skills_required "[]"
  resources_required "[]"
  consequences "[]"
  mitigations "_networkx_list_start"
  mitigations "The only known mitigation to this type of attack is to keep the malicious application off the system. There is nothing that can be done to the target application to protect itself from a malicious application that has been installed and executed."
  example_instances "[]"
  related_weaknesses "749"
  related_weaknesses "940"
  matched_cwes "_networkx_list_start"
  matched_cwes "749"
  taxonomy_mappings "[]"
  execution_flow [
    step "1"
    phase "Explore"
    description "[Determine target web application] An adversary first needs to determine what web application they wish to target."
    techniques "Target web applications that require users to enter sensitive information."
    techniques "Target web applications that an adversary wishes to operate on behalf of a logged in user."
  ]
  execution_flow [
    step "2"
    phase "Experiment"
    description "[Create malicious application] An adversary creates an application, often mobile, that incorporates a WebView component to display the targeted web application. This malicious application needs to downloaded by a user, so adversaries will make this application useful in some way."
    techniques "Create a 3rd party application that adds useful functionality to the targeted web application. Victims will download the application as a means of using the targeted web application."
    techniques "Create a fun game that at some point directs a user to the targeted web application. For example, prompt the user to buy in game currency by directing them to PayPal."
  ]
  execution_flow [
    step "3"
    phase "Experiment"
    description "[Get the victim to download and run the application] An adversary needs to get the victim to willingly download and run the application."
    techniques "Pay for App Store advertisements"
    techniques "Promote the application on social media, either through accounts made by the adversary or by paying for other accounts to advertise."
  ]
  execution_flow [
    step "4"
    phase "Exploit"
    description "[Inject malicious code] Once the victim runs the malicious application and views the targeted web page in the WebView component, the malicious application will inject malicious JavaScript code into the web application. This is done by using WebView's loadURL() API, which can inject arbitrary JavaScript code into pages loaded by the WebView component with the same privileges. This is often done by adding a script tag to the document body with a src destination to a remote location that serves malicious JavaScript code."
    techniques "Execute operations on the targeted web page on behalf of an authenticated user."
    techniques "Steal cookie information from the victim."
    techniques "Add in extra fields to the DOM in an attempt to get a user to divulge sensitive information."
  ]
  node [
    id 0
    label "determine_target_web_application"
  ]
  node [
    id 1
    label "need_to_determine_what_web_application_they_wish_to_target"
  ]
  node [
    id 2
    label "require_users"
  ]
  node [
    id 3
    label "wish_that_to_operate_on_behalf_of_a_logged_in_user"
  ]
  node [
    id 4
    label "create_malicious_application"
  ]
  node [
    id 5
    label "create_an_application_often_mobile_that_incorporates_a_webview_component_to_display_the_targeted_web_application"
  ]
  node [
    id 6
    label "need_to_downloaded_by_a_user"
  ]
  node [
    id 7
    label "create_a_3rd_party_application_that_adds_useful_functionality_to_the_targeted_web_application"
  ]
  node [
    id 8
    label "download_the_application"
  ]
  node [
    id 9
    label "create_a_fun_game_that_at_some_point_directs_a_user_to_the_targeted_web_application"
  ]
  node [
    id 10
    label "prompt_a_user"
  ]
  node [
    id 11
    label "need_to_get_the_victim_to_willingly_download_and_run_the_application"
  ]
  node [
    id 12
    label "promote_the_application_on_social_media"
  ]
  node [
    id 13
    label "inject_their_malicious_file"
  ]
  node [
    id 14
    label "inject_arbitrary_javascript_code"
  ]
  node [
    id 15
    label "add_a_script_tag"
  ]
  node [
    id 16
    label "steal_cookie"
  ]
  node [
    id 17
    label "install_a_purpose_built_malicious_application_onto_the_device_and_convince_the_user_to_execute_it"
  ]
  node [
    id 18
    label "develop_an_application_that_interacts_with_facebook_via_webview"
  ]
  node [
    id 19
    label "install_this_3rd_party_app_instead_of_the_facebook_app"
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
    source 4
    target 14
  ]
  edge [
    source 4
    target 18
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
  edge [
    source 13
    target 4
  ]
  edge [
    source 14
    target 15
  ]
  edge [
    source 15
    target 16
  ]
  edge [
    source 16
    target 17
  ]
  edge [
    source 17
    target 4
  ]
  edge [
    source 18
    target 19
  ]
]
