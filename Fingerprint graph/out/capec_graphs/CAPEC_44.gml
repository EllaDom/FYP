graph [
  directed 1
  capec_id "44"
  name "Overflow Binary Resource File"
  abstraction "Detailed"
  status "Draft"
  description "An attack of this type exploits a buffer overflow vulnerability in the handling of binary resources. Binary resources may include music files like MP3, image files like JPEG files, and any other binary file. These attacks may pass unnoticed to the client machine through normal usage of files, such as a browser loading a seemingly innocent JPEG file. This can allow the adversary access to the execution stack and execute arbitrary code in the target process."
  likelihood "High"
  severity "Very High"
  related_attack_patterns [
    capec_id "100"
    nature "ChildOf"
  ]
  related_attack_patterns [
    capec_id "23"
    nature "ChildOf"
  ]
  prerequisites "Target software processes binary resource files."
  prerequisites "Target software contains a buffer overflow vulnerability reachable through input from a user-controllable binary resource file."
  skills_required "_networkx_list_start"
  skills_required [
    level "Medium"
    description "To modify file, deceive client into downloading, locate and exploit remote stack or heap vulnerability"
  ]
  resources_required "[]"
  consequences [
    scope "_networkx_list_start"
    scope "Availability"
    impact "Unreliable Execution"
  ]
  consequences [
    scope "Confidentiality"
    scope "Integrity"
    scope "Availability"
    impact "Execute Unauthorized Commands"
  ]
  mitigations "Perform appropriate bounds checking on all buffers."
  mitigations "Design: Enforce principle of least privilege"
  mitigations "Design: Static code analysis"
  mitigations "Implementation: Execute program in less trusted process space environment, do not allow lower integrity processes to write to higher integrity processes"
  mitigations "Implementation: Keep software patched to ensure that known vulnerabilities are not available for adversaries to target on host."
  example_instances "_networkx_list_start"
  example_instances "Binary files like music and video files are appended with additional data to cause buffer overflow on target systems. Because these files may be filled with otherwise popular content, the adversary has an excellent vector for wide distribution. There have been numerous cases, for example of malicious screen savers for sports teams that are distributed on the event of the team winning a championship."
  related_weaknesses "120"
  related_weaknesses "119"
  related_weaknesses "697"
  matched_cwes "119"
  matched_cwes "120"
  taxonomy_mappings "[]"
  execution_flow [
    step "1"
    phase "Explore"
    description "[Identify target software] The adversary identifies software that uses external binary files in some way. This could be a file upload, downloading a file from a shared location, or other means."
    techniques "[]"
  ]
  execution_flow [
    step "2"
    phase "Experiment"
    description "[Find injection vector] The adversary creates a malicious binary file by altering the header to make the file seem shorter than it is. Additional bytes are added to the end of the file to be placed in the overflowed location. The adversary then deploys the file to the software to determine if a buffer overflow was successful."
    techniques "[]"
  ]
  execution_flow [
    step "3"
    phase "Experiment"
    description "[Craft overflow content] Once the adversary has determined that this attack is viable, they will specially craft the binary file in a way that achieves the desired behavior. If the source code is available, the adversary can carefully craft the malicious file so that the return address is overwritten to an intended value. If the source code is not available, the adversary will iteratively alter the file in order to overwrite the return address correctly."
    techniques "Create malicious shellcode that will execute when the program execution is returned to it."
    techniques "Use a NOP-sled in the overflow content to more easily &#34;slide&#34; into the malicious code. This is done so that the exact return address need not be correct, only in the range of all of the NOPs"
  ]
  execution_flow [
    step "4"
    phase "Exploit"
    description "[Overflow the buffer] Once the adversary has constructed a file that will effectively overflow the targeted software in the intended way. The file is deployed to the software, either by serving it directly to the software or placing it in a shared location for a victim to load into the software."
    techniques "[]"
  ]
  node [
    id 0
    label "identify_target_application"
  ]
  node [
    id 1
    label "download_a_file"
  ]
  node [
    id 2
    label "find_injection_vector"
  ]
  node [
    id 3
    label "create_a_malicious_binary_file"
  ]
  node [
    id 4
    label "add_additional_bytes"
  ]
  node [
    id 5
    label "deploy_the_file"
  ]
  node [
    id 6
    label "execute_malicious_file"
  ]
  node [
    id 7
    label "modify_files"
  ]
  node [
    id 8
    label "create_malicious_shellcode_that_will_execute_when_the_program_execution_is_returned_to_it"
  ]
  node [
    id 9
    label "sle_nop"
  ]
  node [
    id 10
    label "do_this"
  ]
  node [
    id 11
    label "overflow_the_buffer"
  ]
  node [
    id 12
    label "append_binary_files_like_music_and_video_files"
  ]
  node [
    id 13
    label "fill_these_files"
  ]
  node [
    id 14
    label "distribute_that"
  ]
  node [
    id 15
    label "process_binary_resource_files"
  ]
  node [
    id 16
    label "contain_a_buffer_overflow_vulnerability_reachable_through_input_from_a_user_controllable_binary_resource_file"
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
    source 5
    target 12
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
    target 5
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
