graph [
  directed 1
  capec_id "588"
  name "DOM-Based XSS"
  abstraction "Detailed"
  status "Stable"
  description "This type of attack is a form of Cross-Site Scripting (XSS) where a malicious script is inserted into the client-side HTML being parsed by a web browser. Content served by a vulnerable web application includes script code used to manipulate the Document Object Model (DOM). This script code either does not properly validate input, or does not perform proper output encoding, thus creating an opportunity for an adversary to inject a malicious script launch a XSS attack. A key distinction between other XSS attacks and DOM-based attacks is that in other XSS attacks, the malicious script runs when the vulnerable web page is initially loaded, while a DOM-based attack executes sometime after the page loads. Another distinction of DOM-based attacks is that in some cases, the malicious script is never sent to the vulnerable web server at all. An attack like this is guaranteed to bypass any server-side filtering attempts to protect users."
  likelihood "High"
  severity "Very High"
  related_attack_patterns "_networkx_list_start"
  related_attack_patterns [
    capec_id "63"
    nature "ChildOf"
  ]
  prerequisites "An application that leverages a client-side web browser with scripting enabled."
  prerequisites "An application that manipulates the DOM via client-side scripting."
  prerequisites "An application that failS to adequately sanitize or encode untrusted input."
  skills_required "_networkx_list_start"
  skills_required [
    level "Medium"
    description "Requires the ability to write scripts of some complexity and to inject it through user controlled fields in the system."
  ]
  resources_required "_networkx_list_start"
  resources_required "None: No specialized resources are required to execute this type of attack."
  consequences [
    scope "_networkx_list_start"
    scope "Confidentiality"
    impact "Read Data"
  ]
  consequences [
    scope "Confidentiality"
    scope "Authorization"
    scope "Access Control"
    impact "Gain Privileges"
  ]
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
  mitigations "Use browser technologies that do not allow client-side scripting."
  mitigations "Utilize proper character encoding for all output produced within client-site scripts manipulating the DOM."
  mitigations "Ensure that all user-supplied input is validated before use."
  example_instances "Consider a web application that enables or disables some of the fields of a form on the page via the use of a mode parameter provided on the query string. http://my.site.com/aform.html?mode=full The application&#8217;s client-side code may want to print this mode value to the screen to give the users an understanding of what mode they are in. In this example, JavaScript is used to pull the value from the URL and update the HTML by dynamically manipulating the DOM via a document.write() call. <script>document.write(&#34;<p>Mode is: &#34; + document.location.href.substring(document.location.href.indexOf('mode=') + 5) + &#34;</p>&#34;);</script> Notice how the value provided on the URL is used directly with no input validation performed and no output encoding in place. A maliciously crafted URL can thus be formed such that if a victim clicked on the URL, a malicious script would then be executed by the victim&#8217;s browser: http://my.site.com/aform.html?mode=<script>alert('hi');</script>"
  example_instances "In some DOM-based attacks, the malicious script never gets sent to the web server at all, thus bypassing any server-side protections that might be in place. Consider the previously used web application that displays the mode value. Since the HTML is being generated dynamically through DOM manipulations, a URL fragment (i.e., the part of a URL after the '#' character) can be used. http://my.site.com/aform.html#mode=<script>alert('hi')</script> In this variation of a DOM-based XSS attack, the malicious script will not be sent to the web server, but will instead be managed by the victim's browser and is still available to the client-side script code."
  related_weaknesses "79"
  related_weaknesses "20"
  related_weaknesses "83"
  matched_cwes "79"
  matched_cwes "20"
  taxonomy_mappings "_networkx_list_start"
  taxonomy_mappings [
    taxonomy_name "OWASP Attacks"
    entry_id ""
    entry_name "Reflected DOM Injection"
  ]
  execution_flow [
    step "1"
    phase "Explore"
    description "[Survey the application for user-controllable inputs] Using a browser or an automated tool, an adversary follows all public links and actions on a web site. They record all the links, the forms, the resources accessed and all other potential entry-points for the web application."
    techniques "Use a spidering tool to follow and record all links and analyze the web pages to find entry points. Make special note of any links that include parameters in the URL."
    techniques "Use a proxy tool to record all links visited during a manual traversal of the web application."
    techniques "Use a browser to manually explore the website and analyze how it is constructed. Many browsers' plugins are available to facilitate the analysis or automate the discovery."
  ]
  execution_flow [
    step "2"
    phase "Experiment"
    description "[Probe identified potential entry points for DOM-based XSS vulnerability] The adversary uses the entry points gathered in the &#34;Explore&#34; phase as a target list and injects various common script payloads and special characters to determine if an entry point actually represents a vulnerability and to characterize the extent to which the vulnerability can be exploited. Specific to DOM-based XSS, the adversary is looking for areas where input is being used to directly change the DOM."
    techniques "Use a list of XSS probe strings to inject script in parameters of known URLs. If possible, the probe strings contain a unique identifier."
    techniques "Use a proxy tool to record results of manual input of XSS probes in known URLs."
    techniques "Use a list of HTML special characters to inject into parameters of known URLs and check if they were properly encoded, replaced, or filtered out."
  ]
  execution_flow [
    step "3"
    phase "Experiment"
    description "[Craft malicious XSS URL] Once the adversary has determined which parameters are vulnerable to XSS, they will craft a malicious URL containing the XSS exploit. The adversary can have many goals, from stealing session IDs, cookies, credentials, and page content from the victim. In DOM-based XSS, the malicious script might not even be sent to the server, since the victim's browser will manipulate the DOM itself. This can help avoid serve-side detection mechanisms."
    techniques "Change a URL parameter to include a malicious script tag."
    techniques "Add a URL fragment to alter the value of the expected Document object URL."
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
    label "identify_potential_entry_points"
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
    label "craft_malicious_xss_url"
  ]
  node [
    id 11
    label "steal_session_ids_cookies_credentials_and_page_content_from_the_victim"
  ]
  node [
    id 12
    label "help_avoid_serve_side_detection_mechanisms"
  ]
  node [
    id 13
    label "change_a_url_parameter"
  ]
  node [
    id 14
    label "add_a_url_fragment"
  ]
  node [
    id 15
    label "send_information_gathered_from_the_malicious_script_to_a_remote_endpoint"
  ]
  node [
    id 16
    label "get_victim"
  ]
  node [
    id 17
    label "send_a_phishing_email"
  ]
  node [
    id 18
    label "hide_this"
  ]
  node [
    id 19
    label "put_the_malicious_url"
  ]
  node [
    id 20
    label "consider_a_web_application_that_enables_or_disables_some_of_the_fields_of_a_form_on_the_page_via_the_use_of_a_mode_parameter_provided_on_the_query_string"
  ]
  node [
    id 21
    label "want_to_print_this_mode_value_to_the_screen_to_give_the_users_an_understanding_of_they_are_what_mode_in"
  ]
  node [
    id 22
    label "pull_the_value"
  ]
  node [
    id 23
    label "consider_the_previously_used_web_application_that_displays_the_mode_value"
  ]
  node [
    id 24
    label "generate_the_html"
  ]
  node [
    id 25
    label "leverage_a_client_side_web_browser"
  ]
  node [
    id 26
    label "manipulate_the_dom"
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
  edge [
    source 25
    target 26
  ]
]
