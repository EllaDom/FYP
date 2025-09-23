graph [
  directed 1
  capec_id "234"
  name "Hijacking a privileged process"
  abstraction "Standard"
  status "Draft"
  description "An adversary gains control of a process that is assigned elevated privileges in order to execute arbitrary code with those privileges. Some processes are assigned elevated privileges on an operating system, usually through association with a particular user, group, or role. If an attacker can hijack this process, they will be able to assume its level of privilege in order to execute their own code."
  likelihood ""
  severity "Medium"
  related_attack_patterns [
    capec_id "233"
    nature "ChildOf"
  ]
  related_attack_patterns [
    capec_id "242"
    nature "CanFollow"
  ]
  related_attack_patterns [
    capec_id "175"
    nature "CanFollow"
  ]
  related_attack_patterns [
    capec_id "100"
    nature "CanFollow"
  ]
  prerequisites "_networkx_list_start"
  prerequisites "The targeted process or operating system must contain a bug that allows attackers to hijack the targeted process."
  skills_required "[]"
  resources_required "_networkx_list_start"
  resources_required "None: No specialized resources are required to execute this type of attack."
  consequences "[]"
  mitigations "[]"
  example_instances "[]"
  related_weaknesses "732"
  related_weaknesses "648"
  matched_cwes "_networkx_list_start"
  matched_cwes "732"
  taxonomy_mappings "[]"
  execution_flow [
    step "1"
    phase "Explore"
    description "[Find process with elevated priveleges] The adversary probes for processes running with elevated privileges."
    techniques "On Windows, use the process explorer's security tab to see if a process is running with administror privileges."
    techniques "On Linux, use the ps command to view running processes and pipe the output to a search for a particular user, or the root user."
  ]
  execution_flow [
    step "2"
    phase "Experiment"
    description "[Find vulnerability in running process] The adversary looks for a vulnerability in the running process that would allow for arbitrary code execution with the privilege of the running process."
    techniques "Look for improper input validation"
    techniques "Look for a buffer overflow which may be exploited if an adversary can inject unvalidated data."
    techniques "Utilize system utilities that support process control that have been inadequately secured"
  ]
  execution_flow [
    step "3"
    phase "Exploit"
    description "[Execute arbitrary code] The adversary exploits the vulnerability that they have found and hijacks the running process."
    techniques "[]"
  ]
  node [
    id 0
    label "find_process_with_elevated_priveleges"
  ]
  node [
    id 1
    label "view_running_processes"
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
    label "exploit_the_vulnerability_that_they_have_found_and_hijacks_the_running_process"
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
]
