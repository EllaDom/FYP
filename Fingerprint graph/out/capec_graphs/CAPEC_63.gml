graph [
  directed 1
  capec_id "63"
  name "Cross-Site Scripting (XSS)"
  abstraction "Standard"
  status "Draft"
  description "An adversary embeds malicious scripts in content that will be served to web browsers. The goal of the attack is for the target software, the client-side browser, to execute the script with the users' privilege level. An attack of this type exploits a programs' vulnerabilities that are brought on by allowing remote hosts to execute code and scripts. Web browsers, for example, have some simple security controls in place, but if a remote attacker is allowed to execute scripts (through injecting them in to user-generated content like bulletin boards) then these controls may be bypassed. Further, these attacks are very difficult for an end user to detect."
  likelihood "High"
  severity "Very High"
  related_attack_patterns [
    capec_id "242"
    nature "ChildOf"
  ]
  related_attack_patterns [
    capec_id "107"
    nature "CanPrecede"
  ]
  prerequisites "_networkx_list_start"
  prerequisites "Target client software must be a client that allows scripting communication from remote hosts, such as a JavaScript-enabled Web Browser."
  skills_required [
    level "Low"
    description "To achieve a redirection and use of less trusted source, an attacker can simply place a script in bulletin board, blog, wiki, or other user-generated content site that are echoed back to other client machines."
  ]
  skills_required [
    level "High"
    description "Exploiting a client side vulnerability to inject malicious scripts into the browser's executable process."
  ]
  resources_required "_networkx_list_start"
  resources_required "Ability to deploy a custom hostile service for access by targeted clients. Ability to communicate synchronously or asynchronously with client machine."
  consequences [
    scope "Confidentiality"
    scope "Integrity"
    scope "Availability"
    impact "Execute Unauthorized Commands"
  ]
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
  mitigations "Design: Use browser technologies that do not allow client side scripting."
  mitigations "Design: Utilize strict type, character, and encoding enforcement"
  mitigations "Design: Server side developers should not proxy content via XHR or other means, if a http proxy for remote content is setup on the server side, the client's browser has no way of discerning where the data is originating from."
  mitigations "Implementation: Ensure all content that is delivered to client is sanitized against an acceptable content specification."
  mitigations "Implementation: Perform input validation for all remote content."
  mitigations "Implementation: Perform output validation for all remote content."
  mitigations "Implementation: Session tokens for specific host"
  mitigations "Implementation: Patching software. There are many attack vectors for XSS on the client side and the server side. Many vulnerabilities are fixed in service packs for browser, web servers, and plug in technologies, staying current on patch release that deal with XSS countermeasures mitigates this."
  example_instances "_networkx_list_start"
  example_instances "Classic phishing attacks lure users to click on content that appears trustworthy, such as logos, and links that seem to go to their trusted financial institutions and online auction sites. But instead the attacker appends malicious scripts into the otherwise innocent appearing resources. The HTML source for a standard phishing attack looks like this: <a href=&#34;www.exampletrustedsite.com?Name=<script>maliciousscript</script>&#34;>Trusted Site</a> When the user clicks the link, the appended script also executes on the local user's machine."
  related_weaknesses "79"
  related_weaknesses "20"
  matched_cwes "79"
  matched_cwes "20"
  taxonomy_mappings [
    taxonomy_name "WASC"
    entry_id "08"
    entry_name "Cross-Site Scripting"
  ]
  taxonomy_mappings [
    taxonomy_name "OWASP Attacks"
    entry_id ""
    entry_name "Cross Site Scripting (XSS)"
  ]
  execution_flow [
    step "1"
    phase "Explore"
    description "[Survey the application for user-controllable inputs] Using a browser or an automated tool, an attacker follows all public links and actions on a web site. They record all the links, the forms, the resources accessed and all other potential entry-points for the web application."
    techniques "Use a spidering tool to follow and record all links and analyze the web pages to find entry points. Make special note of any links that include parameters in the URL."
    techniques "Use a proxy tool to record all links visited during a manual traversal of the web application."
    techniques "Use a browser to manually explore the website and analyze how it is constructed. Many browsers' plugins are available to facilitate the analysis or automate the discovery."
  ]
  execution_flow [
    step "2"
    phase "Experiment"
    description "[Probe identified potential entry points for XSS vulnerability] The attacker uses the entry points gathered in the &#34;Explore&#34; phase as a target list and injects various common script payloads to determine if an entry point actually represents a vulnerability and to characterize the extent to which the vulnerability can be exploited."
    techniques "Use a list of XSS probe strings to inject script in parameters of known URLs. If possible, the probe strings contain a unique identifier."
    techniques "Use a proxy tool to record results of manual input of XSS probes in known URLs."
    techniques "Use a list of XSS probe strings to inject script into UI entry fields. If possible, the probe strings contain a unique identifier."
    techniques "Use a list of XSS probe strings to inject script into resources accessed by the application. If possible, the probe strings contain a unique identifier."
  ]
  execution_flow [
    step "3"
    phase "Exploit"
    description "[Steal session IDs, credentials, page content, etc.] As the attacker succeeds in exploiting the vulnerability, they can choose to steal user's credentials in order to reuse or to analyze them later on."
    techniques "Develop malicious JavaScript that is injected through vectors identified during the Experiment Phase and loaded by the victim's browser and sends document information to the attacker."
    techniques "Develop malicious JavaScript that injected through vectors identified during the Experiment Phase and takes commands from an attacker's server and then causes the browser to execute appropriately."
  ]
  execution_flow [
    step "4"
    phase "Exploit"
    description "[Forceful browsing] When the attacker targets the current application or another one (through CSRF vulnerabilities), the user will then be the one who perform the attacks without being aware of it. These attacks are mostly targeting application logic flaws, but it can also be used to create a widespread attack against a particular website on the user's current network (Internet or not)."
    techniques "Develop malicious JavaScript that is injected through vectors identified during the Experiment Phase and loaded by the victim's browser and performs actions on the same web site"
    techniques "Develop malicious JavaScript that injected through vectors identified during the Experiment Phase and takes commands from an attacker's server and then causes the browser to execute request to other web sites (especially the web applications that have CSRF vulnerabilities)."
  ]
  execution_flow [
    step "5"
    phase "Exploit"
    description "[Content spoofing] By manipulating the content, the attacker targets the information that the user would like to get from the website."
    techniques "_networkx_list_start"
    techniques "Develop malicious JavaScript that is injected through vectors identified during the Experiment Phase and loaded by the victim's browser and exposes attacker-modified invalid information to the user on the current web page."
  ]
  node [
    id 0
    label "survey_the_application_for_user_controllable_inputs"
  ]
  node [
    id 1
    label "record_all_the_links_the_forms"
  ]
  node [
    id 2
    label "make_special_note_of_any_links_that_include_parameters_in_the_url"
  ]
  node [
    id 3
    label "record_all_links_visited_during_a_manual_traversal_of_the_web_application"
  ]
  node [
    id 4
    label "explore_the_website"
  ]
  node [
    id 5
    label "facilitate_the_analysis"
  ]
  node [
    id 6
    label "identify_potential_entry_points_for_xss_vulnerability"
  ]
  node [
    id 7
    label "inject_script_in_parameters_of_known_urls"
  ]
  node [
    id 8
    label "contain_a_unique_identifier"
  ]
  node [
    id 9
    label "record_results_of_manual_input_of_xss_probes_in_known_urls"
  ]
  node [
    id 10
    label "inject_script_into_ui_entry_fields"
  ]
  node [
    id 11
    label "execute_the_injected_script"
  ]
  node [
    id 12
    label "develop_malicious_javascript_that_is_injected_through_vectors_identified_during_the_experiment_phase_and_loaded_by_the_victim_s_browser_and_performs_actions_on_the_same_web_site"
  ]
  node [
    id 13
    label "target_the_current_application_or_another_one_through_csrf_vulnerabilities"
  ]
  node [
    id 14
    label "target_application_logic_flaws"
  ]
  node [
    id 15
    label "lure_users"
  ]
  node [
    id 16
    label "append_malicious_scripts"
  ]
  node [
    id 17
    label "allow_scripting_communication_from_remote_hosts_such_as_a_javascript_enabled_web_browser"
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
  edge [
    source 8
    target 9
  ]
  edge [
    source 8
    target 11
  ]
  edge [
    source 8
    target 12
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
    target 8
  ]
  edge [
    source 12
    target 12
  ]
  edge [
    source 12
    target 13
  ]
  edge [
    source 12
    target 15
  ]
  edge [
    source 13
    target 14
  ]
  edge [
    source 14
    target 12
  ]
  edge [
    source 15
    target 16
  ]
  edge [
    source 16
    target 17
  ]
]
