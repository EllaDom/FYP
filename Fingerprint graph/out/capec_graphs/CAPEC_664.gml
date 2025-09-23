graph [
  directed 1
  capec_id "664"
  name "Server Side Request Forgery"
  abstraction "Standard"
  status "Stable"
  description "&#10;            "
  likelihood "High"
  severity "High"
  related_attack_patterns "_networkx_list_start"
  related_attack_patterns [
    capec_id "115"
    nature "ChildOf"
  ]
  prerequisites "_networkx_list_start"
  prerequisites "Server must be running a web application that processes HTTP requests."
  skills_required [
    level "Medium"
    description "The adversary will have to detect the vulnerability through an intermediary service or specify maliciously crafted URLs and analyze the server response."
  ]
  skills_required [
    level "High"
    description "The adversary will be required to access internal resources, extract information, or leverage the services running on the server to perform unauthorized actions such as traversing the local network or routing a reflected TCP DDoS through them."
  ]
  resources_required "_networkx_list_start"
  resources_required "[None] No specialized resources are required to execute this type of attack."
  consequences [
    scope "Integrity"
    scope "Confidentiality"
    scope "Availability"
    impact "Modify Data"
  ]
  consequences [
    scope "_networkx_list_start"
    scope "Confidentiality"
    impact "Read Data"
  ]
  consequences [
    scope "_networkx_list_start"
    scope "Availability"
    impact "Resource Consumption"
  ]
  mitigations "Handling incoming requests securely is the first line of action to mitigate this vulnerability. This can be done through URL validation."
  mitigations "Further down the process flow, examining the response and verifying that it is as expected before sending would be another way to secure the server."
  mitigations "Allowlist the DNS name or IP address of every service the web application is required to access is another effective security measure. This ensures the server cannot make external requests to arbitrary services."
  mitigations "Requiring authentication for local services adds another layer of security between the adversary and internal services running on the server. By enforcing local authentication, an adversary will not gain access to all internal services only with access to the server."
  mitigations "Enforce the usage of relevant URL schemas. By limiting requests be made only through HTTP or HTTPS, for example, attacks made through insecure schemas such as file://, ftp://, etc. can be prevented."
  example_instances "An e-commerce website allows a customer to filter results by specific categories. When the customer selects the category of choice, the web shop queries a back-end service to retrieve the requested products. The request may look something like: POST /product/category HTTP/1.0 Content-Type: application/x-www-form-urlencoded Content-Length: 200 vulnerableService=http://vulnerableshop.net:8080/product/category/check%3FcategoryName%3DsomeCategory A malicious user can modify the request URL to look like this instead: POST /product/category HTTP/1.0 Content-Type: application/x-www-form-urlencoded Content-Length: 200 vulnerableService=http://localhost/server-status or vulnerableService = file:///etc/passwd or vulnerableService=dict://localhost:12345/info If the exploit is successful, the server may return the data requested by the adversary root:!:0:0::/:/usr/bin/ksh daemon:!:1:1::/etc: bin:!:2:2::/bin: sys:!:3:3::/usr/sys: adm:!:4:4::/var/adm: uucp:!:5:5::/usr/lib/uucp: guest:!:100:100::/home/guest: nobody:!:4294967294:4294967294::/: lpd:!:9:4294967294::/: lp:*:11:11::/var/spool/lp:/bin/false invscout:*:200:1::/var/adm/invscout:/usr/bin/ksh nuucp:*:6:5:uucp login user:/var/spool/uucppublic:/usr/sbin/uucp/uucico paul:!:201:1::/home/paul:/usr/bin/ksh jdoe:*:202:1:My name:/home/myname:/usr/bin/ksh"
  example_instances "The CallStranger attack is an observed example of SSRF. It specifically targets the UPnP (Universal Plug and Play) protocol used by various network devices and gaming consoles. To execute the attack, an adversary performs a scan of the LAN to discover UPnP enabled devices, and subsequently a list of UPnP services they use. Once the UPnP service endpoints are listed, a vulnerability in the UPnP protocol is used to send these endpoints as encrypted to a verification server via the UPnP Callback method. Because the encryption is done on the client side, the server returns an encrypted list of services which is decrypted on the client side. The adversary then has a list of services running the vulnerable UPnP protocol, which the adversary can leverage to make spoofed requests. [REF-646]"
  related_weaknesses "918"
  related_weaknesses "20"
  matched_cwes "918"
  matched_cwes "20"
  taxonomy_mappings "[]"
  execution_flow [
    step "1"
    phase "Explore"
    description "[Find target application] Find target web application that accepts a user input and retrieves data from the server"
    techniques "[]"
  ]
  execution_flow [
    step "2"
    phase "Experiment"
    description "[Examine existing application requests] Examine HTTP/GET requests to view the URL query format. Adversaries test to see if this type of attack is possible through weaknesses in an application's protection to Server Side Request Forgery"
    techniques "Attempt manipulating the URL to retrieve an error response/code from the server to determine if URL/request validation is done."
    techniques "Use a list of XSS probe strings to specify as parameters to known URLs. If possible, use probe strings with unique identifiers."
    techniques "Create a GET request with a common server file path such as /etc/passwd as a parameter and examine output."
  ]
  execution_flow [
    step "3"
    phase "Exploit"
    description "[Malicious request] Adversary crafts a malicious URL request that assumes the privilege level of the server to query internal or external network services and sends the request to the application"
    techniques "[]"
  ]
  node [
    id 0
    label "identify_target_application"
  ]
  node [
    id 1
    label "find_target_web_application_that_accepts_a_user_input_and_retrieves_data_from_the_server"
  ]
  node [
    id 2
    label "examine_existing_application_requests_examine_http_get_requests_to_view_the_url_query_format"
  ]
  node [
    id 3
    label "attempt_manipulating_the_url_to_retrieve_an_error_response_code_from_the_server_to_determine_if_url_request_validation_is_done"
  ]
  node [
    id 4
    label "use_probe_strings_with_unique_identifiers"
  ]
  node [
    id 5
    label "create_a_get_request_with_a_common_server_file_path_such_as_etc_passwd"
  ]
  node [
    id 6
    label "craft_a_malicious_url_request_that_assumes_the_privilege_level_of_the_server_to_query_internal_or_external_network_services_and_sends_the_request_to_the_application"
  ]
  node [
    id 7
    label "select_the_category_of_choice"
  ]
  node [
    id 8
    label "look_something_like"
  ]
  node [
    id 9
    label "target_the_upnp_universal_plug_and_play_protocol_used_by_various_network_devices_and_gaming_consoles"
  ]
  node [
    id 10
    label "execute_this_type_of_attack"
  ]
  node [
    id 11
    label "list_the_upnp_service_endpoints"
  ]
  node [
    id 12
    label "return_an_encrypted_list_of_services_which_is_decrypted_on_the_client_side"
  ]
  node [
    id 13
    label "run_the_vulnerable_upnp_protocol_which_the_adversary_can_leverage_to_make_spoofed_requests"
  ]
  node [
    id 14
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
]
