graph [
  directed 1
  capec_id "86"
  name "XSS Through HTTP Headers"
  abstraction "Detailed"
  status "Draft"
  description "An adversary exploits web applications that generate web content, such as links in a HTML page, based on unvalidated or improperly validated data submitted by other actors. XSS in HTTP Headers attacks target the HTTP headers which are hidden from most users and may not be validated by web applications."
  likelihood "High"
  severity "Very High"
  related_attack_patterns [
    capec_id "591"
    nature "ChildOf"
  ]
  related_attack_patterns [
    capec_id "588"
    nature "ChildOf"
  ]
  related_attack_patterns [
    capec_id "592"
    nature "ChildOf"
  ]
  prerequisites "_networkx_list_start"
  prerequisites "Target software must be a client that allows scripting communication from remote hosts."
  skills_required [
    level "Low"
    description "To achieve a redirection and use of less trusted source, an adversary can simply edit HTTP Headers that are sent to client machine."
  ]
  skills_required [
    level "High"
    description "Exploiting a client side vulnerability to inject malicious scripts into the browser's executable process."
  ]
  resources_required "_networkx_list_start"
  resources_required "The adversary must have the ability to deploy a custom hostile service for access by targeted clients and the abbility to communicate synchronously or asynchronously with client machine. The adversary must also control a remote site of some sort to redirect client and data to."
  consequences [
    scope "Confidentiality"
    scope "Integrity"
    scope "Availability"
    impact "Execute Unauthorized Commands"
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
  mitigations "Design: Use browser technologies that do not allow client side scripting."
  mitigations "Design: Utilize strict type, character, and encoding enforcement"
  mitigations "Design: Server side developers should not proxy content via XHR or other means, if a http proxy for remote content is setup on the server side, the client's browser has no way of discerning where the data is originating from."
  mitigations "Implementation: Ensure all content that is delivered to client is sanitized against an acceptable content specification."
  mitigations "Implementation: Perform input validation for all remote content."
  mitigations "Implementation: Perform output validation for all remote content."
  mitigations "Implementation: Disable scripting languages such as JavaScript in browser"
  mitigations "Implementation: Session tokens for specific host"
  mitigations "Implementation: Patching software. There are many attack vectors for XSS on the client side and the server side. Many vulnerabilities are fixed in service packs for browser, web servers, and plug in technologies, staying current on patch release that deal with XSS countermeasures mitigates this."
  example_instances "Utilize a remote style sheet set in the HTTP header for XSS attack. When the adversary is able to point to a remote stylesheet, any of the variables set in that stylesheet are controllable on the client side by the remote adversary. Like most XSS attacks, results vary depending on browser that is used [REF-97]. <META HTTP-EQUIV=&#34;Link&#34; Content=&#34;<http://ha.ckers.org/xss.css>; REL=stylesheet&#34;>"
  example_instances "Google's 404 redirection script was found vulnerable to this attack vector. Google's 404 file not found page read * Response headers: &#34;Content-Type: text/html; charset=[encoding]&#34;. * Response body: <META http-equiv=&#34;Content-Type&#34; (...) charset=[encoding]/> If the response sends an unexpected encoding type such as UTF-7, then no enforcement is done on the payload and arbitrary XSS code will be transported along with the standard HTTP response. [REF-476]"
  example_instances "XSS can be used in variety of ways, because it is scripted and executes in a distributed, asynchronous fashion it can create its own vector and openings. For example, the adversary can use XSS to mount a DDoS attack by having series of different computers unknowingly executing requests against a single host."
  related_weaknesses "_networkx_list_start"
  related_weaknesses "80"
  matched_cwes "_networkx_list_start"
  matched_cwes "80"
  taxonomy_mappings "[]"
  execution_flow [
    step "1"
    phase "Explore"
    description "[Survey the application for public links] Using a browser or an automated tool, an adversary follows all public links on a web site. They record all the entry points (input) that becomes part of generated HTTP header (not only GET/POST/COOKIE, but also Content-Type, etc.)"
    techniques "Use a spidering tool to follow and record all links and analyze the web pages to find entry points. Make special note of any links that include parameters used in the HTTP headers."
    techniques "Look for HTML meta tags that could be injectable"
    techniques "Use a proxy tool to record all links visited during a manual traversal of the web application."
    techniques "Use a browser to manually explore the website and analyze how it is constructed. Many browsers' plugins are available to facilitate the analysis or automate the discovery."
  ]
  execution_flow [
    step "2"
    phase "Experiment"
    description "[Probe identified potential entry points for XSS vulnerability]"
    techniques "Manually inject various script payloads into each identified entry point using a list of common script injection probes and observe system behavior to determine if script was executed."
    techniques "Use an automated injection attack tool to inject various script payloads into each identified entry point using a list of common script injection probes and observe system behavior to determine if script was executed."
    techniques "Use a proxy tool to record results of manual input of XSS probes in known URLs."
  ]
  execution_flow [
    step "3"
    phase "Experiment"
    description "[Craft malicious XSS URL] Once the adversary has determined which parameters are vulnerable to XSS, they will craft a malicious URL containing the XSS exploit. The adversary can have many goals, from stealing session IDs, cookies, credentials, and page content from the victim."
    techniques "Change a URL parameter which is used in an HTTP header to include a malicious script tag. Because it is in the header it may bypass validation."
    techniques "Send information gathered from the malicious script to a remote endpoint."
  ]
  execution_flow [
    step "4"
    phase "Exploit"
    description "[Get victim to click URL] In order for the attack to be successful, the victim needs to access the malicious URL."
    techniques "Send a phishing email to the victim containing the malicious URL. This can be hidden in a hyperlink as to not show the full URL, which might draw suspicion."
    techniques "Put the malicious URL on a public forum, where many victims might accidentally click the link."
  ]
  node [
    id 0
    label "survey_the_application_for_public_links"
  ]
  node [
    id 1
    label "record_all_the_entry_points_input_that_becomes_part_of_generated_http_header_not_only_get_post_cookie_but_also_content_type_etc"
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
    label "inject_various_script_payloads_into_each_identified_entry_point_using_a_list_of_common_script_injection_probes_that_typically_work_in_a_client_side_non_script_elements_context_and_observe_system_behavior_to_determine_if_script_was_executed"
  ]
  node [
    id 8
    label "record_results_of_manual_input_of_xss_probes_in_known_urls"
  ]
  node [
    id 9
    label "craft_malicious_xss_url"
  ]
  node [
    id 10
    label "steal_session_ids_cookies_credentials_and_page_content_from_the_victim"
  ]
  node [
    id 11
    label "change_a_url_parameter_which_is_used_in_an_http_header_to_include_a_malicious_script_tag"
  ]
  node [
    id 12
    label "bypass_input_validation"
  ]
  node [
    id 13
    label "send_information_gathered_from_the_malicious_script_to_a_remote_endpoint"
  ]
  node [
    id 14
    label "get_victim"
  ]
  node [
    id 15
    label "send_a_phishing_email"
  ]
  node [
    id 16
    label "hide_this"
  ]
  node [
    id 17
    label "put_the_malicious_url"
  ]
  node [
    id 18
    label "utilize_a_remote_style_sheet_set_in_the_http_header_for_xss_attack"
  ]
  node [
    id 19
    label "find_google_s_404_redirection_script"
  ]
  node [
    id 20
    label "find_charset_encoding"
  ]
  node [
    id 21
    label "send_an_unexpected_encoding_type_such_as_utf_7"
  ]
  node [
    id 22
    label "mount_a_ddos_attack"
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
]
