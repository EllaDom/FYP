graph [
  directed 1
  capec_id "80"
  name "Using UTF-8 Encoding to Bypass Validation Logic"
  abstraction "Detailed"
  status "Draft"
  description "This attack is a specific variation on leveraging alternate encodings to bypass validation logic. This attack leverages the possibility to encode potentially harmful input in UTF-8 and submit it to applications not expecting or effective at validating this encoding standard making input filtering difficult. UTF-8 (8-bit UCS/Unicode Transformation Format) is a variable-length character encoding for Unicode. Legal UTF-8 characters are one to four bytes long. However, early version of the UTF-8 specification got some entries wrong (in some cases it permitted overlong characters). UTF-8 encoders are supposed to use the &#34;shortest possible&#34; encoding, but naive decoders may accept encodings that are longer than necessary. According to the RFC 3629, a particularly subtle form of this attack can be carried out against a parser which performs security-critical validity checks against the UTF-8 encoded form of its input, but interprets certain illegal octet sequences as characters."
  likelihood "High"
  severity "High"
  related_attack_patterns [
    capec_id "64"
    nature "PeerOf"
  ]
  related_attack_patterns [
    capec_id "71"
    nature "PeerOf"
  ]
  related_attack_patterns [
    capec_id "267"
    nature "ChildOf"
  ]
  prerequisites "The application's UTF-8 decoder accepts and interprets illegal UTF-8 characters or non-shortest format of UTF-8 encoding."
  prerequisites "Input filtering and validating is not done properly leaving the door open to harmful characters for the target host."
  skills_required [
    level "Low"
    description "An attacker can inject different representation of a filtered character in UTF-8 format."
  ]
  skills_required [
    level "Medium"
    description "An attacker may craft subtle encoding of input data by using the knowledge that they have gathered about the target host."
  ]
  resources_required "[]"
  consequences [
    scope "Confidentiality"
    scope "Access Control"
    scope "Authorization"
    impact "Bypass Protection Mechanism"
  ]
  consequences [
    scope "Confidentiality"
    scope "Integrity"
    scope "Availability"
    impact "Execute Unauthorized Commands"
  ]
  consequences [
    scope "_networkx_list_start"
    scope "Integrity"
    impact "Modify Data"
  ]
  consequences [
    scope "_networkx_list_start"
    scope "Availability"
    impact "Unreliable Execution"
  ]
  mitigations "The Unicode Consortium recognized multiple representations to be a problem and has revised the Unicode Standard to make multiple representations of the same code point with UTF-8 illegal. The UTF-8 Corrigendum lists the newly restricted UTF-8 range (See references). Many current applications may not have been revised to follow this rule. Verify that your application conform to the latest UTF-8 encoding specification. Pay extra attention to the filtering of illegal characters."
  mitigations "The exact response required from an UTF-8 decoder on invalid input is not uniformly defined by the standards. In general, there are several ways a UTF-8 decoder might behave in the event of an invalid byte sequence: 1. Insert a replacement character (e.g. '?', ''). 2. Ignore the bytes. 3. Interpret the bytes according to a different character encoding (often the ISO-8859-1 character map). 4. Not notice and decode as if the bytes were some similar bit of UTF-8. 5. Stop decoding and report an error (possibly giving the caller the option to continue). It is possible for a decoder to behave in different ways for different types of invalid input. RFC 3629 only requires that UTF-8 decoders must not decode &#34;overlong sequences&#34; (where a character is encoded in more bytes than needed but still adheres to the forms above). The Unicode Standard requires a Unicode-compliant decoder to &#34;...treat any ill-formed code unit sequence as an error condition. This guarantees that it will neither interpret nor emit an ill-formed code unit sequence.&#34; Overlong forms are one of the most troublesome types of UTF-8 data. The current RFC says they must not be decoded but older specifications for UTF-8 only gave a warning and many simpler decoders will happily decode them. Overlong forms have been used to bypass security validations in high profile products including Microsoft's IIS web server. Therefore, great care must be taken to avoid security issues if validation is performed before conversion from UTF-8, and it is generally much simpler to handle overlong forms before any input validation is done. To maintain security in the case of invalid input, there are two options. The first is to decode the UTF-8 before doing any input validation checks. The second is to use a decoder that, in the event of invalid input, returns either an error or text that the application considers to be harmless. Another possibility is to avoid conversion out of UTF-8 altogether but this relies on any other software that the data is passed to safely handling the invalid data. Another consideration is error recovery. To guarantee correct recovery after corrupt or lost bytes, decoders must be able to recognize the difference between lead and trail bytes, rather than just assuming that bytes will be of the type allowed in their position."
  mitigations "For security reasons, a UTF-8 decoder must not accept UTF-8 sequences that are longer than necessary to encode a character. If you use a parser to decode the UTF-8 encoding, make sure that parser filter the invalid UTF-8 characters (invalid forms or overlong forms)."
  mitigations "Look for overlong UTF-8 sequences starting with malicious pattern. You can also use a UTF-8 decoder stress test to test your UTF-8 parser (See Markus Kuhn's UTF-8 and Unicode FAQ in reference section)"
  mitigations "Assume all input is malicious. Create an allowlist that defines all valid input to the software system based on the requirements specifications. Input that does not match against the allowlist should not be permitted to enter into the system. Test your decoding process against malicious input."
  example_instances "_networkx_list_start"
  example_instances "Perhaps the most famous UTF-8 attack was against unpatched Microsoft Internet Information Server (IIS) 4 and IIS 5 servers. If an attacker made a request that looked like this http://servername/scripts/..%c0%af../winnt/system32/ cmd.exe the server didn't correctly handle %c0%af in the URL. What do you think %c0%af means? It's 11000000 10101111 in binary; and if it's broken up using the UTF-8 mapping rules, we get this: 11000000 10101111. Therefore, the character is 00000101111, or 0x2F, the slash (/) character! The %c0%af is an invalid UTF-8 representation of the / character. Such an invalid UTF-8 escape is often referred to as an overlong sequence. So when the attacker requested the tainted URL, they accessed http://servername/scripts/../../winnt/system32/cmd.exe In other words, they walked out of the script's virtual directory, which is marked to allow program execution, up to the root and down into the system32 directory, where they could pass commands to the command shell, Cmd.exe. See also: CVE-2000-0884"
  related_weaknesses "173"
  related_weaknesses "172"
  related_weaknesses "180"
  related_weaknesses "181"
  related_weaknesses "73"
  related_weaknesses "74"
  related_weaknesses "20"
  related_weaknesses "697"
  related_weaknesses "692"
  matched_cwes "73"
  matched_cwes "20"
  matched_cwes "74"
  taxonomy_mappings "[]"
  execution_flow [
    step "1"
    phase "Explore"
    description "[Survey the application for user-controllable inputs] Using a browser or an automated tool, an attacker follows all public links and actions on a web site. They record all the links, the forms, the resources accessed and all other potential entry-points for the web application."
    techniques "Use a spidering tool to follow and record all links and analyze the web pages to find entry points. Make special note of any links that include parameters in the URL."
    techniques "Use a proxy tool to record all user input entry points visited during a manual traversal of the web application."
    techniques "Use a browser to manually explore the website and analyze how it is constructed. Many browsers' plugins are available to facilitate the analysis or automate the discovery."
  ]
  execution_flow [
    step "2"
    phase "Experiment"
    description "[Probe entry points to locate vulnerabilities] The attacker uses the entry points gathered in the &#34;Explore&#34; phase as a target list and injects various UTF-8 encoded payloads to determine if an entry point actually represents a vulnerability with insufficient validation logic and to characterize the extent to which the vulnerability can be exploited."
    techniques "Try to use UTF-8 encoding of content in Scripts in order to bypass validation routines."
    techniques "Try to use UTF-8 encoding of content in HTML in order to bypass validation routines."
    techniques "Try to use UTF-8 encoding of content in CSS in order to bypass validation routines."
  ]
  node [
    id 0
    label "survey_the_application_for_user_controllable_inputs"
  ]
  node [
    id 1
    label "record_all_the_links_the_forms"
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
    label "explore_the_website"
  ]
  node [
    id 5
    label "facilitate_the_analysis"
  ]
  node [
    id 6
    label "locate_vulnerabilities"
  ]
  node [
    id 7
    label "try_to_use_different_encodings_of_content_in_order_to_bypass_validation_routines"
  ]
  node [
    id 8
    label "make_a_request_that_looked_like_this_http_servername_scripts_c0_af"
  ]
  node [
    id 9
    label "think_what"
  ]
  node [
    id 10
    label "break_it"
  ]
  node [
    id 11
    label "refer_such_an_invalid_utf_8_escape"
  ]
  node [
    id 12
    label "request_the_tainted_url"
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
]
