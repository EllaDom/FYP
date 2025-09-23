graph [
  directed 1
  capec_id "111"
  name "JSON Hijacking (aka JavaScript Hijacking)"
  abstraction "Standard"
  status "Draft"
  description "An attacker targets a system that uses JavaScript Object Notation (JSON) as a transport mechanism between the client and the server (common in Web 2.0 systems using AJAX) to steal possibly confidential information transmitted from the server back to the client inside the JSON object by taking advantage of the loophole in the browser's Same Origin Policy that does not prohibit JavaScript from one website to be included and executed in the context of another website."
  likelihood "High"
  severity "High"
  related_attack_patterns "_networkx_list_start"
  related_attack_patterns [
    capec_id "212"
    nature "ChildOf"
  ]
  prerequisites "JSON is used as a transport mechanism between the client and the server"
  prerequisites "The target server cannot differentiate real requests from forged requests"
  prerequisites "The JSON object returned from the server can be accessed by the attackers' malicious code via a script tag"
  skills_required "_networkx_list_start"
  skills_required [
    level "Medium"
    description "Once this attack pattern is developed and understood, creating an exploit is not very complex.The attacker needs to have knowledge of the URLs that need to be accessed on the target system to request the JSON objects."
  ]
  resources_required "_networkx_list_start"
  resources_required "None: No specialized resources are required to execute this type of attack."
  consequences "_networkx_list_start"
  consequences [
    scope "_networkx_list_start"
    scope "Confidentiality"
    impact "Read Data"
  ]
  mitigations "Ensure that server side code can differentiate between legitimate requests and forged requests. The solution is similar to protection against Cross Site Request Forger (CSRF), which is to use a hard to guess random nonce (that is unique to the victim's session with the server) that the attacker has no way of knowing (at least in the absence of other weaknesses). Each request from the client to the server should contain this nonce and the server should reject all requests that do not contain the nonce."
  mitigations "On the client side, the system's design could make it difficult to get access to the JSON object content via the script tag. Since the JSON object is never assigned locally to a variable, it cannot be readily modified by the attacker before being used by a script tag. For instance, if while(1) was added to the beginning of the JavaScript returned by the server, trying to access it with a script tag would result in an infinite loop. On the other hand, legitimate client side code can remove the while(1) statement after which the JavaScript can be evaluated. A similar result can be achieved by surrounding the returned JavaScript with comment tags, or using other similar techniques (e.g. wrapping the JavaScript with HTML tags)."
  mitigations "Make the URLs in the system used to retrieve JSON objects unpredictable and unique for each user session."
  mitigations "Ensure that to the extent possible, no sensitive data is passed from the server to the client via JSON objects. JavaScript was never intended to play that role, hence the same origin policy does not adequate address this scenario."
  example_instances "_networkx_list_start"
  example_instances "Gmail service was found to be vulnerable to a JSON Hijacking attack that enabled an attacker to get the contents of the victim's address book. An attacker could send an e-mail to the victim's Gmail account (which ensures that the victim is logged in to Gmail when they receive it) with a link to the attackers' malicious site. If the victim clicked on the link, a request (containing the victim's authenticated session cookie) would be sent to the Gmail servers to fetch the victim's address book. This functionality is typically used by the Gmail service to get this data on the fly so that the user can be provided a list of contacts from which to choose the recipient of the e-mail. When the JSON object with the contacts came back, it was loaded into the JavaScript space via a script tag on the attackers' malicious page. Since the JSON object was never assigned to a local variable (which would have prevented a script from a different domain accessing it due to the browser's same origin policy), another mechanism was needed to access the data that it contained. That mechanism was overwriting the internal array constructor with the attackers' own constructor in order to gain access to the JSON object's contents. These contents could then be transferred to the site controlled by the attacker."
  related_weaknesses "345"
  related_weaknesses "346"
  related_weaknesses "352"
  matched_cwes "345"
  matched_cwes "352"
  taxonomy_mappings "[]"
  execution_flow [
    step "1"
    phase "Explore"
    description "[Understand How to Request JSON Responses from the Target System] An attacker first explores the target system to understand what URLs need to be provided to it in order to retrieve JSON objects that contain information of interest to the attacker."
    techniques "_networkx_list_start"
    techniques "An attacker creates an account with the target system and observes requests and the corresponding JSON responses from the server. Understanding how to properly elicit responses from the server is crucial to the attackers' ability to craft the exploit."
  ]
  execution_flow [
    step "2"
    phase "Experiment"
    description "[Craft a malicious website]"
    techniques "[]"
  ]
  execution_flow [
    step "3"
    phase "Exploit"
    description "[Launch JSON hijack] An attacker lures the victim to the malicious website or leverages other means to get their malicious code executing in the victim's browser. Once that happens, the malicious code makes a request to the victim target system to retrieve a JSON object with sensitive information. The request includes the victim's session cookie if the victim is logged in."
    techniques "_networkx_list_start"
    techniques "An attacker employs a myriad of standard techniques to get the victim to visit their malicious site or by some other means get the attackers' malicious code executing in the victim's browser."
  ]
  node [
    id 0
    label "understand_how_to_request_json_responses_from_the_target_system"
  ]
  node [
    id 1
    label "explore_the_target_system"
  ]
  node [
    id 2
    label "create_an_account_with_the_target_system"
  ]
  node [
    id 3
    label "craft_a_malicious_website"
  ]
  node [
    id 4
    label "launch_json_hijack"
  ]
  node [
    id 5
    label "lure_the_victim"
  ]
  node [
    id 6
    label "contain_the_session_cookie"
  ]
  node [
    id 7
    label "employ_a_myriad_of_standard_techniques"
  ]
  node [
    id 8
    label "find_gmail_service"
  ]
  node [
    id 9
    label "receive_an_e"
  ]
  node [
    id 10
    label "access_data"
  ]
  node [
    id 11
    label "assign_the_json_object"
  ]
  node [
    id 12
    label "overwrite_the_internal_array_constructor_with_the_attackers_own_constructor"
  ]
  node [
    id 13
    label "transfer_these_contents"
  ]
  node [
    id 14
    label "use_json"
  ]
  node [
    id 15
    label "differentiate_real_requests_from_forged_requests"
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
]
