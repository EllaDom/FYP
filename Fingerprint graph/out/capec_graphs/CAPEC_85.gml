graph [
  directed 1
  capec_id "85"
  name "AJAX Footprinting"
  abstraction "Detailed"
  status "Draft"
  description "This attack utilizes the frequent client-server roundtrips in Ajax conversation to scan a system. While Ajax does not open up new vulnerabilities per se, it does optimize them from an attacker point of view. A common first step for an attacker is to footprint the target environment to understand what attacks will work. Since footprinting relies on enumeration, the conversational pattern of rapid, multiple requests and responses that are typical in Ajax applications enable an attacker to look for many vulnerabilities, well-known ports, network locations and so on. The knowledge gained through Ajax fingerprinting can be used to support other attacks, such as XSS."
  likelihood "High"
  severity "Low"
  related_attack_patterns [
    capec_id "580"
    nature "ChildOf"
  ]
  related_attack_patterns [
    capec_id "63"
    nature "CanPrecede"
  ]
  prerequisites "_networkx_list_start"
  prerequisites "The user must allow JavaScript to execute in their browser"
  skills_required "_networkx_list_start"
  skills_required [
    level "Medium"
    description "To land and launch a script on victim's machine with appropriate footprinting logic for enumerating services and vulnerabilities in JavaScript"
  ]
  resources_required "_networkx_list_start"
  resources_required "None: No specialized resources are required to execute this type of attack."
  consequences "_networkx_list_start"
  consequences [
    scope "_networkx_list_start"
    scope "Confidentiality"
    impact "Read Data"
  ]
  mitigations "Design: Use browser technologies that do not allow client side scripting."
  mitigations "Implementation: Perform input validation for all remote content."
  example_instances "_networkx_list_start"
  example_instances "Footprinting can be executed over almost any protocol including HTTP, TCP, UDP, and ICMP, with the general goal of gaining further information about a host environment to launch further attacks. The attacker can probe the system for banners, vulnerabilities, filenames, available services, and in short anything the host process has access to. The results of the probe are either used to execute javascript (for example, if the attackers' footprint script identifies a vulnerability in a firewall permission, then the client side script executes a javascript to change client firewall settings, or an attacker may simply echo the results of the scan back out to a remote host for targeting future attacks) or to inform other data gathering activities in order to craft atta."
  related_weaknesses "79"
  related_weaknesses "113"
  related_weaknesses "348"
  related_weaknesses "96"
  related_weaknesses "20"
  related_weaknesses "116"
  related_weaknesses "184"
  related_weaknesses "86"
  related_weaknesses "692"
  matched_cwes "79"
  matched_cwes "20"
  matched_cwes "116"
  taxonomy_mappings "[]"
  execution_flow "_networkx_list_start"
  execution_flow [
    step "1"
    phase "Explore"
    description "[Send request to target webpage and analyze HTML] Using a browser or an automated tool, an adversary sends requests to a webpage and records the received HTML response. Adversaries then analyze the HTML to identify any known underlying JavaScript architectures. This can aid in mappiong publicly known vulnerabilities to the webpage and can also helpo the adversary guess application architecture and the inner workings of a system."
    techniques "_networkx_list_start"
    techniques "Record all &#34;src&#34; values inside script tags. These JavaScript files are compared to lists of files for known architectures. If there is a large match between the &#34;src&#34; values and architecture files, then it can be assumed that particular architecture is being used."
  ]
  node [
    id 0
    label "send_request_to_target_webpage_and_analyze_html"
  ]
  node [
    id 1
    label "analyze_the_html"
  ]
  node [
    id 2
    label "aid_publicly_known_vulnerabilities_to_the_webpage"
  ]
  node [
    id 3
    label "record_all_src_values_inside_script_tags"
  ]
  node [
    id 4
    label "compare_these_javascript_files"
  ]
  node [
    id 5
    label "assume_if_there_is_a_large_match_between_the_src_values_and_architecture_files"
  ]
  node [
    id 6
    label "execute_footprinting"
  ]
  node [
    id 7
    label "probe_the_system_for_banners_vulnerabilities_filenames_available_services"
  ]
  node [
    id 8
    label "execute_scripts"
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
