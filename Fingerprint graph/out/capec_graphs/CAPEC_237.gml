graph [
  directed 1
  capec_id "237"
  name "Escaping a Sandbox by Calling Code in Another Language"
  abstraction "Detailed"
  status "Draft"
  description "The attacker may submit malicious code of another language to obtain access to privileges that were not intentionally exposed by the sandbox, thus escaping the sandbox. For instance, Java code cannot perform unsafe operations, such as modifying arbitrary memory locations, due to restrictions placed on it by the Byte code Verifier and the JVM. If allowed, Java code can call directly into native C code, which may perform unsafe operations, such as call system calls and modify arbitrary memory locations on their behalf. To provide isolation, Java does not grant untrusted code with unmediated access to native C code. Instead, the sandboxed code is typically allowed to call some subset of the pre-existing native code that is part of standard libraries."
  likelihood "Low"
  severity "Very High"
  related_attack_patterns "_networkx_list_start"
  related_attack_patterns [
    capec_id "480"
    nature "ChildOf"
  ]
  prerequisites "[]"
  skills_required "_networkx_list_start"
  skills_required [
    level "High"
    description "The attacker must have a good knowledge of the platform specific mechanisms of signing and verifying code. Most code signing and verification schemes are based on use of cryptography, the attacker needs to have an understand of these cryptographic operations in good detail."
  ]
  resources_required "_networkx_list_start"
  resources_required "None: No specialized resources are required to execute this type of attack."
  consequences [
    scope "Access Control"
    scope "Authorization"
    impact "Bypass Protection Mechanism"
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
  mitigations "Assurance: Sanitize the code of the standard libraries to make sure there is no security weaknesses in them."
  mitigations "Design: Use obfuscation and other techniques to prevent reverse engineering the standard libraries."
  mitigations "Assurance: Use static analysis tool to do code review and dynamic tool to do penetration test on the standard library."
  mitigations "Configuration: Get latest updates for the computer."
  example_instances "_networkx_list_start"
  example_instances "Exploit: Java/ByteVerify.C is a detection of malicious code that attempts to exploit a vulnerability in the Microsoft Virtual Machine (VM). The VM enables Java programs to run on Windows platforms. The Microsoft Java VM is included in most versions of Windows and Internet Explorer. In some versions of the Microsoft VM, a vulnerability exists because of a flaw in the way the ByteCode Verifier checks code when it is initially being loaded by the Microsoft VM. The ByteCode Verifier is a low level process in the Microsoft VM that is responsible for checking the validity of code - or byte code - as it is initially being loaded into the Microsoft VM. Java/ByteVerify.C attempts to download a file named &#34;msits.exe&#34;, located in the same virtual directory as the Java applet, into the Windows system folder, and with a random file name. It then tries to execute this specific file. This flaw enables attackers to execute arbitrary code on a user's machine such as writing, downloading and executing additional malware. This vulnerability is addressed by update MS03-011, released in 2003."
  related_weaknesses "_networkx_list_start"
  related_weaknesses "693"
  matched_cwes "_networkx_list_start"
  matched_cwes "693"
  taxonomy_mappings "[]"
  execution_flow [
    step "1"
    phase "Explore"
    description "[Probing] The attacker probes the target application to see whether calling code of another language is allowed within a sandbox."
    techniques "_networkx_list_start"
    techniques "The attacker probes the target application to see whether calling code of another language is allowed within a sandbox."
  ]
  execution_flow [
    step "2"
    phase "Explore"
    description "[Analysis] The attacker analyzes the target application to get a list of cross code weaknesses in the standard libraries of the sandbox."
    techniques "_networkx_list_start"
    techniques "The attacker analyzes the target application to get a list of cross code weaknesses in the standard libraries of the sandbox."
  ]
  execution_flow [
    step "3"
    phase "Experiment"
    description "[Verify the exploitable security weaknesses] The attacker tries to craft malicious code of another language allowed by the sandbox to verify the security weaknesses of the standard libraries found in the Explore phase."
    techniques "_networkx_list_start"
    techniques "The attacker tries to explore the security weaknesses by calling malicious code of another language allowed by the sandbox."
  ]
  execution_flow [
    step "4"
    phase "Exploit"
    description "[Exploit the security weaknesses in the standard libraries] The attacker calls malicious code of another language to exploit the security weaknesses in the standard libraries verified in the Experiment phase. The attacker will be able to obtain access to privileges that were not intentionally exposed by the sandbox, thus escaping the sandbox."
    techniques "_networkx_list_start"
    techniques "The attacker calls malicious code of another language to exploit the security weaknesses in the standard libraries."
  ]
  node [
    id 0
    label "probe_the_target_application"
  ]
  node [
    id 1
    label "verify_the_exploitable_security_weaknesses"
  ]
  node [
    id 2
    label "try_to_explore_the_security_weaknesses_by_calling_malicious_code_of_another_language_allowed_by_the_sandbox"
  ]
  node [
    id 3
    label "exploit_the_security_weaknesses_in_the_standard_libraries"
  ]
  node [
    id 4
    label "obtain_access_to_privileges_that_were_not_intentionally_exposed_by_the_sandbox"
  ]
  node [
    id 5
    label "call_malicious_code_of_another_language"
  ]
  node [
    id 6
    label "attempt_to_exploit_a_vulnerability_in_the_microsoft_virtual_machine_vm"
  ]
  node [
    id 7
    label "enable_java_programs"
  ]
  node [
    id 8
    label "include_the_microsoft_java_vm"
  ]
  node [
    id 9
    label "exist_the_bytecode_verifier_checks_code"
  ]
  node [
    id 10
    label "check_the_validity_of_code_or_byte_code"
  ]
  node [
    id 11
    label "attempt_to_download_a_file_named_msits_exe_located_in_the_same_virtual_directory_as_the_java_applet_into_the_windows_system_folder_and_with_a_random_file_name"
  ]
  node [
    id 12
    label "try_to_execute_this_specific_file"
  ]
  node [
    id 13
    label "enable_the_attacker"
  ]
  node [
    id 14
    label "address_this_vulnerability"
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
]
