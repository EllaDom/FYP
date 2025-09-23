graph [
  directed 1
  capec_id "81"
  name "Web Server Logs Tampering"
  abstraction "Detailed"
  status "Draft"
  description "Web Logs Tampering attacks involve an attacker injecting, deleting or otherwise tampering with the contents of web logs typically for the purposes of masking other malicious behavior. Additionally, writing malicious data to log files may target jobs, filters, reports, and other agents that process the logs in an asynchronous attack pattern. This pattern of attack is similar to &#34;Log Injection-Tampering-Forging&#34; except that in this case, the attack is targeting the logs of the web server and not the application."
  likelihood "Medium"
  severity "High"
  related_attack_patterns "_networkx_list_start"
  related_attack_patterns [
    capec_id "268"
    nature "ChildOf"
  ]
  prerequisites "_networkx_list_start"
  prerequisites "Target server software must be a HTTP server that performs web logging."
  skills_required "_networkx_list_start"
  skills_required [
    level "Low"
    description "To input faked entries into Web logs"
  ]
  resources_required "_networkx_list_start"
  resources_required "Ability to send specially formatted HTTP request to web server"
  consequences "_networkx_list_start"
  consequences [
    scope "_networkx_list_start"
    scope "Integrity"
    impact "Modify Data"
  ]
  mitigations "Design: Use input validation before writing to web log"
  mitigations "Design: Validate all log data before it is output"
  example_instances "_networkx_list_start"
  example_instances "Most web servers have a public interface, even if the majority of the site is password protected, there is usually at least a login site and brochureware that is publicly available. HTTP requests to the site are also generally logged to a Web log. From an attacker point of view, standard HTTP requests containing a malicious payload can be sent to the public website (with no other access required), when those requests appear in the log (such as http://victimsite/index.html?< malicious script> if they are followed by an administrator this may be sufficient to probe the administrator's host or local network."
  related_weaknesses "117"
  related_weaknesses "93"
  related_weaknesses "75"
  related_weaknesses "221"
  related_weaknesses "96"
  related_weaknesses "20"
  related_weaknesses "150"
  related_weaknesses "276"
  related_weaknesses "279"
  related_weaknesses "116"
  matched_cwes "276"
  matched_cwes "20"
  matched_cwes "279"
  matched_cwes "116"
  taxonomy_mappings "[]"
  execution_flow [
    step "1"
    phase "Explore"
    description "[Determine Application Web Server Log File Format] The attacker observes the system and looks for indicators of which logging utility is being used by the web server."
    techniques "_networkx_list_start"
    techniques "Determine logging utility being used by application web server (e.g. log4j), only possible if the application is known by the attacker or if the application returns error messages with logging utility information."
  ]
  execution_flow [
    step "2"
    phase "Experiment"
    description "[Determine Injectable Content] The attacker launches various logged actions with malicious data to determine what sort of log injection is possible."
    techniques "_networkx_list_start"
    techniques "Attacker triggers logged actions with maliciously crafted data as inputs, parameters, arguments, etc."
  ]
  execution_flow [
    step "3"
    phase "Exploit"
    description "[Manipulate Log Files] The attacker alters the log contents either directly through manipulation or forging or indirectly through injection of specially crafted request that the web server will receive and write into the logs. This type of attack typically follows another attack and is used to try to cover the traces of the previous attack."
    techniques "_networkx_list_start"
    techniques "Directly through log file or database manipulation, modify existing log entries."
  ]
  node [
    id 0
    label "observe_system_behavior"
  ]
  node [
    id 1
    label "determine_logging_utility_being_used_by_application_web_server_e_g_log4j"
  ]
  node [
    id 2
    label "determine_injectable_content"
  ]
  node [
    id 3
    label "launch_various_logged_actions_with_malicious_data"
  ]
  node [
    id 4
    label "trigger_logged_actions_with_maliciously_crafted_data_as_inputs_parameters_arguments_etc"
  ]
  node [
    id 5
    label "alter_the_log_contents"
  ]
  node [
    id 6
    label "follow_attack"
  ]
  node [
    id 7
    label "modify_existing_log_entries"
  ]
  node [
    id 8
    label "log_http_requests_to_the_site"
  ]
  node [
    id 9
    label "craft_malicious_payload"
  ]
  node [
    id 10
    label "perform_web_logging"
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
]
