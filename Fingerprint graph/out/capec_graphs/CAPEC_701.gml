graph [
  directed 1
  capec_id "701"
  name "Browser in the Middle (BiTM)"
  abstraction "Standard"
  status "Draft"
  description "An adversary exploits the inherent functionalities of a web browser, in order to establish an unnoticed remote desktop connection in the victim's browser to the adversary's system. The adversary must deploy a web client with a remote desktop session that the victim can access."
  likelihood "Medium"
  severity "High"
  related_attack_patterns [
    capec_id "94"
    nature "ChildOf"
  ]
  related_attack_patterns [
    capec_id "151"
    nature "CanPrecede"
  ]
  related_attack_patterns [
    capec_id "148"
    nature "CanPrecede"
  ]
  related_attack_patterns [
    capec_id "98"
    nature "CanFollow"
  ]
  prerequisites "_networkx_list_start"
  prerequisites "The adversary must create a convincing web client to establish the connection. The victim then needs to be lured onto the adversary's webpage. In addition, the victim's machine must not use local authentication APIs, a hardware token, or a Trusted Platform Module (TPM) to authenticate."
  skills_required "_networkx_list_start"
  skills_required [
    level "Medium"
    description ""
  ]
  resources_required "_networkx_list_start"
  resources_required "A web application with a client is needed to enable the victim's browser to establish a remote desktop connection to the system of the adversary."
  consequences [
    scope "Confidentiality"
    scope "Access Control"
    scope "Authentication"
    impact "Gain Privileges"
  ]
  consequences [
    scope "Confidentiality"
    scope "Authorization"
    impact "Read Data"
  ]
  consequences [
    scope "_networkx_list_start"
    scope "Integrity"
    impact "Modify Data"
  ]
  mitigations "_networkx_list_start"
  mitigations "Implementation: Use strong, mutual authentication to fully authenticate with both ends of any communications channel"
  example_instances "[]"
  related_weaknesses "294"
  related_weaknesses "345"
  matched_cwes "345"
  matched_cwes "294"
  taxonomy_mappings "[]"
  execution_flow [
    step "1"
    phase "Explore"
    description "[Identify potential targets] The adversary identifies an application or service that the target is likely to use."
    techniques "_networkx_list_start"
    techniques "The adversary stands up a server to host the transparent browser and entices victims to use it by using a domain name similar to the legitimate application. In addition to the transparent browser, the adversary could also install a web proxy, sniffer, keylogger, and other tools to assist in their goals."
  ]
  execution_flow [
    step "2"
    phase "Experiment"
    description "[Lure victims] The adversary crafts a phishing campaign to lure unsuspecting victims into using the transparent browser."
    techniques "_networkx_list_start"
    techniques "An adversary can create a convincing email with a link to download the web client and interact with the transparent browser."
  ]
  execution_flow [
    step "3"
    phase "Exploit"
    description "[Monitor and Manipulate Data] When the victim establishes the connection to the transparent browser, the adversary can view victim activity and make alterations to what the victim sees when browsing the web."
    techniques "_networkx_list_start"
    techniques "Once a victim has established a connection to the transparent browser, the adversary can use installed tools such as a web proxy, keylogger, or additional malicious browser extensions to gather and manipulate data or impersonate the victim."
  ]
  node [
    id 0
    label "identify_potential_targets"
  ]
  node [
    id 1
    label "identify_an_application_or_service_that_the_target_is_likely_to_use"
  ]
  node [
    id 2
    label "stand_a_server_to_host_the_transparent_browser_and_entices_victims_to_use_it_by_using_a_domain_name_similar_to_the_legitimate_application"
  ]
  node [
    id 3
    label "install_a_web_proxy_sniffer_keylogger_and_other_tools_to_assist_in_their_goals"
  ]
  node [
    id 4
    label "craft_a_phishing_campaign_to_lure_unsuspecting_victims_into_using_the_transparent_browser"
  ]
  node [
    id 5
    label "create_a_convincing_email"
  ]
  node [
    id 6
    label "establish_the_connection_to_the_transparent_browser"
  ]
  node [
    id 7
    label "create_a_convincing_web_client"
  ]
  node [
    id 8
    label "need_to_be_lured_onto_the_adversary_s_webpage"
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
