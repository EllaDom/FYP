graph [
  directed 1
  capec_id "64"
  name "Using Slashes and URL Encoding Combined to Bypass Validation Logic"
  abstraction "Detailed"
  status "Draft"
  description "This attack targets the encoding of the URL combined with the encoding of the slash characters. An attacker can take advantage of the multiple ways of encoding a URL and abuse the interpretation of the URL. A URL may contain special character that need special syntax handling in order to be interpreted. Special characters are represented using a percentage character followed by two digits representing the octet code of the original character (%HEX-CODE). For instance US-ASCII space character would be represented with %20. This is often referred as escaped ending or percent-encoding. Since the server decodes the URL from the requests, it may restrict the access to some URL paths by validating and filtering out the URL requests it received. An attacker will try to craft an URL with a sequence of special characters which once interpreted by the server will be equivalent to a forbidden URL. It can be difficult to protect against this attack since the URL can contain other format of encoding such as UTF-8 encoding, Unicode-encoding, etc."
  likelihood "High"
  severity "High"
  related_attack_patterns "_networkx_list_start"
  related_attack_patterns [
    capec_id "267"
    nature "ChildOf"
  ]
  prerequisites "The application accepts and decodes URL string request."
  prerequisites "The application performs insufficient filtering/canonicalization on the URLs."
  skills_required [
    level "Low"
    description "An attacker can try special characters in the URL and bypass the URL validation."
  ]
  skills_required [
    level "Medium"
    description "The attacker may write a script to defeat the input filtering mechanism."
  ]
  resources_required "[]"
  consequences [
    scope "_networkx_list_start"
    scope "Availability"
    impact "Resource Consumption"
  ]
  consequences [
    scope "Confidentiality"
    scope "Integrity"
    scope "Availability"
    impact "Execute Unauthorized Commands"
  ]
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
  mitigations "Assume all input is malicious. Create an allowlist that defines all valid input to the software system based on the requirements specifications. Input that does not match against the allowlist should not be permitted to enter into the system. Test your decoding process against malicious input."
  mitigations "Be aware of the threat of alternative method of data encoding and obfuscation technique such as IP address encoding."
  mitigations "When client input is required from web-based forms, avoid using the &#34;GET&#34; method to submit data, as the method causes the form data to be appended to the URL and is easily manipulated. Instead, use the &#34;POST method whenever possible."
  mitigations "Any security checks should occur after the data has been decoded and validated as correct data format. Do not repeat decoding process, if bad character are left after decoding process, treat the data as suspicious, and fail the validation process."
  mitigations "Refer to the RFCs to safely decode URL."
  mitigations "Regular expression can be used to match safe URL patterns. However, that may discard valid URL requests if the regular expression is too restrictive."
  mitigations "There are tools to scan HTTP requests to the server for valid URL such as URLScan from Microsoft (http://www.microsoft.com/technet/security/tools/urlscan.mspx)."
  example_instances "_networkx_list_start"
  example_instances "Attack Example: Combined Encodings CesarFTP Alexandre Cesari released a freeware FTP server for Windows that fails to provide proper filtering against multiple encoding. The FTP server, CesarFTP, included a Web server component that could be attacked with a combination of the triple-dot and URL encoding attacks. An attacker could provide a URL that included a string like /...%5C/ This is an interesting exploit because it involves an aggregation of several tricks: the escape character, URL encoding, and the triple dot. See also: CVE-2001-1335"
  related_weaknesses "177"
  related_weaknesses "173"
  related_weaknesses "172"
  related_weaknesses "73"
  related_weaknesses "22"
  related_weaknesses "74"
  related_weaknesses "20"
  related_weaknesses "697"
  related_weaknesses "707"
  matched_cwes "20"
  matched_cwes "707"
  matched_cwes "74"
  matched_cwes "73"
  matched_cwes "22"
  taxonomy_mappings "[]"
  execution_flow [
    step "1"
    phase "Explore"
    description "The attacker accesses the server using a specific URL."
    techniques "[]"
  ]
  execution_flow [
    step "2"
    phase "Experiment"
    description "The attacker tries to encode some special characters in the URL. The attacker find out that some characters are not filtered properly."
    techniques "[]"
  ]
  execution_flow [
    step "3"
    phase "Exploit"
    description "The attacker crafts a malicious URL string request and sends it to the server."
    techniques "[]"
  ]
  execution_flow [
    step "4"
    phase "Exploit"
    description "The server decodes and interprets the URL string. Unfortunately since the input filtering is not done properly, the special characters have harmful consequences."
    techniques "[]"
  ]
  node [
    id 0
    label "access_the_server_using_a_specific_url"
  ]
  node [
    id 1
    label "try_to_encode_some_special_characters_in_the_url"
  ]
  node [
    id 2
    label "craft_a_malicious_url_string_request"
  ]
  node [
    id 3
    label "interpret_the_url_string"
  ]
  node [
    id 4
    label "filter_bypass_input"
  ]
  node [
    id 5
    label "include_a_web_server_component_that_could_be_attacked_with_a_combination_of_the_triple_dot_and_url_encoding_attacks"
  ]
  node [
    id 6
    label "provide_a_url_that_included_a_string_like"
  ]
  node [
    id 7
    label "involve_an_aggregation_of_several_tricks"
  ]
  node [
    id 8
    label "perform_insufficient_filtering_canonicalization_on_the_urls"
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
]
