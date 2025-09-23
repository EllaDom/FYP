graph [
  directed 1
  capec_id "23"
  name "File Content Injection"
  abstraction "Standard"
  status "Draft"
  description "An adversary poisons files with a malicious payload (targeting the file systems accessible by the target software), which may be passed through by standard channels such as via email, and standard web content like PDF and multimedia files. The adversary exploits known vulnerabilities or handling routines in the target processes, in order to exploit the host's trust in executing remote content, including binary files."
  likelihood "High"
  severity "Very High"
  related_attack_patterns [
    capec_id "242"
    nature "ChildOf"
  ]
  related_attack_patterns [
    capec_id "165"
    nature "CanAlsoBe"
  ]
  prerequisites "The target software must consume files."
  prerequisites "The adversary must have access to modify files that the target software will consume."
  skills_required "_networkx_list_start"
  skills_required [
    level "Medium"
    description "How to poison a file with malicious payload that will exploit a vulnerability when the file is opened. The adversary must also know how to place the file onto a system where it will be opened by an unsuspecting party, or force the file to be opened."
  ]
  resources_required "[]"
  consequences "_networkx_list_start"
  consequences [
    scope "Confidentiality"
    scope "Integrity"
    scope "Availability"
    impact "Execute Unauthorized Commands"
  ]
  mitigations "Design: Enforce principle of least privilege"
  mitigations "Design: Validate all input for content including files. Ensure that if files and remote content must be accepted that once accepted, they are placed in a sandbox type location so that lower assurance clients cannot write up to higher assurance processes (like Web server processes for example)"
  mitigations "Design: Execute programs with constrained privileges, so parent process does not open up further vulnerabilities. Ensure that all directories, temporary directories and files, and memory are executing with limited privileges to protect against remote execution."
  mitigations "Design: Proxy communication to host, so that communications are terminated at the proxy, sanitizing the requests before forwarding to server host."
  mitigations "Implementation: Virus scanning on host"
  mitigations "Implementation: Host integrity monitoring for critical files, directories, and processes. The goal of host integrity monitoring is to be aware when a security issue has occurred so that incident response and other forensic activities can begin."
  example_instances "_networkx_list_start"
  example_instances "PHP is a very popular language used for developing web applications. When PHP is used with global variables, a vulnerability may be opened that affects the file system. A standard HTML form that allows for remote users to upload files, may also place those files in a public directory where the adversary can directly access and execute them through a browser. This vulnerability allows remote adversaries to execute arbitrary code on the system, and can result in the adversary being able to erase intrusion evidence from system and application logs."
  related_weaknesses "_networkx_list_start"
  related_weaknesses "20"
  matched_cwes "_networkx_list_start"
  matched_cwes "20"
  taxonomy_mappings "[]"
  execution_flow "[]"
  node [
    id 0
    label "develop_web_applications"
  ]
  node [
    id 1
    label "open_when_php_is_used_with_global_variables"
  ]
  node [
    id 2
    label "allow_to_upload_files"
  ]
  node [
    id 3
    label "consume_files"
  ]
  node [
    id 4
    label "modify_files_that_the_target_software_will_consume"
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
