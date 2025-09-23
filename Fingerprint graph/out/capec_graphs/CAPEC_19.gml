graph [
  directed 1
  capec_id "19"
  name "Embedding Scripts within Scripts"
  abstraction "Standard"
  status "Stable"
  description "An adversary leverages the capability to execute their own script by embedding it within other scripts that the target software is likely to execute due to programs' vulnerabilities that are brought on by allowing remote hosts to execute scripts."
  likelihood "High"
  severity "High"
  related_attack_patterns "_networkx_list_start"
  related_attack_patterns [
    capec_id "242"
    nature "ChildOf"
  ]
  prerequisites "_networkx_list_start"
  prerequisites "Target software must be able to execute scripts, and also grant the adversary privilege to write/upload scripts."
  skills_required [
    level "Low"
    description "To load malicious script into open, e.g. world writable directory"
  ]
  skills_required [
    level "Medium"
    description "Executing remote scripts on host and collecting output"
  ]
  resources_required "[]"
  consequences [
    scope "Confidentiality"
    scope "Integrity"
    scope "Availability"
    impact "Execute Unauthorized Commands"
  ]
  consequences [
    scope "Confidentiality"
    scope "Access Control"
    scope "Authorization"
    impact "Gain Privileges"
  ]
  mitigations "Use browser technologies that do not allow client side scripting."
  mitigations "Utilize strict type, character, and encoding enforcement."
  mitigations "Server side developers should not proxy content via XHR or other means. If a HTTP proxy for remote content is setup on the server side, the client's browser has no way of discerning where the data is originating from."
  mitigations "Ensure all content that is delivered to client is sanitized against an acceptable content specification."
  mitigations "Perform input validation for all remote content."
  mitigations "Perform output validation for all remote content."
  mitigations "Disable scripting languages such as JavaScript in browser"
  mitigations "Session tokens for specific host"
  mitigations "Patching software. There are many attack vectors for XSS on the client side and the server side. Many vulnerabilities are fixed in service packs for browser, web servers, and plug in technologies, staying current on patch release that deal with XSS countermeasures mitigates this."
  mitigations "Privileges are constrained, if a script is loaded, ensure system runs in chroot jail or other limited authority mode"
  example_instances "Ajax applications enable rich functionality for browser based web applications. Applications like Google Maps deliver unprecedented ability to zoom in and out, scroll graphics, and change graphic presentation through Ajax. The security issues that an adversary may exploit in this instance are the relative lack of security features in JavaScript and the various browser's implementation of JavaScript, these security gaps are what XSS and a host of other client side vulnerabilities are based on. While Ajax may not open up new security holes, per se, due to the conversational aspects between client and server of Ajax communication, attacks can be optimized. A single zoom in or zoom out on a graphic in an Ajax application may round trip to the server dozens of times. One of the first steps many adversarys take is frequently footprinting an environment, this can include scanning local addresses like 192.*.*.* IP addresses, checking local directories, files, and settings for known vulnerabilities, and so on. <IMG SRC=javascript:alert('XSS')> The XSS script that is embedded in a given IMG tag can be manipulated to probe a different address on every click of the mouse or other motions that the Ajax application is aware of. In addition the enumerations allow for the adversary to nest sequential logic in the attacks. While Ajax applications do not open up brand new attack vectors, the existing attack vectors are more than adequate to execute attacks, and now these attacks can be optimized to sequentially execute and enumerate host environments."
  example_instances "~/.bash_profile and ~/.bashrc are executed in a user's context when a new shell opens or when a user logs in so that their environment is set correctly. ~/.bash_profile is executed for login shells and ~/.bashrc is executed for interactive non-login shells. This means that when a user logs in (via username and password) to the console (either locally or remotely via something like SSH), ~/.bash_profile is executed before the initial command prompt is returned to the user. After that, every time a new shell is opened, ~/.bashrc is executed. This allows users more fine grained control over when they want certain commands executed. These files are meant to be written to by the local user to configure their own environment; however, adversaries can also insert code into these files to gain persistence each time a user logs in or opens a new shell."
  related_weaknesses "_networkx_list_start"
  related_weaknesses "284"
  matched_cwes "_networkx_list_start"
  matched_cwes "284"
  taxonomy_mappings [
    taxonomy_name "ATTACK"
    entry_id "1027.009"
    entry_name "Obfuscated Files or Information:&#160;Embedded Payloads"
  ]
  taxonomy_mappings [
    taxonomy_name "ATTACK"
    entry_id "1546.004"
    entry_name "Event Triggered Execution:.bash_profile and .bashrc"
  ]
  taxonomy_mappings [
    taxonomy_name "ATTACK"
    entry_id "1546.016"
    entry_name "Event Triggered Execution:&#160;Installer Packages"
  ]
  execution_flow [
    step "1"
    phase "Explore"
    description "[Spider] Using a browser or an automated tool, an adversary records all entry points for inputs that happen to be reflected in a client-side script element. These script elements can be located in the HTML content (head, body, comments), in an HTML tag, XML, CSS, etc."
    techniques "Use a spidering tool to follow and record all non-static links that are likely to have input parameters (through forms, URL, fragments, etc.) actively used by the Web application."
    techniques "Use a proxy tool to record all links visited during a manual traversal of the web application."
    techniques "Use a browser to manually explore the website and analyze how it is constructed. Many browsers' plugins are available to facilitate the analysis or automate the discovery."
  ]
  execution_flow [
    step "2"
    phase "Experiment"
    description "[Probe identified potential entry points for XSS vulnerability] The adversary uses the entry points gathered in the &#34;Explore&#34; phase as a target list and injects various common script payloads to determine if an entry point actually represents a vulnerability and to characterize the extent to which the vulnerability can be exploited."
    techniques "Manually inject various script payloads into each identified entry point using a list of common script injection probes that typically work in a client-side script elements context and observe system behavior to determine if script was executed."
    techniques "Manually inject various script payloads into each identified entry point using a list of common script injection probes that typically work in a server-side script elements context and observe system behavior to determine if script was executed."
    techniques "Use an automated injection attack tool to inject various script payloads into each identified entry point using a list of common script injection probes that typically work in a client-side script elements context and observe system behavior to determine if script was executed."
    techniques "Use an automated injection attack tool to inject various script payloads into each identified entry point using a list of common script injection probes that typically work in a server-side script elements context and observe system behavior to determine if script was executed."
    techniques "Use a proxy tool to record results of the created requests."
  ]
  execution_flow [
    step "3"
    phase "Exploit"
    description "[Steal session IDs, credentials, page content, etc.] As the adversary succeeds in exploiting the vulnerability, they can choose to steal user's credentials in order to reuse or to analyze them later on."
    techniques "Develop malicious JavaScript that is injected through vectors identified during the Experiment Phase and loaded by the victim's browser and sends document information to the adversary."
    techniques "Develop malicious JavaScript that injected through vectors identified during the Experiment Phase and takes commands from an adversary's server and then causes the browser to execute appropriately."
  ]
  execution_flow [
    step "4"
    phase "Exploit"
    description "[Forceful browsing] When the adversary targets the current application or another one (through CSRF vulnerabilities), the user will then be the one who perform the attacks without being aware of it. These attacks are mostly targeting application logic flaws, but it can also be used to create a widespread attack against a particular website on the user's current network (Internet or not)."
    techniques "Develop malicious JavaScript that is injected through vectors identified during the Experiment Phase and loaded by the victim's browser and performs actions on the same web site"
    techniques "Develop malicious JavaScript that injected through vectors identified during the Experiment Phase and takes commands from an adversary's server and then causes the browser to execute request to other web sites (especially the web applications that have CSRF vulnerabilities)."
  ]
  execution_flow [
    step "5"
    phase "Exploit"
    description "[Content spoofing] By manipulating the content, the adversary targets the information that the user would like to get from the website."
    techniques "_networkx_list_start"
    techniques "Develop malicious JavaScript that is injected through vectors identified during the Experiment Phase and loaded by the victim's browser and exposes adversary-modified invalid information to the user on the current web page."
  ]
  node [
    id 0
    label "record_all_entry_points_for_inputs_that_happen_to_be_reflected_in_a_client_side_script_element"
  ]
  node [
    id 1
    label "locate_these_non_script_elements"
  ]
  node [
    id 2
    label "record_all_links_visited_during_a_manual_traversal_of_the_web_application"
  ]
  node [
    id 3
    label "explore_the_website"
  ]
  node [
    id 4
    label "facilitate_the_analysis"
  ]
  node [
    id 5
    label "identify_potential_entry_points_for_xss_vulnerability"
  ]
  node [
    id 6
    label "inject_various_script_payloads_into_each_identified_entry_point_using_a_list_of_common_script_injection_probes_that_typically_work_in_a_client_side_non_script_elements_context_and_observe_system_behavior_to_determine_if_script_was_executed"
  ]
  node [
    id 7
    label "record_results_of_the_created_requests"
  ]
  node [
    id 8
    label "develop_malicious_javascript_that_is_injected_through_vectors_identified_during_the_experiment_phase_and_loaded_by_the_victim_s_browser_and_performs_actions_on_the_same_web_site"
  ]
  node [
    id 9
    label "target_the_current_application_or_another_one_through_csrf_vulnerabilities"
  ]
  node [
    id 10
    label "target_application_logic_flaws"
  ]
  node [
    id 11
    label "enable_rich_functionality_for_browser_based_web_applications"
  ]
  node [
    id 12
    label "deliver_unprecedented_ability_to_zoom_in_and_out_scroll_graphics"
  ]
  node [
    id 13
    label "exploit_that"
  ]
  node [
    id 14
    label "open_new_security_holes"
  ]
  node [
    id 15
    label "check_local_directories_files_and_settings_for_known_vulnerabilities_and_so_on"
  ]
  node [
    id 16
    label "embed_that"
  ]
  node [
    id 17
    label "allow_for_the_adversary_to_nest_sequential_logic_in_the_attacks"
  ]
  node [
    id 18
    label "open_brand_new_attack_vectors"
  ]
  node [
    id 19
    label "execute_when_a_new_shell_opens_or_when_a_user_logs_in_so_that_their_environment_is_set_correctly"
  ]
  node [
    id 20
    label "execute_bash_profile"
  ]
  node [
    id 21
    label "open_a_new_shell"
  ]
  node [
    id 22
    label "mean_these_files"
  ]
  node [
    id 23
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
    target 8
  ]
  edge [
    source 8
    target 9
  ]
  edge [
    source 8
    target 11
  ]
  edge [
    source 9
    target 10
  ]
  edge [
    source 10
    target 8
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
    target 14
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
    target 18
  ]
  edge [
    source 18
    target 19
  ]
  edge [
    source 19
    target 20
  ]
  edge [
    source 20
    target 21
  ]
  edge [
    source 21
    target 22
  ]
  edge [
    source 22
    target 23
  ]
]
