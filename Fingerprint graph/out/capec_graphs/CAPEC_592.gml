graph [
  directed 1
  capec_id "592"
  name "Stored XSS"
  abstraction "Detailed"
  status "Stable"
  description "An adversary utilizes a form of Cross-site Scripting (XSS) where a malicious script is persistently &#34;stored&#34; within the data storage of a vulnerable web application as valid input."
  likelihood "High"
  severity "Very High"
  related_attack_patterns "_networkx_list_start"
  related_attack_patterns [
    capec_id "63"
    nature "ChildOf"
  ]
  prerequisites "An application that leverages a client-side web browser with scripting enabled."
  prerequisites "An application that fails to adequately sanitize or encode untrusted input."
  prerequisites "An application that stores information provided by the user in data storage of some kind."
  skills_required "_networkx_list_start"
  skills_required [
    level "Medium"
    description "Requires the ability to write scripts of varying complexity and to inject them through user controlled fields within the application."
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
  mitigations "Ensure that all user-supplied input is validated before being stored."
  example_instances "An adversary determines that a system uses a web based interface for administration. The adversary creates a new user record and supplies a malicious script in the user name field. The user name field is not validated by the system and a new log entry is created detailing the creation of the new user. Later, an administrator reviews the log in the administrative console. When the administrator comes across the new user entry, the browser sees a script and executes it, stealing the administrator's authentication cookie and forwarding it to the adversary. An adversary then uses the received authentication cookie to log in to the system as an administrator, provided that the administrator console can be accessed remotely."
  example_instances "An online discussion forum allows its members to post HTML-enabled messages, which can also include image tags. An adversary embeds JavaScript in the image tags of their message. The adversary then sends the victim an email advertising free goods and provides a link to the form for how to collect. When the victim visits the forum and reads the message, the malicious script is executed within the victim's browser."
  related_weaknesses "_networkx_list_start"
  related_weaknesses "79"
  matched_cwes "_networkx_list_start"
  matched_cwes "79"
  taxonomy_mappings "[]"
  execution_flow [
    step "1"
    phase "Explore"
    description "[Survey the application for stored user-controllable inputs] Using a browser or an automated tool, an adversary follows all public links and actions on a web site. They record all the links, the forms, the resources accessed and all other potential entry-points for the web application. The adversary is looking for areas where user input is stored, such as user profiles, shopping carts, file managers, forums, blogs, and logs."
    techniques "Use a spidering tool to follow and record all links and analyze the web pages to find entry points."
    techniques "Use a proxy tool to record all links visited during a manual traversal of the web application."
    techniques "Use a browser to manually explore the website and analyze how it is constructed. Many browsers' plugins are available to facilitate the analysis or automate the discovery."
  ]
  execution_flow [
    step "2"
    phase "Experiment"
    description "[Probe identified potential entry points for stored XSS vulnerability] The adversary uses the entry points gathered in the &#34;Explore&#34; phase as a target list and injects various common script payloads and special characters to determine if an entry point actually represents a vulnerability and to characterize the extent to which the vulnerability can be exploited."
    techniques "Use a list of XSS probe strings to submit script in input fields that could be stored by the web application. If possible, the probe strings contain a unique identifier so they can be queried for after submitting to see if they are stored."
    techniques "Use a list of HTML special characters to submit in input fields that could be stored by the web application and check if they were properly encoded, replaced, or filtered out."
  ]
  execution_flow [
    step "3"
    phase "Experiment"
    description "[Store malicious XSS content] Once the adversary has determined which stored locations are vulnerable to XSS, they will interact with the web application to store the malicious content. The adversary can have many goals, from stealing session IDs, cookies, credentials, and page content from a victim."
    techniques "Store a malicious script on a page that will execute when viewed by the victim."
    techniques "Use a tool such as BeEF to store a hook into the web application. This will alert the adversary when the victim has accessed the content and will give the adversary control over the victim's browser, allowing them access to cookies, user screenshot, user clipboard, and more complex XSS attacks."
  ]
  execution_flow [
    step "4"
    phase "Exploit"
    description "[Get victim to view stored content] In order for the attack to be successful, the victim needs to view the stored malicious content on the webpage."
    techniques "Send a phishing email to the victim containing a URL that will direct them to the malicious stored content."
    techniques "Simply wait for a victim to view the content. This is viable in situations where content is posted to a popular public forum."
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
    label "identify_potential_entry_points"
  ]
  node [
    id 6
    label "submit_script"
  ]
  node [
    id 7
    label "contain_a_unique_identifier"
  ]
  node [
    id 8
    label "steal_session_ids_cookies_credentials_and_page_content_from_the_victim"
  ]
  node [
    id 9
    label "store_a_malicious_script_on_a_page_disguised_as_a_non_script_element"
  ]
  node [
    id 10
    label "store_a_hook"
  ]
  node [
    id 11
    label "alert_the_adversary"
  ]
  node [
    id 12
    label "get_victim"
  ]
  node [
    id 13
    label "need_to_view_the_stored_malicious_content_on_the_webpage"
  ]
  node [
    id 14
    label "send_a_phishing_email"
  ]
  node [
    id 15
    label "wait_for_a_victim_to_view_the_content"
  ]
  node [
    id 16
    label "post_content"
  ]
  node [
    id 17
    label "create_a_new_user_record"
  ]
  node [
    id 18
    label "validate_the_user_name_field"
  ]
  node [
    id 19
    label "review_the_log_in_the_administrative_console"
  ]
  node [
    id 20
    label "embed_javascript"
  ]
  node [
    id 21
    label "visit_the_forum"
  ]
  node [
    id 22
    label "leverage_a_client_side_web_browser"
  ]
  node [
    id 23
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
    source 12
    target 21
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
    target 12
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
