graph [
  directed 1
  capec_id "35"
  name "Leverage Executable Code in Non-Executable Files"
  abstraction "Detailed"
  status "Draft"
  description "An attack of this type exploits a system's trust in configuration and resource files. When the executable loads the resource (such as an image file or configuration file) the attacker has modified the file to either execute malicious code directly or manipulate the target process (e.g. application server) to execute based on the malicious configuration parameters. Since systems are increasingly interrelated mashing up resources from local and remote sources the possibility of this attack occurring is high."
  likelihood "High"
  severity "Very High"
  related_attack_patterns [
    capec_id "636"
    nature "ChildOf"
  ]
  related_attack_patterns [
    capec_id "23"
    nature "PeerOf"
  ]
  related_attack_patterns [
    capec_id "75"
    nature "PeerOf"
  ]
  prerequisites "_networkx_list_start"
  prerequisites "The attacker must have the ability to modify non-executable files consumed by the target software."
  skills_required "_networkx_list_start"
  skills_required [
    level "Low"
    description "To identify and execute against an over-privileged system interface"
  ]
  resources_required "_networkx_list_start"
  resources_required "Ability to communicate synchronously or asynchronously with server that publishes an over-privileged directory, program, or interface. Optionally, ability to capture output directly through synchronous communication or other method such as FTP."
  consequences [
    scope "Confidentiality"
    scope "Integrity"
    scope "Availability"
    impact "Execute Unauthorized Commands"
  ]
  consequences [
    scope "_networkx_list_start"
    scope "Integrity"
    impact "Modify Data"
  ]
  consequences [
    scope "Confidentiality"
    scope "Access Control"
    scope "Authorization"
    impact "Gain Privileges"
  ]
  mitigations "Design: Enforce principle of least privilege"
  mitigations "Design: Run server interfaces with a non-root account and/or utilize chroot jails or other configuration techniques to constrain privileges even if attacker gains some limited access to commands."
  mitigations "Implementation: Perform testing such as pen-testing and vulnerability scanning to identify directories, programs, and interfaces that grant direct access to executables."
  mitigations "Implementation: Implement host integrity monitoring to detect any unwanted altering of configuration files."
  mitigations "Implementation: Ensure that files that are not required to execute, such as configuration files, are not over-privileged, i.e. not allowed to execute."
  example_instances "Virtually any system that relies on configuration files for runtime behavior is open to this attack vector. The configuration files are frequently stored in predictable locations, so an attacker that can fingerprint a server process such as a web server or database server can quickly identify the likely locale where the configuration is stored. And this is of course not limited to server processes. Unix shells rely on profile files to store environment variables, search paths for programs and so on. If the aliases are changed, then a standard Unix &#34;cp&#34; command can be rerouted to &#34;rm&#34; or other standard command so the user's intention is subverted."
  example_instances "The attack can be directed at a client system, such as causing buffer overrun through loading seemingly benign image files, as in Microsoft Security Bulletin MS04-028 where specially crafted JPEG files could cause a buffer overrun once loaded into the browser."
  example_instances "Another example targets clients reading pdf files. In this case the attacker simply appends javascript to the end of a legitimate url for a pdf (http://www.gnucitizen.org/blog/danger-danger-danger/) http://path/to/pdf/file.pdf#whatever_name_you_want=javascript:your_code_here The client assumes that they are reading a pdf, but the attacker has modified the resource and loaded executable javascript into the client's browser process."
  example_instances "The attack can also target server processes. The attacker edits the resource or configuration file, for example a web.xml file used to configure security permissions for a J2EE app server, adding role name &#34;public&#34; grants all users with the public role the ability to use the administration functionality. < security-constraint> <description>Security processing rules for admin screens</description>  <url-pattern>/admin/*</url-pattern>  <http-method>POST</http-method>  <http-method>GET</http-method> <auth-constraint> <role-name>administrator</role-name>  <role-name>public</role-name>  </auth-constraint>  </security-constraint> The server trusts its configuration file to be correct, but when they are manipulated, the attacker gains full control."
  related_weaknesses "94"
  related_weaknesses "96"
  related_weaknesses "95"
  related_weaknesses "97"
  related_weaknesses "272"
  related_weaknesses "59"
  related_weaknesses "282"
  related_weaknesses "270"
  matched_cwes "94"
  matched_cwes "282"
  matched_cwes "95"
  matched_cwes "59"
  taxonomy_mappings [
    taxonomy_name "ATTACK"
    entry_id "1027.006"
    entry_name "Obfuscated Files or Information: HTML Smuggling"
  ]
  taxonomy_mappings [
    taxonomy_name "ATTACK"
    entry_id "1027.009"
    entry_name "Obfuscated Files or Information:&#160;Embedded Payloads"
  ]
  taxonomy_mappings [
    taxonomy_name "ATTACK"
    entry_id "1564.009"
    entry_name "Hide Artifacts: Resource Forking"
  ]
  execution_flow "[]"
  node [
    id 0
    label "store_the_configuration_files"
  ]
  node [
    id 1
    label "limit_to_server_processes"
  ]
  node [
    id 2
    label "rely_to_store_environment_variables_search_paths_for_programs_and_so_on"
  ]
  node [
    id 3
    label "change_the_aliases"
  ]
  node [
    id 4
    label "direct_the_attack"
  ]
  node [
    id 5
    label "append_javascript"
  ]
  node [
    id 6
    label "target_server_processes"
  ]
  node [
    id 7
    label "edit_the_resource_or_configuration_file"
  ]
  node [
    id 8
    label "trust_its_configuration_file"
  ]
  node [
    id 9
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
]
