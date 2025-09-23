graph [
  directed 1
  capec_id "79"
  name "Using Slashes in Alternate Encoding"
  abstraction "Detailed"
  status "Draft"
  description "This attack targets the encoding of the Slash characters. An adversary would try to exploit common filtering problems related to the use of the slashes characters to gain access to resources on the target host. Directory-driven systems, such as file systems and databases, typically use the slash character to indicate traversal between directories or other container components. For murky historical reasons, PCs (and, as a result, Microsoft OSs) choose to use a backslash, whereas the UNIX world typically makes use of the forward slash. The schizophrenic result is that many MS-based systems are required to understand both forms of the slash. This gives the adversary many opportunities to discover and abuse a number of common filtering problems. The goal of this pattern is to discover server software that only applies filters to one version, but not the other."
  likelihood "High"
  severity "High"
  related_attack_patterns "_networkx_list_start"
  related_attack_patterns [
    capec_id "267"
    nature "ChildOf"
  ]
  prerequisites "The application server accepts paths to locate resources."
  prerequisites "The application server does insufficient input data validation on the resource path requested by the user."
  prerequisites "The access right to resources are not set properly."
  skills_required [
    level "Low"
    description "An adversary can try variation of the slashes characters."
  ]
  skills_required [
    level "Medium"
    description "An adversary can use more sophisticated tool or script to scan a website and find a path filtering problem."
  ]
  resources_required "[]"
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
  consequences [
    scope "Confidentiality"
    scope "Access Control"
    scope "Authorization"
    impact "Gain Privileges"
  ]
  mitigations "Any security checks should occur after the data has been decoded and validated as correct data format. Do not repeat decoding process, if bad character are left after decoding process, treat the data as suspicious, and fail the validation process. Refer to the RFCs to safely decode URL."
  mitigations "When client input is required from web-based forms, avoid using the &#34;GET&#34; method to submit data, as the method causes the form data to be appended to the URL and is easily manipulated. Instead, use the &#34;POST method whenever possible."
  mitigations "There are tools to scan HTTP requests to the server for valid URL such as URLScan from Microsoft (http://www.microsoft.com/technet/security/tools/urlscan.mspx)"
  mitigations "Be aware of the threat of alternative method of data encoding and obfuscation technique such as IP address encoding. (See related guideline section)"
  mitigations "Test your path decoding process against malicious input."
  mitigations "In the case of path traversals, use the principle of least privilege when determining access rights to file systems. Do not allow users to access directories/files that they should not access."
  mitigations "Assume all input is malicious. Create an allowlist that defines all valid input to the application based on the requirements specifications. Input that does not match against the allowlist should not be permitted to enter into the system."
  example_instances "_networkx_list_start"
  example_instances "Attack Example: Slashes in Alternate Encodings The two following requests are equivalent on most Web servers: http://target server/some_directory\..\..\..\winnt is equivalent to http://target server/some_directory/../../../winnt Multiple encoding conversion problems can also be leveraged as various slashes are instantiated in URL-encoded, UTF-8, or Unicode. Consider the strings http://target server/some_directory\..%5C..%5C..\winnt where %5C is equivalent to the \ character."
  related_weaknesses "173"
  related_weaknesses "180"
  related_weaknesses "181"
  related_weaknesses "20"
  related_weaknesses "74"
  related_weaknesses "73"
  related_weaknesses "22"
  related_weaknesses "185"
  related_weaknesses "200"
  related_weaknesses "697"
  related_weaknesses "707"
  matched_cwes "20"
  matched_cwes "707"
  matched_cwes "74"
  matched_cwes "200"
  matched_cwes "73"
  matched_cwes "22"
  taxonomy_mappings "[]"
  execution_flow [
    step "1"
    phase "Explore"
    description "[Survey the application for user-controllable inputs] Using a browser, an automated tool or by inspecting the application, an adversary records all entry points to the application."
    techniques "Use a spidering tool to follow and record all links and analyze the web pages to find entry points. Make special note of any links that include parameters in the URL."
    techniques "Use a proxy tool to record all user input entry points visited during a manual traversal of the web application."
    techniques "Use a browser to manually explore the website and analyze how it is constructed. Many browsers' plugins are available to facilitate the analysis or automate the discovery."
    techniques "Manually inspect the application to find entry points."
  ]
  execution_flow [
    step "2"
    phase "Experiment"
    description "[Probe entry points to locate vulnerabilities] The adversary uses the entry points gathered in the &#34;Explore&#34; phase as a target list and looks for areas where user input is used to access resources on the target host. The adversary attempts different encodings of slash characters to bypass input filters."
    techniques "Try both backslash and forward slash characters"
    techniques "Try different encodings for slash characters such as %5C"
  ]
  execution_flow [
    step "3"
    phase "Exploit"
    description "[Traverse application directories] Once the adversary determines how to bypass filters that filter out slash characters, they will manipulate the user input to include slashes in order to traverse directories and access resources that are not intended for the user."
    techniques "[]"
  ]
  node [
    id 0
    label "survey_the_application_for_user_controllable_inputs"
  ]
  node [
    id 1
    label "make_special_note_of_any_links_that_include_parameters_in_the_url"
  ]
  node [
    id 2
    label "record_all_links_visited_during_a_manual_traversal_of_the_web_application"
  ]
  node [
    id 3
    label "explore_the_website"
  ]
  node [
    id 4
    label "facilitate_the_analysis"
  ]
  node [
    id 5
    label "inspect_the_application_to_find_entry_points"
  ]
  node [
    id 6
    label "locate_vulnerabilities"
  ]
  node [
    id 7
    label "attempt_different_encodings_of_slash_characters"
  ]
  node [
    id 8
    label "ignore_the_back_slash"
  ]
  node [
    id 9
    label "determine_how_to_bypass_filters_that_filter_out_special_characters_using_an_escaped_slash"
  ]
  node [
    id 10
    label "http_target_server_some_directory"
  ]
  node [
    id 11
    label "leverage_multiple_encoding_conversion_problems"
  ]
  node [
    id 12
    label "consider_the_strings"
  ]
  node [
    id 13
    label "accept_paths"
  ]
  node [
    id 14
    label "control_access_to_resources"
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
    source 7
    target 9
  ]
  edge [
    source 8
    target 7
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
