graph [
  directed 1
  capec_id "78"
  name "Using Escaped Slashes in Alternate Encoding"
  abstraction "Detailed"
  status "Draft"
  description "This attack targets the use of the backslash in alternate encoding. An adversary can provide a backslash as a leading character and causes a parser to believe that the next character is special. This is called an escape. By using that trick, the adversary tries to exploit alternate ways to encode the same character which leads to filter problems and opens avenues to attack."
  likelihood "High"
  severity "High"
  related_attack_patterns "_networkx_list_start"
  related_attack_patterns [
    capec_id "267"
    nature "ChildOf"
  ]
  prerequisites "The application accepts the backlash character as escape character."
  prerequisites "The application server does incomplete input data decoding, filtering and validation."
  skills_required [
    level "Low"
    description "The adversary can naively try backslash character and discover that the target host uses it as escape character."
  ]
  skills_required [
    level "Medium"
    description "The adversary may need deep understanding of the host target in order to exploit the vulnerability. The adversary may also use automated tools to probe for this vulnerability."
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
    impact "Bypass Protection Mechanism"
  ]
  mitigations "Verify that the user-supplied data does not use backslash character to escape malicious characters."
  mitigations "Assume all input is malicious. Create an allowlist that defines all valid input to the software system based on the requirements specifications. Input that does not match against the allowlist should not be permitted to enter into the system."
  mitigations "Be aware of the threat of alternative method of data encoding."
  mitigations "Regular expressions can be used to filter out backslash. Make sure you decode before filtering and validating the untrusted input data."
  mitigations "In the case of path traversals, use the principle of least privilege when determining access rights to file systems. Do not allow users to access directories/files that they should not access."
  mitigations "Any security checks should occur after the data has been decoded and validated as correct data format. Do not repeat decoding process, if bad character are left after decoding process, treat the data as suspicious, and fail the validation process."
  mitigations "Avoid making decisions based on names of resources (e.g. files) if those resources can have alternate names."
  example_instances "For example, the byte pair \0 might result in a single zero byte (a NULL) being sent. Another example is \t, which is sometimes converted into a tab character. There is often an equivalent encoding between the back slash and the escaped back slash. This means that \/ results in a single forward slash. A single forward slash also results in a single forward slash. The encoding looks like this: / yields /  \/ yields /"
  example_instances "An attack leveraging escaped slashes in slternate encodings is very simple. If you believe the target may be filtering the slash, attempt to supply \/ and see what happens. Example command strings to try out include CWD ..\/..\/..\/..\/winnt which converts in many cases to CWD ../../../../winnt To probe for this kind of problem, a small C program that uses string output routines can be very useful. File system calls make excellent testing fodder. The simple snippet int main(int argc, char* argv[])  { puts(&#34;\/ \\ \? \. \| &#34;);  return 0;  } produces the output / \ ? . | Clearly, the back slash is ignored, and thus we have hit on a number of alternative encodings to experiment with. Given our previous example, we can extend the attack to include other possibilities: CWD ..\?\?\?\?\/..\/..\/..\/winnt  CWD \.\.\/\.\.\/\.\.\/\.\.\/winnt  CWD ..\|\|\|\|\/..\/..\/..\/winnt"
  related_weaknesses "180"
  related_weaknesses "181"
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
    description "[Survey the application for user-controllable inputs] Using a browser, an automated tool or by inspecting the application, an adversary records all entry points to the application."
    techniques "Use a spidering tool to follow and record all links and analyze the web pages to find entry points. Make special note of any links that include parameters in the URL."
    techniques "Use a proxy tool to record all user input entry points visited during a manual traversal of the web application."
    techniques "Use a browser to manually explore the website and analyze how it is constructed. Many browsers' plugins are available to facilitate the analysis or automate the discovery."
    techniques "Manually inspect the application to find entry points."
  ]
  execution_flow [
    step "2"
    phase "Experiment"
    description "[Probe entry points to locate vulnerabilities] The adversary uses the entry points gathered in the &#34;Explore&#34; phase as a target list and attempts to escape multiple different special characters using a backslash."
    techniques "Escape a special character with a backslash to bypass input validation."
    techniques "Try different encodings of both the backslash and the special character to see if this bypasses input validation"
  ]
  execution_flow [
    step "3"
    phase "Exploit"
    description "[Manipulate input] Once the adversary determines how to bypass filters that filter out special characters using an escaped slash, they will manipulate the user input in a way that is not intended by the application."
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
    label "escape_characters"
  ]
  node [
    id 8
    label "try_different_encodings_of_both_the_backslash_and_the_special_character"
  ]
  node [
    id 9
    label "determine_how_to_bypass_filters_that_filter_out_special_characters_using_an_escaped_slash"
  ]
  node [
    id 10
    label "convert_which"
  ]
  node [
    id 11
    label "make_excellent_testing_fodder"
  ]
  node [
    id 12
    label "return_0"
  ]
  node [
    id 13
    label "ignore_the_back_slash"
  ]
  node [
    id 14
    label "give_our_previous_example"
  ]
  node [
    id 15
    label "accept_the_backlash_character_as_escape_character"
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
