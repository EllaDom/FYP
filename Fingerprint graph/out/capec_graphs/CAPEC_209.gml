graph [
  directed 1
  capec_id "209"
  name "XSS Using MIME Type Mismatch"
  abstraction "Detailed"
  status "Draft"
  description "An adversary creates a file with scripting content but where the specified MIME type of the file is such that scripting is not expected. The adversary tricks the victim into accessing a URL that responds with the script file. Some browsers will detect that the specified MIME type of the file does not match the actual type of its content and will automatically switch to using an interpreter for the real content type. If the browser does not invoke script filters before doing this, the adversary's script may run on the target unsanitized, possibly revealing the victim's cookies or executing arbitrary script in their browser."
  likelihood ""
  severity "Medium"
  related_attack_patterns "_networkx_list_start"
  related_attack_patterns [
    capec_id "592"
    nature "ChildOf"
  ]
  prerequisites "The victim must follow a crafted link that references a scripting file that is mis-typed as a non-executable file."
  prerequisites "The victim's browser must detect the true type of a mis-labeled scripting file and invoke the appropriate script interpreter without first performing filtering on the content."
  skills_required "[]"
  resources_required "_networkx_list_start"
  resources_required "The adversary must have the ability to source the file of the incorrect MIME type containing a script."
  consequences "[]"
  mitigations "[]"
  example_instances "For example, the MIME type text/plain may be used where the actual content is text/javascript or text/html. Since text does not contain scripting instructions, the stated MIME type would indicate that filtering is unnecessary. However, if the target application subsequently determines the file's real type and invokes the appropriate interpreter, scripted content could be invoked."
  example_instances "In another example, img tags in HTML content could reference a renderable type file instead of an expected image file. The file extension and MIME type can describe an image file, but the file content can be text/javascript or text/html resulting in script execution. If the browser assumes all references in img tags are images, and therefore do not need to be filtered for scripts, this would bypass content filters."
  related_weaknesses "79"
  related_weaknesses "20"
  related_weaknesses "646"
  matched_cwes "79"
  matched_cwes "20"
  taxonomy_mappings "[]"
  execution_flow [
    step "1"
    phase "Explore"
    description "[Survey the application for stored user-controllable inputs] Using a browser or an automated tool, an adversary follows all public links and actions on a web site. They record all areas that allow a user to upload content through an HTTP POST request. This is typically found in blogs or forums."
    techniques "Use a spidering tool to follow and record all links and analyze the web pages to file upload features"
    techniques "Use a proxy tool to record all links visited during a manual traversal of the web application."
    techniques "Use a browser to manually explore the website and analyze how it is constructed. Many browsers' plugins are available to facilitate the analysis or automate the discovery."
  ]
  execution_flow [
    step "2"
    phase "Experiment"
    description "[Probe identified potential entry points for MIME type mismatch] The adversary uses the entry points gathered in the &#34;Explore&#34; phase as a target list and uploads files with scripting content, but whose MIME type is specified as a file type that cannot execute scripting content. If the application only checks the MIME type of the file, it may let the file through, causing the script to be executed by any user who accesses the file."
    techniques "_networkx_list_start"
    techniques "Upload a script file with a MIME type of text/plain to a forum and then access the uploaded file to see if the script is executed. If possible, the script displays a unique identifier so the adversary knows for certain it was executed when testing."
  ]
  execution_flow [
    step "3"
    phase "Experiment"
    description "[Store malicious XSS content] Once the adversary has determined which file upload locations are vulnerable to MIME type mismatch, they will upload a malicious script disguised as a non scripting file. The adversary can have many goals, from stealing session IDs, cookies, credentials, and page content from a victim."
    techniques "_networkx_list_start"
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
    label "record_all_areas_that_allow_a_user_to_upload_content_through_an_http_post_request"
  ]
  node [
    id 2
    label "find_this"
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
    label "check_the_mime_type_of_the_file"
  ]
  node [
    id 8
    label "upload_a_script_file"
  ]
  node [
    id 9
    label "contain_a_unique_identifier"
  ]
  node [
    id 10
    label "steal_session_ids_cookies_credentials_and_page_content_from_the_victim"
  ]
  node [
    id 11
    label "store_a_hook"
  ]
  node [
    id 12
    label "alert_the_adversary"
  ]
  node [
    id 13
    label "get_victim"
  ]
  node [
    id 14
    label "need_to_view_the_stored_malicious_content_on_the_webpage"
  ]
  node [
    id 15
    label "send_a_phishing_email"
  ]
  node [
    id 16
    label "wait_for_a_victim_to_view_the_content"
  ]
  node [
    id 17
    label "post_content"
  ]
  node [
    id 18
    label "use_for_example_the_mime_type_text_plain"
  ]
  node [
    id 19
    label "contain_scripting_instructions"
  ]
  node [
    id 20
    label "determine_the_file_s_real_type"
  ]
  node [
    id 21
    label "describe_an_image_file"
  ]
  node [
    id 22
    label "follow_a_crafted_link_that_references_a_scripting_file_that_is_mis_typed_as_a_non_executable_file"
  ]
  node [
    id 23
    label "detect_the_true_type_of_a_mis_labeled_scripting_file"
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
]
