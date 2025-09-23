graph [
  directed 1
  capec_id "640"
  name "Inclusion of Code in Existing Process"
  abstraction "Detailed"
  status "Stable"
  description "The adversary takes advantage of a bug in an application failing to verify the integrity of the running process to execute arbitrary code in the address space of a separate live process. The adversary could use running code in the context of another process to try to access process's memory, system/network resources, etc. The goal of this attack is to evade detection defenses and escalate privileges by masking the malicious code under an existing legitimate process. Examples of approaches include but not limited to: dynamic-link library (DLL) injection, portable executable injection, thread execution hijacking, ptrace system calls, VDSO hijacking, function hooking, reflective code loading, and more."
  likelihood "Low"
  severity "High"
  related_attack_patterns "_networkx_list_start"
  related_attack_patterns [
    capec_id "251"
    nature "ChildOf"
  ]
  prerequisites "_networkx_list_start"
  prerequisites "The targeted application fails to verify the integrity of the running process that allows an adversary to execute arbitrary code."
  skills_required "_networkx_list_start"
  skills_required [
    level "High"
    description "Knowledge of how to load malicious code into the memory space of a running process, as well as the ability to have the running process execute this code. For example, with DLL injection, the adversary must know how to load a DLL into the memory space of another running process, and cause this process to execute the code inside of the DLL."
  ]
  resources_required "[]"
  consequences "_networkx_list_start"
  consequences [
    scope "Integrity"
    scope "Confidentiality"
    impact "Execute Unauthorized Commands"
  ]
  mitigations "Prevent unknown or malicious software from loading through using an allowlist policy."
  mitigations "Properly restrict the location of the software being used."
  mitigations "Leverage security kernel modules providing advanced access control and process restrictions like SELinux."
  mitigations "Monitor API calls like CreateRemoteThread, SuspendThread/SetThreadContext/ResumeThread, QueueUserAPC, and similar for Windows."
  mitigations "Monitor API calls like ptrace system call, use of LD_PRELOAD environment variable, dlfcn dynamic linking API calls, and similar for Linux."
  mitigations "Monitor API calls like SetWindowsHookEx and SetWinEventHook which install hook procedures for Windows."
  mitigations "Monitor processes and command-line arguments for unknown behavior related to code injection."
  example_instances "[]"
  related_weaknesses "114"
  related_weaknesses "829"
  matched_cwes "_networkx_list_start"
  matched_cwes "829"
  taxonomy_mappings [
    taxonomy_name "ATTACK"
    entry_id "1505.005"
    entry_name "Server Software Component: Terminal Services DLL"
  ]
  taxonomy_mappings [
    taxonomy_name "ATTACK"
    entry_id "1574.006"
    entry_name "Hijack Execution Flow: Dynamic Linker Hijacking"
  ]
  taxonomy_mappings [
    taxonomy_name "ATTACK"
    entry_id "1574.013"
    entry_name "Hijack Execution Flow: KernelCallbackTable"
  ]
  taxonomy_mappings [
    taxonomy_name "ATTACK"
    entry_id "1620"
    entry_name "Reflective Code Loading"
  ]
  execution_flow [
    step "1"
    phase "Explore"
    description "[Determine target process] The adversary determines a process with sufficient privileges that they wish to include code into."
    techniques "On Windows, use the process explorer's security tab to see if a process is running with administror privileges."
    techniques "On Linux, use the ps command to view running processes and pipe the output to a search for a particular user, or the root user."
  ]
  execution_flow [
    step "2"
    phase "Experiment"
    description "[Attempt to include simple code with known output] The adversary attempts to include very simple code into the existing process to determine if the code inclusion worked. The code will differ based on the approach used to include code into an existing process."
    techniques "[]"
  ]
  execution_flow [
    step "3"
    phase "Exploit"
    description "[Include arbitrary code into existing process] Once an adversary has determined that including code into the existing process is possible, they will include code for a targeted purpose, such as accessing that process's memory."
    techniques "[]"
  ]
  node [
    id 0
    label "determine_target_process"
  ]
  node [
    id 1
    label "determine_a_process_with_sufficient_privileges_they_wish_that_to_include_code_into"
  ]
  node [
    id 2
    label "view_running_processes"
  ]
  node [
    id 3
    label "attempt_to_include_simple_code_with_known_output"
  ]
  node [
    id 4
    label "attempt_to_include_very_simple_code_into_the_existing_process_to_determine_if_the_code_inclusion_worked"
  ]
  node [
    id 5
    label "include_arbitrary_code_into_existing_process"
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
]
