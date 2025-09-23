graph [
  directed 1
  capec_id "101"
  name "Server Side Include (SSI) Injection"
  abstraction "Detailed"
  status "Draft"
  description "An attacker can use Server Side Include (SSI) Injection to send code to a web application that then gets executed by the web server. Doing so enables the attacker to achieve similar results to Cross Site Scripting, viz., arbitrary code execution and information disclosure, albeit on a more limited scale, since the SSI directives are nowhere near as powerful as a full-fledged scripting language. Nonetheless, the attacker can conveniently gain access to sensitive files, such as password files, and execute shell commands."
  likelihood "High"
  severity "High"
  related_attack_patterns [
    capec_id "253"
    nature "ChildOf"
  ]
  related_attack_patterns [
    capec_id "600"
    nature "CanPrecede"
  ]
  prerequisites "A web server that supports server side includes and has them enabled"
  prerequisites "User controllable input that can carry include directives to the web server"
  skills_required "_networkx_list_start"
  skills_required [
    level "Medium"
    description "The attacker needs to be aware of SSI technology, determine the nature of injection and be able to craft input that results in the SSI directives being executed."
  ]
  resources_required "_networkx_list_start"
  resources_required "None: No specialized resources are required to execute this type of attack. Determining whether the server supports SSI does not require special tools, and nor does injecting directives that get executed. Spidering tools can make the task of finding and following links easier."
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
  mitigations "Set the OPTIONS IncludesNOEXEC in the global access.conf file or local .htaccess (Apache) file to deny SSI execution in directories that do not need them"
  mitigations "All user controllable input must be appropriately sanitized before use in the application. This includes omitting, or encoding, certain characters or strings that have the potential of being interpreted as part of an SSI directive"
  mitigations "Server Side Includes must be enabled only if there is a strong business reason to do so. Every additional component enabled on the web server increases the attack surface as well as administrative overhead"
  example_instances "_networkx_list_start"
  example_instances "Consider a website hosted on a server that permits Server Side Includes (SSI), such as Apache with the &#34;Options Includes&#34; directive enabled. Whenever an error occurs, the HTTP Headers along with the entire request are logged, which can then be displayed on a page that allows review of such errors. A malicious user can inject SSI directives in the HTTP Headers of a request designed to create an error. When these logs are eventually reviewed, the server parses the SSI directives and executes them."
  related_weaknesses "97"
  related_weaknesses "74"
  related_weaknesses "20"
  matched_cwes "20"
  matched_cwes "74"
  taxonomy_mappings [
    taxonomy_name "WASC"
    entry_id "36"
    entry_name "SSI Injection"
  ]
  taxonomy_mappings [
    taxonomy_name "OWASP Attacks"
    entry_id ""
    entry_name "Server-Side Includes (SSI) Injection"
  ]
  execution_flow [
    step "1"
    phase "Explore"
    description "[Determine applicability] The adversary determines whether server side includes are enabled on the target web server."
    techniques "Look for popular page file names. The attacker will look for .shtml, .shtm, .asp, .aspx, and other well-known strings in URLs to help determine whether SSI functionality is enabled."
    techniques "Fetch .htaccess file. In Apache web server installations, the .htaccess file may enable server side includes in specific locations. In those cases, the .htaccess file lives inside the directory where SSI is enabled, and is theoretically fetchable from the web server. Although most web servers deny fetching the .htaccess file, a misconfigured server will allow it. Thus, an attacker will frequently try it."
  ]
  execution_flow [
    step "2"
    phase "Experiment"
    description "[Find Injection Point] Look for user controllable input, including HTTP headers, that can carry server side include directives to the web server."
    techniques "Use a spidering tool to follow and record all links. Make special note of any links that include parameters in the URL."
    techniques "Use a proxy tool to record all links visited during a manual traversal of the web application. Make special note of any links that include parameters in the URL. Manual traversal of this type is frequently necessary to identify forms that are GET method forms rather than POST forms."
  ]
  execution_flow [
    step "3"
    phase "Exploit"
    description "[Inject SSI] Using the found injection point, the adversary sends arbitrary code to be inlcuded by the application on the server side. They may then need to view a particular page in order to have the server execute the include directive and run a command or open a file on behalf of the adversary."
    techniques "[]"
  ]
  node [
    id 0
    label "determine_applicability"
  ]
  node [
    id 1
    label "deny_fetching_the_htaccess_file"
  ]
  node [
    id 2
    label "try_it"
  ]
  node [
    id 3
    label "find_injection_point"
  ]
  node [
    id 4
    label "make_special_note_of_any_links_that_include_parameters_in_the_url"
  ]
  node [
    id 5
    label "record_all_links_visited_during_a_manual_traversal_of_the_web_application"
  ]
  node [
    id 6
    label "identify_forms_that_are_get_method_forms_rather_than_post_forms"
  ]
  node [
    id 7
    label "need_to_view_a_particular_page"
  ]
  node [
    id 8
    label "consider_a_website_hosted_on_a_server_that_permits_server_side_includes_ssi_such_as_apache_with_the_options_includes_directive_enabled"
  ]
  node [
    id 9
    label "inject_ssi_directives_in_the_http_headers_of_a_request_designed_to_create_an_error"
  ]
  node [
    id 10
    label "review_these_logs"
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
    source 4
    target 6
  ]
  edge [
    source 5
    target 4
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
