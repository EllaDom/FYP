graph [
  directed 1
  capec_id "170"
  name "Web Application Fingerprinting"
  abstraction "Detailed"
  status "Draft"
  description "An attacker sends a series of probes to a web application in order to elicit version-dependent and type-dependent behavior that assists in identifying the target. An attacker could learn information such as software versions, error pages, and response headers, variations in implementations of the HTTP protocol, directory structures, and other similar information about the targeted service. This information can then be used by an attacker to formulate a targeted attack plan. While web application fingerprinting is not intended to be damaging (although certain activities, such as network scans, can sometimes cause disruptions to vulnerable applications inadvertently) it may often pave the way for more damaging attacks."
  likelihood "High"
  severity "Low"
  related_attack_patterns "_networkx_list_start"
  related_attack_patterns [
    capec_id "541"
    nature "ChildOf"
  ]
  prerequisites "_networkx_list_start"
  prerequisites "Any web application can be fingerprinted. However, some configuration choices can limit the useful information an attacker may collect during a fingerprinting attack."
  skills_required "_networkx_list_start"
  skills_required [
    level "Low"
    description "Attacker knows how to send HTTP request, SQL query to a web application."
  ]
  resources_required "_networkx_list_start"
  resources_required "While simple fingerprinting can be accomplished with only a web browser, for more thorough fingerprinting an attacker requires a variety of tools to collect information about the target. These tools might include protocol analyzers, web-site crawlers, and fuzzing tools. Footprinting a service adequately may also take a few days if the attacker wishes the footprinting attempt to go undetected."
  consequences "_networkx_list_start"
  consequences [
    scope "_networkx_list_start"
    scope "Confidentiality"
    impact "Other"
  ]
  mitigations "Implementation: Obfuscate server fields of HTTP response."
  mitigations "Implementation: Hide inner ordering of HTTP response header."
  mitigations "Implementation: Customizing HTTP error codes such as 404 or 500."
  mitigations "Implementation: Hide URL file extension."
  mitigations "Implementation: Hide HTTP response header software information filed."
  mitigations "Implementation: Hide cookie's software information filed."
  mitigations "Implementation: Appropriately deal with error messages."
  mitigations "Implementation: Obfuscate database type in Database API's error message."
  example_instances "_networkx_list_start"
  example_instances "An attacker sends malformed requests or requests of nonexistent pages to the server. Consider the following HTTP responses. Response from Apache 1.3.23 $ nc apache.server.com  80 GET / HTTP/3.0   HTTP/1.1 400 Bad Request  Date: Sun, 15 Jun 2003 17:12: 37 GMT  Server: Apache/1.3.23  Connection: close  Transfer: chunked  Content-Type: text/HTML; charset=iso-8859-1 Response from IIS 5.0 $ nc iis.server.com 80  GET / HTTP/3.0   HTTP/1.1 200 OK  Server: Microsoft-IIS/5.0  Content-Location: http://iis.example.com/Default.htm  Date: Fri, 01 Jan 1999 20:14: 02 GMT  Content-Type: text/HTML  Accept-Ranges: bytes Last-Modified: Fri, 01 Jan 1999 20:14: 02 GMT  ETag: W/e0d362a4c335be1: ae1  Content-Length: 133 [REF-37]"
  related_weaknesses "_networkx_list_start"
  related_weaknesses "497"
  matched_cwes "_networkx_list_start"
  matched_cwes "497"
  taxonomy_mappings "[]"
  execution_flow [
    step "1"
    phase "Explore"
    description "[Request fingerprinting] Use automated tools or send web server specific commands to web server and wait for server's response."
    techniques "_networkx_list_start"
    techniques "Use automated tools or send web server specific commands to web server and then receive server's response."
  ]
  execution_flow [
    step "2"
    phase "Experiment"
    description "[Increase the accuracy of server fingerprinting of Web servers] Attacker usually needs to send several different commands to accurately identify the web server. Attacker can also use automated tools to send requests to the server. The responses of the server may be different in terms of protocol behavior."
    techniques "Observe the ordering of the several HTTP response headers. The ordering of the header of each server may have unique identities."
    techniques "Send bad requests or requests of nonexistent pages to the server."
    techniques "Attacker takes existing automated tools to recognize the type and the version of the web server in use."
  ]
  execution_flow [
    step "3"
    phase "Experiment"
    description "[Identify Web Application Software] After the web server platform software has been identified, the attacker start to identify web application technologies such as ASP, .NET, PHP and Java on the server."
    techniques "Examine the file name extensions in URL, for example .php indicates PHP script interfaced with Apache server."
    techniques "Examine the HTTP Response Headers. This may leak information about software signatures"
    techniques "Examine Cookies that may contain server's software information."
    techniques "Check error pages."
  ]
  execution_flow [
    step "4"
    phase "Experiment"
    description "[Identify Backend Database Version] Determining the database engine type can assist attackers' attempt to successfully execute SQL injection. Some database API such as ODBC will show a database type as part of the driver information when reporting an error."
    techniques "_networkx_list_start"
    techniques "Use tools to send bogus SQL query to the server and check error pages."
  ]
  node [
    id 0
    label "increase_the_accuracy_of_server_fingerprinting_of_web_servers"
  ]
  node [
    id 1
    label "observe_the_ordering_of_the_several_http_response_headers"
  ]
  node [
    id 2
    label "have_unique_identities"
  ]
  node [
    id 3
    label "send_bad_requests_or_requests_of_nonexistent_pages"
  ]
  node [
    id 4
    label "take_existing_automated_tools"
  ]
  node [
    id 5
    label "identify_the_web_server_platform_software"
  ]
  node [
    id 6
    label "examine_the_file_name_extensions_in_url"
  ]
  node [
    id 7
    label "leak_information_about_software_signatures"
  ]
  node [
    id 8
    label "contain_server_s_software_information"
  ]
  node [
    id 9
    label "check_error_pages"
  ]
  node [
    id 10
    label "identify_backend_database_version"
  ]
  node [
    id 11
    label "show_a_database_type"
  ]
  node [
    id 12
    label "send_bogus_sql_query"
  ]
  node [
    id 13
    label "consider_the_following_http_responses"
  ]
  node [
    id 14
    label "http_1_1_400_bad_request_date"
  ]
  node [
    id 15
    label "chunk_content_type_text_html"
  ]
  node [
    id 16
    label "fingerprint_any_web_application"
  ]
  node [
    id 17
    label "limit_the_useful_information_an_attacker_may_collect_during_a_fingerprinting_attack"
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
    source 1
    target 7
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
    source 3
    target 13
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
    target 1
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
    target 3
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
]
