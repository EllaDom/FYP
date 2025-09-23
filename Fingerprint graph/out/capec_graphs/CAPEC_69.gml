graph [
  directed 1
  capec_id "69"
  name "Target Programs with Elevated Privileges"
  abstraction "Standard"
  status "Draft"
  description "This attack targets programs running with elevated privileges. The adversary tries to leverage a vulnerability in the running program and get arbitrary code to execute with elevated privileges."
  likelihood "High"
  severity "Very High"
  related_attack_patterns [
    capec_id "233"
    nature "ChildOf"
  ]
  related_attack_patterns [
    capec_id "8"
    nature "CanPrecede"
  ]
  related_attack_patterns [
    capec_id "9"
    nature "CanPrecede"
  ]
  related_attack_patterns [
    capec_id "10"
    nature "CanPrecede"
  ]
  related_attack_patterns [
    capec_id "67"
    nature "CanPrecede"
  ]
  prerequisites "The targeted program runs with elevated OS privileges."
  prerequisites "The targeted program accepts input data from the user or from another program."
  prerequisites "The targeted program is giving away information about itself. Before performing such attack, an eventual attacker may need to gather information about the services running on the host target. The more the host target is verbose about the services that are running (version number of application, etc.) the more information can be gather by an attacker."
  prerequisites "This attack often requires communicating with the host target services directly. For instance Telnet may be enough to communicate with the host target."
  skills_required [
    level "Low"
    description "An attacker can use a tool to scan and automatically launch an attack against known issues. A tool can also repeat a sequence of instructions and try to brute force the service on the host target, an example of that would be the flooding technique."
  ]
  skills_required [
    level "Medium"
    description "More advanced attack may require knowledge of the protocol spoken by the host service."
  ]
  resources_required "[]"
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
  consequences [
    scope "_networkx_list_start"
    scope "Availability"
    impact "Resource Consumption"
  ]
  mitigations "Apply the principle of least privilege."
  mitigations "Validate all untrusted data."
  mitigations "Apply the latest patches."
  mitigations "Scan your services and disable the ones which are not needed and are exposed unnecessarily. Exposing programs increases the attack surface. Only expose the services which are needed and have security mechanisms such as authentication built around them."
  mitigations "Avoid revealing information about your system (e.g., version of the program) to anonymous users."
  mitigations "Make sure that your program or service fail safely. What happen if the communication protocol is interrupted suddenly? What happen if a parameter is missing? Does your system have resistance and resilience to attack? Fail safely when a resource exhaustion occurs."
  mitigations "If possible use a sandbox model which limits the actions that programs can take. A sandbox restricts a program to a set of privileges and commands that make it difficult or impossible for the program to cause any damage."
  mitigations "Check your program for buffer overflow and format String vulnerabilities which can lead to execution of malicious code."
  mitigations "Monitor traffic and resource usage and pay attention if resource exhaustion occurs."
  mitigations "Protect your log file from unauthorized modification and log forging."
  example_instances "[]"
  related_weaknesses "250"
  related_weaknesses "15"
  matched_cwes "_networkx_list_start"
  matched_cwes "250"
  taxonomy_mappings "[]"
  execution_flow [
    step "1"
    phase "Explore"
    description "[Find programs with elevated priveleges] The adversary probes for programs running with elevated privileges."
    techniques "_networkx_list_start"
    techniques "Look for programs that write to the system directories or registry keys (such as HKLM, which stores a number of critical Windows environment variables). These programs are typically running with elevated privileges and have usually not been designed with security in mind. Such programs are excellent exploit targets because they yield lots of power when they break."
  ]
  execution_flow [
    step "2"
    phase "Explore"
    description "[Find vulnerability in running program] The adversary looks for a vulnerability in the running program that would allow for arbitrary code execution with the privilege of the running program."
    techniques "Look for improper input validation"
    techniques "Look for improper failure safety. For instance when a program fails it may authorize restricted access to anyone."
    techniques "Look for a buffer overflow which may be exploited if an adversary can inject unvalidated data."
  ]
  execution_flow [
    step "3"
    phase "Exploit"
    description "[Execute arbitrary code] The adversary exploits the vulnerability that they have found. For instance, they can try to inject and execute arbitrary code or write to OS resources."
    techniques "[]"
  ]
  node [
    id 0
    label "find_process_with_elevated_priveleges"
  ]
  node [
    id 1
    label "yield_lots_of_power"
  ]
  node [
    id 2
    label "find_vulnerability_in_running_process"
  ]
  node [
    id 3
    label "execute_arbitrary_code"
  ]
  node [
    id 4
    label "exploit_that"
  ]
  node [
    id 5
    label "try_to_inject_and_execute_arbitrary_code_or_write_to_os_resources"
  ]
  node [
    id 6
    label "accept_user_data_for_processing_and"
  ]
  node [
    id 7
    label "give_information_about_itself"
  ]
  node [
    id 8
    label "perform_such_attack"
  ]
  node [
    id 9
    label "verbose_the_host_target"
  ]
  node [
    id 10
    label "gather_the_necessary_information"
  ]
  node [
    id 11
    label "require_communicating_with_the_host_target_services"
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
]
