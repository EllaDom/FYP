graph [
  directed 1
  capec_id "107"
  name "Cross Site Tracing"
  abstraction "Detailed"
  status "Draft"
  description "Cross Site Tracing (XST) enables an adversary to steal the victim's session cookie and possibly other authentication credentials transmitted in the header of the HTTP request when the victim's browser communicates to a destination system's web server."
  likelihood "Medium"
  severity "Very High"
  related_attack_patterns "_networkx_list_start"
  related_attack_patterns [
    capec_id "593"
    nature "ChildOf"
  ]
  prerequisites "HTTP TRACE is enabled on the web server"
  prerequisites "The destination system is susceptible to XSS or an adversary can leverage some other weakness to bypass the same origin policy"
  prerequisites "Scripting is enabled in the client's browser"
  prerequisites "HTTP is used as the communication protocol between the server and the client"
  skills_required "_networkx_list_start"
  skills_required [
    level "Medium"
    description "Understanding of the HTTP protocol and an ability to craft a malicious script"
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
    scope "Access Control"
    scope "Authorization"
    impact "Gain Privileges"
  ]
  consequences [
    scope "_networkx_list_start"
    scope "Integrity"
    impact "Modify Data"
  ]
  mitigations "Administrators should disable support for HTTP TRACE at the destination's web server. Vendors should disable TRACE by default."
  mitigations "Patch web browser against known security origin policy bypass exploits."
  example_instances "_networkx_list_start"
  example_instances "An adversary determines that a particular system is vulnerable to reflected cross-site scripting (XSS) and endeavors to leverage this weakness to steal the victim's authentication cookie. An adversary realizes that since httpOnly attribute is set on the user's cookie, it is not possible to steal it directly with their malicious script. Instead, the adversary has their script use XMLHTTP ActiveX control in the victim's IE browser to issue an HTTP TRACE to the target system's server which has HTTP TRACE enabled. The original HTTP TRACE request contains the session cookie and so does the echoed response. The adversary picks the session cookie from the body of HTTP TRACE response and ships it to the adversary. The adversary then uses the newly acquired victim's session cookie to impersonate the victim in the target system. In the absence of an XSS weakness on the site with which the victim is interacting, an adversary can get the script to come from the site that they control and get it to execute in the victim's browser (if they can trick the victim's into visiting their malicious website or clicking on the link that they supplies). However, in that case, due to the same origin policy protection mechanism in the browser, the adversary's malicious script cannot directly issue an HTTP TRACE request to the destination system's web server because the malicious script did not originate at that domain. An adversary will then need to find a way to exploit another weakness that would enable them to circumvent the same origin policy protection."
  related_weaknesses "693"
  related_weaknesses "648"
  matched_cwes "_networkx_list_start"
  matched_cwes "693"
  taxonomy_mappings "_networkx_list_start"
  taxonomy_mappings [
    taxonomy_name "OWASP Attacks"
    entry_id ""
    entry_name "Cross Site Tracing"
  ]
  execution_flow [
    step "1"
    phase "Explore"
    description "[Determine if HTTP Trace is enabled] Determine if HTTP Trace is enabled at the web server with which the victim has an active session"
    techniques "_networkx_list_start"
    techniques "An adversary may issue an HTTP Trace request to the target web server and observe if the response arrives with the original request in the body of the response."
  ]
  execution_flow [
    step "2"
    phase "Experiment"
    description "[Identify mechanism to launch HTTP Trace request] The adversary attempts to force the victim to issue an HTTP Trace request to the targeted application."
    techniques "_networkx_list_start"
    techniques "The adversary probes for cross-site scripting vulnerabilities to force the victim into issuing an HTTP Trace request."
  ]
  execution_flow [
    step "3"
    phase "Exploit"
    description "[Create a malicious script that pings the web server with HTTP TRACE request] The adversary creates a malicious script that will induce the victim's browser to issue an HTTP TRACE request to the destination system's web server. The script will further intercept the response from the web server, pick up sensitive information out of it, and forward to the site controlled by the adversary."
    techniques "_networkx_list_start"
    techniques "The adversary's malicious script circumvents the httpOnly cookie attribute that prevents from hijacking the victim's session cookie directly using document.cookie and instead leverages the HTTP TRACE to catch this information from the header of the HTTP request once it is echoed back from the web server in the body of the HTTP TRACE response."
  ]
  execution_flow [
    step "4"
    phase "Exploit"
    description "[Execute malicious HTTP Trace launching script] The adversary leverages an XSS vulnerability to force the victim to execute the malicious HTTP Trace launching script"
    techniques "[]"
  ]
  execution_flow [
    step "5"
    phase "Exploit"
    description "[Intercept HTTP TRACE response] The adversary's script intercepts the HTTP TRACE response from teh web server, glance sensitive information from it, and forward that information to a server controlled by the adversary."
    techniques "[]"
  ]
  node [
    id 0
    label "determine_if_http_trace_is_enabled"
  ]
  node [
    id 1
    label "determine_if_http_trace_is_enabled_at_the_web_server_with_which_the_victim_has_an_active_session"
  ]
  node [
    id 2
    label "issue_an_http_trace_request_to_the_target_web_server"
  ]
  node [
    id 3
    label "identify_mechanism_to_launch_http_trace_request"
  ]
  node [
    id 4
    label "attempt_to_force_the_victim_to_issue_an_http_trace_request_to_the_targeted_application"
  ]
  node [
    id 5
    label "create_a_malicious_script_that_pings_the_web_server_with_http_trace_request"
  ]
  node [
    id 6
    label "intercept_the_response_from_the_web_server"
  ]
  node [
    id 7
    label "circumvent_the_httponly_cookie_attribute_that_prevents_from_hijacking_the_victim_s_session_cookie_directly_using_document_cookie_and_instead_leverages_the_http_trace_to_catch_this_information_from_the_header_of_the_http_request_once_it_is_echoed_back_from_the_web_server_in_the_body_of_the_http_trace_response"
  ]
  node [
    id 8
    label "execute_malicious_http_trace_launching_script"
  ]
  node [
    id 9
    label "contain_the_session_cookie"
  ]
  node [
    id 10
    label "need_to_find_a_way_to_exploit_another_weakness_that_would_enable_them_to_circumvent_the_same_origin_policy_protection"
  ]
  node [
    id 11
    label "leverage_some_other_weakness"
  ]
  node [
    id 12
    label "enable_scripting"
  ]
  node [
    id 13
    label "use_http"
  ]
  edge [
    source 0
    target 1
  ]
  edge [
    source 0
    target 11
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
    target 9
  ]
  edge [
    source 2
    target 10
  ]
  edge [
    source 3
    target 4
  ]
  edge [
    source 4
    target 4
  ]
  edge [
    source 4
    target 5
  ]
  edge [
    source 5
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
    source 6
    target 2
  ]
  edge [
    source 7
    target 8
  ]
  edge [
    source 8
    target 6
  ]
  edge [
    source 9
    target 9
  ]
  edge [
    source 9
    target 2
  ]
  edge [
    source 10
    target 0
  ]
  edge [
    source 11
    target 12
  ]
  edge [
    source 12
    target 13
  ]
]
