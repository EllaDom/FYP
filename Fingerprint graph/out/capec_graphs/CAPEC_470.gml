graph [
  directed 1
  capec_id "470"
  name "Expanding Control over the Operating System from the Database"
  abstraction "Detailed"
  status "Draft"
  description "An attacker is able to leverage access gained to the database to read / write data to the file system, compromise the operating system, create a tunnel for accessing the host machine, and use this access to potentially attack other machines on the same network as the database machine. Traditionally SQL injections attacks are viewed as a way to gain unauthorized read access to the data stored in the database, modify the data in the database, delete the data, etc. However, almost every data base management system (DBMS) system includes facilities that if compromised allow an attacker complete access to the file system, operating system, and full access to the host running the database. The attacker can then use this privileged access to launch subsequent attacks. These facilities include dropping into a command shell, creating user defined functions that can call system level libraries present on the host machine, stored procedures, etc."
  likelihood ""
  severity "Very High"
  related_attack_patterns "_networkx_list_start"
  related_attack_patterns [
    capec_id "66"
    nature "ChildOf"
  ]
  prerequisites "_networkx_list_start"
  prerequisites "A vulnerable DBMS is usedA SQL injection exists that gives an attacker access to the database or an attacker has access to the DBMS via other means"
  skills_required "_networkx_list_start"
  skills_required [
    level "High"
    description "Low level knowledge of the various facilities available in different DBMS systems for interacting with the file system and operating system"
  ]
  resources_required "[]"
  consequences "[]"
  mitigations "Design: Follow the defensive programming practices needed to protect an application accessing the database from SQL injection"
  mitigations "Configuration: Ensure that the DBMS is patched with the latest security patches"
  mitigations "Design: Ensure that the DBMS login used by the application has the lowest possible level of privileges in the DBMS"
  mitigations "Design: Ensure that DBMS runs with the lowest possible level of privileges on the host machine and that it runs as a separate user"
  mitigations "Usage: Do not use the DBMS machine for anything else other than the database"
  mitigations "Usage: Do not place any trust in the database host on the internal network. Authenticate and validate all network activity originating from the database host."
  mitigations "Usage: Use an intrusion detection system to monitor network connections and logs on the database host."
  mitigations "Implementation: Remove / disable all unneeded / unused functions of the DBMS system that may allow an attacker to elevate privileges if compromised"
  example_instances "[]"
  related_weaknesses "250"
  related_weaknesses "89"
  matched_cwes "250"
  matched_cwes "89"
  taxonomy_mappings "[]"
  execution_flow [
    step "1"
    phase "Explore"
    description "The adversary identifies a database management system running on a machine they would like to gain control over, or on a network they want to move laterally through."
    techniques "[]"
  ]
  execution_flow [
    step "2"
    phase "Experiment"
    description "The adversary goes about the typical steps of an SQL injection and determines if an injection is possible."
    techniques "[]"
  ]
  execution_flow [
    step "3"
    phase "Experiment"
    description "Once the Adversary determines that an SQL injection is possible, they must ensure that the requirements for the attack are met. These are a high privileged session user and batched query support. This is done in similar ways to discovering if an SQL injection is possible."
    techniques "[]"
  ]
  execution_flow [
    step "4"
    phase "Experiment"
    description "If the requirements are met, based on the database management system that is running, the adversary will find or create user defined functions (UDFs) that can be loaded as DLLs. An example of a DLL can be found at https://github.com/rapid7/metasploit-framework/tree/master/data/exploits/mysql"
    techniques "[]"
  ]
  execution_flow [
    step "5"
    phase "Experiment"
    description "In order to load the DLL, the adversary must first find the path to the plugin directory. The command to achieve this is different based on the type of DBMS, but for MySQL, this can be achieved by running the command &#34;select @@plugin_dir&#34;"
    techniques "[]"
  ]
  execution_flow [
    step "6"
    phase "Exploit"
    description "The DLL is then moved into the previously found plugin directory so that the contained functions can be loaded. This can be done in a number of ways; loading from a network share, writing the entire hex encoded string to a file in the plugin directory, or loading the DLL into a table and then into a file. An example using MySQL to load the hex string is as follows. select 0x4d5a9000... into dump file &#34;{plugin directory}\\udf.dll&#34;;"
    techniques "[]"
  ]
  execution_flow [
    step "6"
    phase "Exploit"
    description "Once the DLL is in the plugin directory, a command is then run to load the UDFs. An example of this in MySQL is &#34;create function sys_eval returns string soname 'udf.dll';&#34; The function sys_eval is specific to the example DLL listed above."
    techniques "[]"
  ]
  execution_flow [
    step "6"
    phase "Exploit"
    description "Once the adversary has loaded the desired function(s), they will use these to execute arbitrary commands on the compromised system. This is done through a simple select command to the loaded UDF. For example: &#34;select sys_eval('dir');&#34;. Because the prerequisite to this attack is that the database session user is a super user, this means that the adversary will be able to execute commands with elevated privileges."
    techniques "[]"
  ]
  node [
    id 0
    label "identify_a_database_management_system_running_on_a_machine_they_would_like_to_gain_control_over"
  ]
  node [
    id 1
    label "go_if_an_injection_is_possible"
  ]
  node [
    id 2
    label "batch_query_support"
  ]
  node [
    id 3
    label "meet_the_requirements"
  ]
  node [
    id 4
    label "find_an_example_of_a_dll"
  ]
  node [
    id 5
    label "load_the_dll"
  ]
  node [
    id 6
    label "achieve_this"
  ]
  node [
    id 7
    label "move_the_dll"
  ]
  node [
    id 8
    label "load_the_hex_string"
  ]
  node [
    id 9
    label "run_once_the_dll_is_in_the_plugin_directory"
  ]
  node [
    id 10
    label "create_function"
  ]
  node [
    id 11
    label "load_the_desired_function_s"
  ]
  node [
    id 12
    label "do_this"
  ]
  node [
    id 13
    label "mean_because_the_prerequisite_to_this_attack_is_that_the_database_session_user_is_a_super_user"
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
]
