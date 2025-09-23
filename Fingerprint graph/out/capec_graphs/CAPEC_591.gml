graph [
  directed 1
  capec_id "591"
  name "Reflected XSS"
  abstraction "Detailed"
  status "Stable"
  description "This type of attack is a form of Cross-Site Scripting (XSS) where a malicious script is &#34;reflected&#34; off a vulnerable web application and then executed by a victim's browser. The process starts with an adversary delivering a malicious script to a victim and convincing the victim to send the script to the vulnerable web application."
  likelihood "High"
  severity "Very High"
  related_attack_patterns "_networkx_list_start"
  related_attack_patterns [
    capec_id "63"
    nature "ChildOf"
  ]
  prerequisites "An application that leverages a client-side web browser with scripting enabled."
  prerequisites "An application that fail to adequately sanitize or encode untrusted input."
  skills_required "_networkx_list_start"
  skills_required [
    level "Medium"
    description "Requires the ability to write malicious scripts and embed them into HTTP requests."
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
  mitigations "Utilize strict type, character, and encoding enforcement."
  mitigations "Ensure that all user-supplied input is validated before use."
  example_instances "Consider a web application that enables or disables some of the fields of a form on the page via the use of a mode parameter provided on the query string. http://my.site.com/aform.html?mode=full The application&#8217;s server-side code may want to display this mode value in the HTML page being created to give the users an understanding of what mode they are in. In this example, PHP is used to pull the value from the URL and generate the desired HTML. <?php  echo 'Mode is: ' . $_GET[&#34;mode&#34;];  ?> Notice how the value provided on the URL is used directly with no input validation performed and no output encoding in place. A maliciously crafted URL can thus be formed such that if a victim clicked on the URL, a malicious script would then be executed by the victim&#8217;s browser: http://my.site.com/aform.html?mode=<script>alert('hi');</script>"
  example_instances "Reflected XSS attacks can take advantage of HTTP headers to compromise a victim. For example, assume a vulnerable web application called &#8216;mysite&#8217; dynamically generates a link using an HTTP header such as HTTP_REFERER. Code somewhere in the application could look like: <?php  echo &#34;<a href=&#34;$_SERVER['HTTP_REFERER']&#34;>Test URL</a>&#34;  ?> The HTTP_REFERER header is populated with the URI that linked to the currently executing page. A web site can be created and hosted by an adversary that takes advantage of this by adding a reference to the vulnerable web application. By tricking a victim into clicking a link that executes the attacker&#8217;s web page, such as: &#34;http://attackerswebsite.com?<script>malicious content</script>&#34; The vulnerable web application ('mysite') is now called via the attacker's web site, initiated by the victim's web browser. The HTTP_REFERER header will contain a malicious script, which is embedded into the page by the vulnerable application and served to the victim. The victim&#8217;s web browser then executes the injected script, thus compromising the victim&#8217;s machine."
  related_weaknesses "_networkx_list_start"
  related_weaknesses "79"
  matched_cwes "_networkx_list_start"
  matched_cwes "79"
  taxonomy_mappings "[]"
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
    description "[Probe identified potential entry points for reflected XSS vulnerability] The adversary uses the entry points gathered in the &#34;Explore&#34; phase as a target list and injects various common script payloads and special characters to determine if an entry point actually represents a vulnerability and to characterize the extent to which the vulnerability can be exploited."
    techniques "Use a list of XSS probe strings to inject script in parameters of known URLs. If possible, the probe strings contain a unique identifier."
    techniques "Use a proxy tool to record results of manual input of XSS probes in known URLs."
    techniques "Use a list of HTML special characters to inject into parameters of known URLs and check if they were properly encoded, replaced, or filtered out."
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
    label "change_a_url_parameter"
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
    label "consider_a_web_application_that_enables_or_disables_some_of_the_fields_of_a_form_on_the_page_via_the_use_of_a_mode_parameter_provided_on_the_query_string"
  ]
  node [
    id 19
    label "want_to_display_this_mode_value_in_the_html_page_being_created_to_give_the_users_an_understanding_of_they_are_what_mode_in"
  ]
  node [
    id 20
    label "pull_the_value"
  ]
  node [
    id 21
    label "echo_php"
  ]
  node [
    id 22
    label "assume_a_vulnerable_web_application_called_mysite"
  ]
  node [
    id 23
    label "populate_the_http_referer_header"
  ]
  node [
    id 24
    label "create_a_web_site"
  ]
  node [
    id 25
    label "trick_the_victim"
  ]
  node [
    id 26
    label "contain_a_malicious_script_which_is_embedded_into_the_page_by_the_vulnerable_application_and_served_to_the_victim"
  ]
  node [
    id 27
    label "execute_the_injected_script"
  ]
  node [
    id 28
    label "leverage_a_client_side_web_browser"
  ]
  node [
    id 29
    label "fail_to_adequately_sanitize_or_encode_untrusted_input"
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
  edge [
    source 26
    target 27
  ]
  edge [
    source 27
    target 28
  ]
  edge [
    source 28
    target 29
  ]
]
