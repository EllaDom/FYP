graph [
  directed 1
  capec_id "178"
  name "Cross-Site Flashing"
  abstraction "Detailed"
  status "Draft"
  description "An attacker is able to trick the victim into executing a Flash document that passes commands or calls to a Flash player browser plugin, allowing the attacker to exploit native Flash functionality in the client browser. This attack pattern occurs where an attacker can provide a crafted link to a Flash document (SWF file) which, when followed, will cause additional malicious instructions to be executed. The attacker does not need to serve or control the Flash document. The attack takes advantage of the fact that Flash files can reference external URLs. If variables that serve as URLs that the Flash application references can be controlled through parameters, then by creating a link that includes values for those parameters, an attacker can cause arbitrary content to be referenced and possibly executed by the targeted Flash application."
  likelihood "Medium"
  severity "Medium"
  related_attack_patterns "_networkx_list_start"
  related_attack_patterns [
    capec_id "182"
    nature "ChildOf"
  ]
  prerequisites "_networkx_list_start"
  prerequisites "The targeted Flash application must reference external URLs and the locations thus referenced must be controllable through parameters. The Flash application must fail to sanitize such parameters against malicious manipulation. The victim must follow a crafted link created by the attacker."
  skills_required "_networkx_list_start"
  skills_required [
    level "Medium"
    description "knowledge of Flash internals, parameters and remote referencing."
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
    scope "_networkx_list_start"
    scope "Authorization"
    impact "Execute Unauthorized Commands"
  ]
  consequences [
    scope "Accountability"
    scope "Authentication"
    scope "Authorization"
    scope "Non-Repudiation"
    impact "Gain Privileges"
  ]
  consequences [
    scope "Access Control"
    scope "Authorization"
    impact "Bypass Protection Mechanism"
  ]
  mitigations "Implementation: Only allow known URL to be included as remote flash movies in a flash application"
  mitigations "Configuration: Properly configure the crossdomain.xml file to only include the known domains that should host remote flash movies."
  example_instances "_networkx_list_start"
  example_instances "The attacker tries to get their malicious flash movie to be executed in the targeted flash application. The malicious file is hosted on the attacker.com domain and the targeted flash application is hosted on example.com The crossdomain.xml file in the root of example.com allows all domains and no specific restriction is specified in the targeted flash application. When the attacker injects their malicious file in the vulnerable flash movie, the rogue flash application is able to access internal variables and parameter of the flash movie."
  related_weaknesses "_networkx_list_start"
  related_weaknesses "601"
  matched_cwes "_networkx_list_start"
  matched_cwes "601"
  taxonomy_mappings "[]"
  execution_flow [
    step "1"
    phase "Explore"
    description "[Identification] Using a browser or an automated tool, an attacker records all instances of URLs (or partial URL such as domain) passed to a flash file (SWF)."
    techniques "Use an automated tool to record the variables passed to a flash file."
    techniques "Use a browser to manually explore the website and analyze how the flash file receive variables, e.g. JavaScript using SetVariable/GetVariable, HTML FlashVars param tag, etc."
    techniques "Use decompilers to retrieve the flash source code and record all user-controllable variables passed to a loadMovie* directive."
  ]
  execution_flow [
    step "2"
    phase "Experiment"
    description "[Attempt to inject a remote flash file] The attacker makes use of a remotely available flash file (SWF) that generates a uniquely identifiable output when executed inside the targeted flash file."
    techniques "_networkx_list_start"
    techniques "Modify the variable of the SWF file that contains the remote movie URL to the attacker controlled flash file."
  ]
  execution_flow [
    step "3"
    phase "Exploit"
    description "[Access or Modify Flash Application Variables] As the attacker succeeds in exploiting the vulnerability, they target the content of the flash application to steal variable content, password, etc."
    techniques "Develop malicious Flash application that is injected through vectors identified during the Experiment Phase and loaded by the victim browser's flash plugin and sends document information to the attacker."
    techniques "Develop malicious Flash application that is injected through vectors identified during the Experiment Phase and takes commands from an attacker's server and then causes the flash application to execute appropriately."
  ]
  execution_flow [
    step "4"
    phase "Exploit"
    description "[Execute JavaScript in victim's browser] When the attacker targets the current flash application, they can choose to inject JavaScript in the client's DOM and therefore execute cross-site scripting attack."
    techniques "_networkx_list_start"
    techniques "Develop malicious JavaScript that is injected from the rogue flash movie to the targeted flash application through vectors identified during the Experiment Phase and loaded by the victim's browser."
  ]
  node [
    id 0
    label "record_all_instances_of_urls"
  ]
  node [
    id 1
    label "record_the_variables"
  ]
  node [
    id 2
    label "explore_the_website"
  ]
  node [
    id 3
    label "retrieve_the_flash_source_code"
  ]
  node [
    id 4
    label "attempt_to_inject_a_remote_flash_file"
  ]
  node [
    id 5
    label "modify_the_variable_of_the_swf_file_that_contains_the_remote_movie_url_to_the_attacker_controlled_flash_file"
  ]
  node [
    id 6
    label "develop_malicious_flash_application_that_is_injected_through_vectors_identified_during_the_experiment_phase_and_loaded_by_the_victim_browser_s_flash_plugin_and_sends_document_information_to_the_attacker"
  ]
  node [
    id 7
    label "target_the_current_flash_application"
  ]
  node [
    id 8
    label "try_to_get_their_malicious_flash_movie_to_be_executed_in_the_targeted_flash_application"
  ]
  node [
    id 9
    label "execute_malicious_file"
  ]
  node [
    id 10
    label "inject_their_malicious_file"
  ]
  node [
    id 11
    label "fail_to_sanitize_such_parameters_against_malicious_manipulation"
  ]
  node [
    id 12
    label "follow_a_crafted_link_created_by_the_attacker"
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
    target 6
  ]
  edge [
    source 6
    target 7
  ]
  edge [
    source 6
    target 8
  ]
  edge [
    source 7
    target 6
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
