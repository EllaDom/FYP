graph [
  directed 1
  capec_id "504"
  name "Task Impersonation"
  abstraction "Standard"
  status "Stable"
  description "An adversary, through a previously installed malicious application, impersonates an expected or routine task in an attempt to steal sensitive information or leverage a user's privileges."
  likelihood "Medium"
  severity "High"
  related_attack_patterns "_networkx_list_start"
  related_attack_patterns [
    capec_id "173"
    nature "ChildOf"
  ]
  prerequisites "The adversary must already have access to the target system via some means."
  prerequisites "A legitimate task must exist that an adversary can impersonate to glean credentials."
  prerequisites "The user's privileges allow them to execute certain tasks with elevated privileges."
  skills_required "_networkx_list_start"
  skills_required [
    level "Low"
    description "Once an adversary has gained access to the target system, impersonating a task is trivial."
  ]
  resources_required "Malware or some other means to initially comprise the target system."
  resources_required "Additional malware to impersonate a legitimate task."
  consequences "_networkx_list_start"
  consequences [
    scope "Access Control"
    scope "Authentication"
    impact "Gain Privileges"
  ]
  mitigations "_networkx_list_start"
  mitigations "The only known mitigation to this attack is to avoid installing the malicious application on the device. However, to impersonate a running task the malicious application does need the GET_TASKS permission to be able to query the task list, and being suspicious of applications with that permission can help."
  example_instances "An adversary monitors the system task list for Microsoft Outlook in an attempt to determine when the application may prompt the user to enter their credentials to view encrypted email. Once the task is executed, the adversary impersonates the credential prompt to obtain the user's Microsoft Outlook encryption credentials. These credentials can then be leveraged by the adversary to read a user's encrypted email."
  example_instances "An adversary prompts a user to authorize an elevation of privileges, implying that a background task needs additional permissions to execute. The user accepts the privilege elevation, allowing the adversary to execute additional malware or tasks with the user's privileges."
  related_weaknesses "_networkx_list_start"
  related_weaknesses "1021"
  matched_cwes "_networkx_list_start"
  matched_cwes "1021"
  taxonomy_mappings "_networkx_list_start"
  taxonomy_mappings [
    taxonomy_name "ATTACK"
    entry_id "1036.004"
    entry_name "Masquerading: Masquerade Task or Service"
  ]
  execution_flow [
    step "1"
    phase "Explore"
    description "[Determine suitable tasks to exploit] Determine what tasks exist on the target system that may result in a user providing sensitive information."
    techniques "Determine what tasks prompt a user for their credentials."
    techniques "Determine what tasks may prompt a user to authorize a process to execute with elevated privileges."
  ]
  execution_flow [
    step "2"
    phase "Exploit"
    description "[Impersonate Task] Impersonate a legitimate task, either expected or unexpected, in an attempt to gain user credentials or to ride the user's privileges."
    techniques "Prompt a user for their credentials, while making the user believe the credential request is legitimate."
    techniques "Prompt a user to authorize a task to run with elevated privileges, while making the user believe the request is legitimate."
  ]
  node [
    id 0
    label "determine_suitable_tasks_to_exploit"
  ]
  node [
    id 1
    label "impersonate_a_legitimate_task"
  ]
  node [
    id 2
    label "prompt_a_user"
  ]
  node [
    id 3
    label "monitor_the_system_task_list_for_microsoft_outlook"
  ]
  node [
    id 4
    label "execute_the_task"
  ]
  node [
    id 5
    label "leverage_these_credentials"
  ]
  node [
    id 6
    label "accept_the_privilege_elevation"
  ]
  node [
    id 7
    label "gain_access_to_the_target_system"
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
    target 2
  ]
  edge [
    source 2
    target 3
  ]
  edge [
    source 2
    target 6
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
    target 2
  ]
  edge [
    source 6
    target 7
  ]
]
