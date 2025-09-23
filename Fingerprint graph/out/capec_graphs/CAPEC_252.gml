graph [
  directed 1
  capec_id "252"
  name "PHP Local File Inclusion"
  abstraction "Detailed"
  status "Draft"
  description "The attacker loads and executes an arbitrary local PHP file on a target machine. The attacker could use this to try to load old versions of PHP files that have known vulnerabilities, to load PHP files that the attacker placed on the local machine during a prior attack, or to otherwise change the functionality of the targeted application in unexpected ways."
  likelihood ""
  severity "Medium"
  related_attack_patterns "_networkx_list_start"
  related_attack_patterns [
    capec_id "251"
    nature "ChildOf"
  ]
  prerequisites "_networkx_list_start"
  prerequisites "The targeted PHP application must have a bug that allows an attacker to control which code file is loaded at some juncture."
  skills_required "[]"
  resources_required "_networkx_list_start"
  resources_required "The attacker needs to have enough access to the target application to control the identity of a locally included PHP file."
  consequences "[]"
  mitigations "[]"
  example_instances "[]"
  related_weaknesses "_networkx_list_start"
  related_weaknesses "829"
  matched_cwes "_networkx_list_start"
  matched_cwes "829"
  taxonomy_mappings "[]"
  execution_flow [
    step "1"
    phase "Explore"
    description "[Survey application] Using a browser or an automated tool, an adversary follows all public links on a web site. They record all the links they find. The adversary is looking for URLs that show PHP file inclusion is used, which can look something like &#34;http://vulnerable-website/file.php?file=index.php&#34;."
    techniques "Use a spidering tool to follow and record all links. Make special note of any links that include parameters in the URL."
    techniques "Use a proxy tool to record all links visited during a manual traversal of the web application. Make special note of any links that include parameters in the URL. Manual traversal of this type is frequently necessary to identify forms that are GET method forms rather than POST forms."
    techniques "Use a browser to manually explore the website and analyze how it is constructed. Many browser's plugins are available to facilitate the analysis or automate the URL discovery."
  ]
  execution_flow [
    step "2"
    phase "Experiment"
    description "[Attempt variations on input parameters] Once the adversary finds a vulnerable URL that takes file input, they attempt a variety of path traversal techniques to attempt to get the application to display the contents of a local file, or execute a different PHP file already stored locally on the server."
    techniques "Use a list of probe strings to inject in parameters of known URLs. The probe strings are variants of path traversal techniques used to include well known files."
    techniques "Use a proxy tool to record results of manual input of local file inclusion probes in known URLs."
  ]
  execution_flow [
    step "3"
    phase "Exploit"
    description "[Include desired local file] Once the adversary has determined which techniques of path traversal successfully work with the vulnerable PHP application, they will target a specific local file to include. These can be files such as &#34;/etc/passwd&#34;, &#34;/etc/shadow&#34;, or configuration files for the application that might expose sensitive information."
    techniques "[]"
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
    label "include_well_known_files"
  ]
  node [
    id 8
    label "record_results_of_manual_input_of_xss_probes_in_known_urls"
  ]
  node [
    id 9
    label "desire_local_file"
  ]
  node [
    id 10
    label "gain_access_to_sensitive_information"
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
]
