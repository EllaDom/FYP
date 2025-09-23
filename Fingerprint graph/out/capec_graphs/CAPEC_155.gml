graph [
  directed 1
  capec_id "155"
  name "Screen Temporary Files for Sensitive Information"
  abstraction "Detailed"
  status "Draft"
  description "An adversary exploits the temporary, insecure storage of information by monitoring the content of files used to store temp data during an application's routine execution flow. Many applications use temporary files to accelerate processing or to provide records of state across multiple executions of the application. Sometimes, however, these temporary files may end up storing sensitive information. By screening an application's temporary files, an adversary might be able to discover such sensitive information. For example, web browsers often cache content to accelerate subsequent lookups. If the content contains sensitive information then the adversary could recover this from the web cache."
  likelihood "Medium"
  severity "Medium"
  related_attack_patterns "_networkx_list_start"
  related_attack_patterns [
    capec_id "150"
    nature "ChildOf"
  ]
  prerequisites "_networkx_list_start"
  prerequisites "The target application must utilize temporary files and must fail to adequately secure them against other parties reading them."
  skills_required "[]"
  resources_required "_networkx_list_start"
  resources_required "Because some application may have a large number of temporary files and/or these temporary files may be very large, an adversary may need tools that help them quickly search these files for sensitive information. If the adversary can simply copy the files to another location and if the speed of the search is not important, the adversary can still perform the attack without any special resources."
  consequences "[]"
  mitigations "[]"
  example_instances "[]"
  related_weaknesses "_networkx_list_start"
  related_weaknesses "377"
  matched_cwes "_networkx_list_start"
  matched_cwes "377"
  taxonomy_mappings "[]"
  execution_flow [
    step "1"
    phase "Explore"
    description "[Look for temporary files in target application] An adversary will try to discover temporary files in a target application. Knowledge of where the temporary files are being stored is important information."
    techniques "[]"
  ]
  execution_flow [
    step "2"
    phase "Experiment"
    description "[Attempt to read temporary files] An adversary will attempt to read any temporary files they may have discovered through normal means."
    techniques "Attempt to get the file by querying the file path to a web server"
    techniques "Using a remote shell into an application, read temporary files and send out information remotely if necessary"
    techniques "Recover temporary information from a user's browser cache"
  ]
  execution_flow [
    step "3"
    phase "Exploit"
    description "[Use function weaknesses to gain access to temporary files] If normal means to read temporary files did not work, an adversary will attempt to exploit weak temporary file functions to gain access to temporary files."
    techniques "Some C functions such as tmpnam(), tempnam(), and mktemp() will create a temporary file with a unique name, but do not stop an adversary from creating a file of the same name before it is opened by the application. Because these functions do not create file names that are sufficiently random, an adversary will try to make a file of the same name, causing a collision, and possibly altering file permissions for the temporary file so that it is able to be read."
    techniques "Similar to the last technique, an adversary might also create a file name collision using a linked file in a unix system such that the temporary file contents written out by the application write to a file of the adversaries choosing, allowing them to read the file contents."
  ]
  node [
    id 0
    label "try_to_discover_temporary_files_in_a_target_application"
  ]
  node [
    id 1
    label "store_the_temporary_files"
  ]
  node [
    id 2
    label "attempt_to_read_temporary_files"
  ]
  node [
    id 3
    label "attempt_to_get_the_file_by_querying_the_file_path_to_a_web_server"
  ]
  node [
    id 4
    label "recover_temporary_information"
  ]
  node [
    id 5
    label "create_file_names_that_are_sufficiently_random"
  ]
  node [
    id 6
    label "create_a_file_name_collision_using_a_linked_file_in_a_unix_system"
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
    source 1
    target 5
  ]
  edge [
    source 2
    target 3
  ]
  edge [
    source 2
    target 4
  ]
  edge [
    source 2
    target 1
  ]
  edge [
    source 3
    target 2
  ]
  edge [
    source 4
    target 2
  ]
  edge [
    source 5
    target 6
  ]
  edge [
    source 6
    target 1
  ]
]
