graph [
  directed 1
  capec_id "32"
  name "XSS Through HTTP Query Strings"
  abstraction "Detailed"
  status "Draft"
  description "An adversary embeds malicious script code in the parameters of an HTTP query string and convinces a victim to submit the HTTP request that contains the query string to a vulnerable web application. The web application then procedes to use the values parameters without properly validation them first and generates the HTML code that will be executed by the victim's browser."
  likelihood "High"
  severity "High"
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
  prerequisites "Target client software must allow scripting such as JavaScript. Server software must allow display of remote generated HTML without sufficient input or output validation."
  skills_required [
    level "Low"
    description "To place malicious payload on server via HTTP"
  ]
  skills_required [
    level "High"
    description "Exploiting any information gathered by HTTP Query on script host"
  ]
  resources_required "_networkx_list_start"
  resources_required "Ability to send HTTP post to scripting host and collect output"
  consequences [
    scope "_networkx_list_start"
    scope "Confidentiality"
    impact "Read Data"
  ]
  consequences [
    scope "Confidentiality"
    scope "Integrity"
    scope "Availability"
    impact "Execute Unauthorized Commands"
  ]
  mitigations "Design: Use browser technologies that do not allow client side scripting."
  mitigations "Design: Utilize strict type, character, and encoding enforcement"
  mitigations "Design: Server side developers should not proxy content via XHR or other means, if a http proxy for remote content is setup on the server side, the client's browser has no way of discerning where the data is originating from."
  mitigations "Implementation: Ensure all content that is delivered to client is sanitized against an acceptable content specification."
  mitigations "Implementation: Perform input validation for all remote content, including remote and user-generated content"
  mitigations "Implementation: Perform output validation for all remote content."
  mitigations "Implementation: Disable scripting languages such as JavaScript in browser"
  mitigations "Implementation: Session tokens for specific host"
  mitigations "Implementation: Patching software. There are many attack vectors for XSS on the client side and the server side. Many vulnerabilities are fixed in service packs for browser, web servers, and plug in technologies, staying current on patch release that deal with XSS countermeasures mitigates this."
  mitigations "Implementation: Privileges are constrained, if a script is loaded, ensure system runs in chroot jail or other limited authority mode"
  example_instances "http://user:host@example.com:8080/oradb<script>alert('Hi')</script>"
  example_instances "Web applications that accept name value pairs in a HTTP Query string are inherently at risk to any value (or name for that matter) that an adversary would like to enter in the query string. This can be done manually via web browser or trivially scripted to post the query string to multiple sites. In the latter case, in the instance of many sites using similar infrastructure with predictable http queries being accepted and operated on (such as blogging software, Google applications, and so on), a single malicious payload can be scripted to target a wide variety of sites. Web 2.0 type sites like Technorati and del.icio.us rely on user generated content like tags to build http links that are displayed to other users. del.icio.us allows users to identify sites, tag them with metadata and provide URL, descriptions and more data. This data is then echoed back to any other web browser that is interested in the link. If the data is not validated by the del.icio.us site properly then an arbitrary code can be added into the standard http string sent to del.icio.us by the adversary, for example formatted as normal content with a URL and description and tagged as Java, and available to be clicked on (and executed by) any user browsing for Java content that clicks on this trojaned content."
  related_weaknesses "_networkx_list_start"
  related_weaknesses "80"
  matched_cwes "_networkx_list_start"
  matched_cwes "80"
  taxonomy_mappings "[]"
  execution_flow [
    step "1"
    phase "Explore"
    description "[Survey the application for public links] Using a browser or an automated tool, an adversary follows all public links on a web site. They record all the links they find."
    techniques "Use a spidering tool to follow and record all links. Make special note of any links that include parameters in the URL."
    techniques "Use a proxy tool to record all links visited during a manual traversal of the web application. Make special note of any links that include parameters in the URL. Manual traversal of this type is frequently necessary to identify forms that are GET method forms rather than POST forms."
    techniques "Use a browser to manually explore the website and analyze how it is constructed. Many browser's plugins are available to facilitate the analysis or automate the URL discovery."
  ]
  execution_flow [
    step "2"
    phase "Experiment"
    description "[Probe public links for XSS vulnerability] The adversary uses the public links gathered in the &#34;Explore&#34; phase as a target list and requests variations on the URLs they spidered before. They send parameters that include variations of payloads. They record all the responses from the server that include unmodified versions of their script."
    techniques "Use a list of XSS probe strings to inject in parameters of known URLs. If possible, the probe strings contain a unique identifier."
    techniques "Use a proxy tool to record results of manual input of XSS probes in known URLs."
  ]
  execution_flow [
    step "3"
    phase "Experiment"
    description "[Craft malicious XSS URL] Once the adversary has determined which parameters are vulnerable to XSS, they will craft a malicious URL containing the XSS exploit. The adversary can have many goals, from stealing session IDs, cookies, credentials, and page content from the victim."
    techniques "Change a URL parameter to include a malicious script tag."
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
    label "record_all_the_links_they_find"
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
    label "identify_forms_that_are_get_method_forms_rather_than_post_forms"
  ]
  node [
    id 5
    label "explore_the_website"
  ]
  node [
    id 6
    label "facilitate_the_analysis"
  ]
  node [
    id 7
    label "send_parameters_that_include_variations_of_payloads"
  ]
  node [
    id 8
    label "record_all_the_responses_from_the_server_that_include_unmodified_versions_of_their_script"
  ]
  node [
    id 9
    label "contain_a_unique_identifier"
  ]
  node [
    id 10
    label "record_results_of_manual_input_of_xss_probes_in_known_urls"
  ]
  node [
    id 11
    label "craft_malicious_xss_url"
  ]
  node [
    id 12
    label "steal_session_ids_cookies_credentials_and_page_content_from_the_victim"
  ]
  node [
    id 13
    label "change_a_url_parameter"
  ]
  node [
    id 14
    label "send_information_gathered_from_the_malicious_script_to_a_remote_endpoint"
  ]
  node [
    id 15
    label "get_victim"
  ]
  node [
    id 16
    label "send_a_phishing_email"
  ]
  node [
    id 17
    label "hide_this"
  ]
  node [
    id 18
    label "put_the_malicious_url"
  ]
  node [
    id 19
    label "accept_name_value_pairs_in_a_http_query_string"
  ]
  node [
    id 20
    label "script_to_post_the_query_string_to_multiple_sites"
  ]
  node [
    id 21
    label "rely_to_build_http_links_that_are_displayed_to_other_users"
  ]
  node [
    id 22
    label "access_data"
  ]
  node [
    id 23
    label "validate_data"
  ]
  node [
    id 24
    label "allow_scripting_such_as_javascript"
  ]
  node [
    id 25
    label "allow_display_of_remote_generated_html_without_sufficient_input_or_output_validation"
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
    source 2
    target 4
  ]
  edge [
    source 3
    target 2
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
  edge [
    source 23
    target 24
  ]
  edge [
    source 24
    target 25
  ]
]
