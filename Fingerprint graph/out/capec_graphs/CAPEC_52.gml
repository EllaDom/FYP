graph [
  directed 1
  capec_id "52"
  name "Embedding NULL Bytes"
  abstraction "Detailed"
  status "Draft"
  description "An adversary embeds one or more null bytes in input to the target software. This attack relies on the usage of a null-valued byte as a string terminator in many environments. The goal is for certain components of the target software to stop processing the input when it encounters the null byte(s)."
  likelihood "High"
  severity "High"
  related_attack_patterns "_networkx_list_start"
  related_attack_patterns [
    capec_id "267"
    nature "ChildOf"
  ]
  prerequisites "_networkx_list_start"
  prerequisites "The program does not properly handle postfix NULL terminators"
  skills_required [
    level "Medium"
    description "Directory traversal"
  ]
  skills_required [
    level "High"
    description "Execution of arbitrary code"
  ]
  resources_required "[]"
  consequences [
    scope "_networkx_list_start"
    scope "Integrity"
    impact "Modify Data"
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
  consequences [
    scope "Confidentiality"
    scope "Integrity"
    scope "Availability"
    impact "Execute Unauthorized Commands"
  ]
  mitigations "_networkx_list_start"
  mitigations "Properly handle the NULL characters supplied as part of user input prior to doing anything with the data."
  example_instances "Directory Browsing Assume a Web application allows a user to access a set of reports. The path to the reports directory may be something like web/username/reports. If the username is supplied via a hidden field, an adversary could insert a bogus username such as ../../../../../WINDOWS. If the adversary needs to remove the trailing string /reports, then they can simply insert enough characters so the string is truncated. Alternatively the adversary might apply the postfix NULL character (%00) to determine whether this terminates the string. Different forms of NULL to think about include PATH%00  PATH[0x00]  PATH[alternate representation of NULL character]  <script></script>%00"
  example_instances "Exploitation of a buffer overflow vulnerability in the ActiveX component packaged with Adobe Systems Inc.'s Acrobat/Acrobat Reader allows remote adversaries to execute arbitrary code. The problem specifically exists upon retrieving a link of the following form: GET /any_existing_dir/any_existing_pdf.pdf%00[long string] HTTP/1.1 Where [long string] is a malicious crafted long string containing acceptable URI characters. The request must be made to a web server that truncates the request at the null byte (%00), otherwise an invalid file name is specified and a &#34;file not found&#34; page will be returned. Example web servers that truncate the requested URI include Microsoft IIS and Netscape Enterprise. Though the requested URI is truncated for the purposes of locating the file the long string is still passed to the Adobe ActiveX component responsible for rendering the page. This in turn triggers a buffer overflow within RTLHeapFree() allowing for an adversary to overwrite an arbitrary word in memory. The responsible instructions from RTLHeapFree() are shown here: 0x77F83AE5 MOV EAX,[EDI+8]  0x77F83AE8 MOV ECX,[EDI+C]  ...  0x77F83AED MOV [ECX],EAX The register EDI contains a pointer to a user-supplied string. The adversary therefore has control over both the ECX and EAX registers used in the shown MOV instruction. Successful exploitation allows remote adversaries to utilize the arbitrary word overwrite to redirect the flow of control and eventually take control of the affected system. Code execution will occur under the context of the user that instantiated the vulnerable version of Adobe Acrobat. An adversary does not need to establish a malicious web site as exploitation can occur by adding malicious content to the end of any embedded link and referencing any Microsoft IIS or Netscape Enterprise web server. Clicking on a direct malicious link is also not required as it may be embedded within an IMAGE tag, an IFRAME or an auto-loading script. Successful exploitation requires that a payload be written such that certain areas of the input are URI acceptable. This includes initial injected instructions as well as certain overwritten addresses. This increases the complexity of successful exploitation. While not trivial, exploitation is definitely plausible [REF-445]. See also: CVE-2004-0629"
  example_instances "Consider the following PHP script: $whatever = addslashes($_REQUEST['whatever']);  include(&#34;/path/to/program/&#34; . $whatever . &#34;/header.htm&#34;); A malicious adversary might open the following URL, disclosing the boot.ini file: http://localhost/phpscript.php?whatever=../../../../boot.ini%00"
  related_weaknesses "158"
  related_weaknesses "172"
  related_weaknesses "173"
  related_weaknesses "74"
  related_weaknesses "20"
  related_weaknesses "697"
  related_weaknesses "707"
  matched_cwes "20"
  matched_cwes "74"
  matched_cwes "707"
  taxonomy_mappings [
    taxonomy_name "WASC"
    entry_id "28"
    entry_name "Null Byte Injection"
  ]
  taxonomy_mappings [
    taxonomy_name "OWASP Attacks"
    entry_id ""
    entry_name "Embedding Null Code"
  ]
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
    description "[Probe entry points to locate vulnerabilities] The adversary uses the entry points gathered in the &#34;Explore&#34; phase as a target list and injects postfix null byte(s) to observe how the application handles them as input. The adversary is looking for areas where user input is placed in the middle of a string, and the null byte causes the application to stop processing the string at the end of the user input."
    techniques "_networkx_list_start"
    techniques "Try different encodings for null such as \0 or %00"
  ]
  execution_flow [
    step "3"
    phase "Exploit"
    description "[Remove data after null byte(s)] After determined entry points that are vulnerable, the adversary places a null byte(s) such that they remove data after the null byte(s) in a way that is beneficial to them."
    techniques "_networkx_list_start"
    techniques "If the input is a directory as part of a longer file path, add a null byte(s) at the end of the input to try to traverse to the given directory."
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
    label "try_different_encodings_for_null_such_as_0_or"
  ]
  node [
    id 8
    label "remove_data"
  ]
  node [
    id 9
    label "append_a_null_byte"
  ]
  node [
    id 10
    label "supply_the_username"
  ]
  node [
    id 11
    label "need_to_remove_the_trailing_string"
  ]
  node [
    id 12
    label "apply_the_postfix_null_character_00"
  ]
  node [
    id 13
    label "process_the_request"
  ]
  node [
    id 14
    label "truncate_the_requested_uri"
  ]
  node [
    id 15
    label "trigger_a_buffer_overflow_within_rtlheapfree"
  ]
  node [
    id 16
    label "show_ecx_edi_c"
  ]
  node [
    id 17
    label "ecx_eax"
  ]
  node [
    id 18
    label "have_control_over_both_the_ecx_and_eax_registers_used_in_the_shown_mov_instruction"
  ]
  node [
    id 19
    label "craft_a_malicious_website"
  ]
  node [
    id 20
    label "include_initial_injected_instructions_as_well_as_certain_overwritten_addresses"
  ]
  node [
    id 21
    label "increase_the_complexity_of_successful_exploitation"
  ]
  node [
    id 22
    label "consider_the_following_php_script"
  ]
  node [
    id 23
    label "open_the_following_url"
  ]
  node [
    id 24
    label "handle_postfix_null_terminators"
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
  edge [
    source 15
    target 16
  ]
  edge [
    source 16
    target 17
  ]
  edge [
    source 17
    target 18
  ]
  edge [
    source 18
    target 19
  ]
  edge [
    source 19
    target 20
  ]
  edge [
    source 20
    target 21
  ]
  edge [
    source 21
    target 22
  ]
  edge [
    source 22
    target 23
  ]
  edge [
    source 23
    target 24
  ]
]
