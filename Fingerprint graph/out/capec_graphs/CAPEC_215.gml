graph [
  directed 1
  capec_id "215"
  name "Fuzzing for application mapping"
  abstraction "Detailed"
  status "Draft"
  description "An attacker sends random, malformed, or otherwise unexpected messages to a target application and observes the application's log or error messages returned. The attacker does not initially know how a target will respond to individual messages but by attempting a large number of message variants they may find a variant that trigger's desired behavior. In this attack, the purpose of the fuzzing is to observe the application's log and error messages, although fuzzing a target can also sometimes cause the target to enter an unstable state, causing a crash."
  likelihood "High"
  severity "Low"
  related_attack_patterns [
    capec_id "54"
    nature "ChildOf"
  ]
  related_attack_patterns [
    capec_id "28"
    nature "ChildOf"
  ]
  prerequisites "_networkx_list_start"
  prerequisites "The target application must fail to sanitize incoming messages adequately before processing."
  skills_required "_networkx_list_start"
  skills_required [
    level "Medium"
    description "Although fuzzing parameters is not difficult, and often possible with automated fuzzing tools, interpreting the error conditions and modifying the parameters so as to move further in the process of mapping the application requires detailed knowledge of target platform, the languages and packages used as well as software design."
  ]
  resources_required "_networkx_list_start"
  resources_required "Fuzzing tools, which automatically generate and send message variants, are necessary for this attack. The attacker must have sufficient access to send messages to the target. The attacker must also have the ability to observe the target application's log and/or error messages in order to collect information about the target."
  consequences "_networkx_list_start"
  consequences [
    scope "_networkx_list_start"
    scope "Confidentiality"
    impact "Other"
  ]
  mitigations "Design: Construct a 'code book' for error messages. When using a code book, application error messages aren't generated in string or stack trace form, but are catalogued and replaced with a unique (often integer-based) value 'coding' for the error. Such a technique will require helpdesk and hosting personnel to use a 'code book' or similar mapping to decode application errors/logs in order to respond to them normally."
  mitigations "Design: wrap application functionality (preferably through the underlying framework) in an output encoding scheme that obscures or cleanses error messages to prevent such attacks. Such a technique is often used in conjunction with the above 'code book' suggestion."
  mitigations "Implementation: Obfuscate server fields of HTTP response."
  mitigations "Implementation: Hide inner ordering of HTTP response header."
  mitigations "Implementation: Customizing HTTP error codes such as 404 or 500."
  mitigations "Implementation: Hide HTTP response header software information filed."
  mitigations "Implementation: Hide cookie's software information filed."
  mitigations "Implementation: Obfuscate database type in Database API's error message."
  example_instances "The following code generates an error message that leaks the full pathname of the configuration file. $ConfigDir = &#34;/home/myprog/config&#34;;  $uname = GetUserInput(&#34;username&#34;);  ExitError(&#34;Bad hacker!&#34;) if ($uname !~ /^\w+$/);  $file = &#34;$ConfigDir/$uname.txt&#34;;  if (! (-e $file)) { ExitError(&#34;Error: $file does not exist&#34;); }  ... If this code is running on a server, such as a web application, then the person making the request should not know what the full pathname of the configuration directory is. By submitting a username that does not produce a $file that exists, an attacker could get this pathname. It could then be used to exploit path traversal or symbolic link following problems that may exist elsewhere in the application."
  example_instances "In languages that utilize stack traces, revealing them can give adversaries information that allows them to map functions and file locations for an application. The following Java method prints out a stack trace that exposes the application to this attack pattern. public void httpGet(HttpServletRequest request, HttpServletResponse response) { try { processRequest(); } catch (Exception ex) { ex.printStackTrace(response.getWriter()); return; } } If this code is running on a server, such as a web application, then the adversary could cause the exception to be printed through fuzzing."
  related_weaknesses "209"
  related_weaknesses "532"
  matched_cwes "209"
  matched_cwes "532"
  taxonomy_mappings "[]"
  execution_flow [
    step "1"
    phase "Explore"
    description "[Observe communication and inputs] The fuzzing adversary observes the target system looking for inputs and communications between modules, subsystems, or systems."
    techniques "Network sniffing. Using a network sniffer such as wireshark, the adversary observes communications into and out of the target system."
    techniques "Monitor API execution. Using a tool such as ktrace, strace, APISpy, or another debugging tool, the adversary observes the system calls and API calls that are made by the target system, and the nature of their parameters."
    techniques "Observe inputs using web inspection tools (OWASP's WebScarab, Paros, TamperData, TamperIE, etc.)"
  ]
  execution_flow [
    step "2"
    phase "Experiment"
    description "[Generate fuzzed inputs] Given a fuzzing tool, a target input or protocol, and limits on time, complexity, and input variety, generate a list of inputs to try. Although fuzzing is random, it is not exhaustive. Parameters like length, composition, and how many variations to try are important to get the most cost-effective impact from the fuzzer."
    techniques "Boundary cases. Generate fuzz inputs that attack boundary cases of protocol fields, inputs, or other communications limits. Examples include 0xff and 0x00 for single-byte inputs. In binary situations, approach each bit of an individual field with on and off (e.g., 0x80)."
    techniques "Attempt arguments to system calls or APIs. The variations include payloads that, if they were successful, could lead to a compromise on the system."
  ]
  execution_flow [
    step "3"
    phase "Experiment"
    description "[Observe the outcome] Observe the outputs to the inputs fed into the system by fuzzers and see if there are any log or error messages that might provide information to map the application"
    techniques "[]"
  ]
  execution_flow [
    step "4"
    phase "Exploit"
    description "[Craft exploit payloads] An adversary usually needs to modify the fuzzing parameters according to the observed error messages to get the desired sensitive information for the application. To defeat correlation, the adversary may try changing the origin IP addresses or client browser identification strings or start a new session from where they left off in obfuscating the attack."
    techniques "Modify the parameters in the fuzzing tool according to the observed error messages. Repeat with enough parameters until the application has been sufficiently mapped."
    techniques "If the application rejects the large amount of fuzzing messages from the same host machine, the adversary needs to hide the attacks by changing the IP addresses or other credentials."
  ]
  node [
    id 0
    label "observe_communication_and_inputs"
  ]
  node [
    id 1
    label "observe_inputs_using_web_inspection_tools_owasp_s_webscarab_paros_tamperdata_tamperie_etc"
  ]
  node [
    id 2
    label "generate_fuzz_inputs_that_attack_boundary_cases_of_protocol_fields_inputs_or_other_communications_limits"
  ]
  node [
    id 3
    label "include_0xff_and_0x00_for_single_byte_inputs"
  ]
  node [
    id 4
    label "attempt_arguments"
  ]
  node [
    id 5
    label "include_payloads_that_if_they_were_successful_could_lead_to_a_compromise_on_the_system"
  ]
  node [
    id 6
    label "observe_the_outcome"
  ]
  node [
    id 7
    label "need_to_modify_the_fuzzing_parameters_according_to_the_observed_error_messages_to_get_the_desired_sensitive_information_for_the_application"
  ]
  node [
    id 8
    label "defeat_correlation"
  ]
  node [
    id 9
    label "modify_the_parameters"
  ]
  node [
    id 10
    label "repeat_until_the_application_has_been_sufficiently_mapped"
  ]
  node [
    id 11
    label "reject_the_large_amount_of_fuzzing_messages"
  ]
  node [
    id 12
    label "submit_a_username_that_does_not_produce_a_file_that_exists"
  ]
  node [
    id 13
    label "exploit_path_traversal_or_symbolic_link"
  ]
  node [
    id 14
    label "utilize_stack_traces"
  ]
  node [
    id 15
    label "try_processrequest"
  ]
  node [
    id 16
    label "fail_to_sanitize_incoming_messages_adequately_before_processing"
  ]
  edge [
    source 0
    target 0
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
  edge [
    source 15
    target 16
  ]
]
