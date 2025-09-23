graph [
  directed 1
  capec_id "75"
  name "Manipulating Writeable Configuration Files"
  abstraction "Standard"
  status "Draft"
  description "Generally these are manually edited files that are not in the preview of the system administrators, any ability on the attackers' behalf to modify these files, for example in a CVS repository, gives unauthorized access directly to the application, the same as authorized users."
  likelihood "High"
  severity "Very High"
  related_attack_patterns "_networkx_list_start"
  related_attack_patterns [
    capec_id "176"
    nature "ChildOf"
  ]
  prerequisites "_networkx_list_start"
  prerequisites "Configuration files must be modifiable by the attacker"
  skills_required "_networkx_list_start"
  skills_required [
    level "Medium"
    description "To identify vulnerable configuration files, and understand how to manipulate servers and erase forensic evidence"
  ]
  resources_required "[]"
  consequences "_networkx_list_start"
  consequences [
    scope "Confidentiality"
    scope "Access Control"
    scope "Authorization"
    impact "Gain Privileges"
  ]
  mitigations "Design: Enforce principle of least privilege"
  mitigations "Design: Backup copies of all configuration files"
  mitigations "Implementation: Integrity monitoring for configuration files"
  mitigations "Implementation: Enforce audit logging on code and configuration promotion procedures."
  mitigations "Implementation: Load configuration from separate process and memory space, for example a separate physical device like a CD"
  example_instances "_networkx_list_start"
  example_instances "The BEA Weblogic server uses a config.xml file to store configuration data. If this file is not properly protected by the system access control, an attacker can write configuration information to redirect server output through system logs, database connections, malicious URLs and so on. Access to the Weblogic server may be from a so-called Custom realm which manages authentication and authorization privileges on behalf of user principals. Given write access, the attacker can insert a pointer to a custom realm jar file in the config.xml < CustomRealm ConfigurationData=&#34;java.util.Properties&#34;  Name=&#34;CustomRealm&#34;  RealmClassName=&#34;Maliciousrealm.jar&#34;  /> The main issue with configuration files is that the attacker can leverage all the same functionality the server has, but for malicious means. Given the complexity of server configuration, these changes may be very hard for administrators to detect."
  related_weaknesses "349"
  related_weaknesses "99"
  related_weaknesses "77"
  related_weaknesses "346"
  related_weaknesses "353"
  related_weaknesses "354"
  matched_cwes "_networkx_list_start"
  matched_cwes "77"
  taxonomy_mappings "[]"
  execution_flow "[]"
  node [
    id 0
    label "store_data"
  ]
  node [
    id 1
    label "protect_this_file"
  ]
  node [
    id 2
    label "give_write_access"
  ]
  node [
    id 3
    label "leverage_all_the_same_functionality_the_server_has"
  ]
  node [
    id 4
    label "give_the_complexity_of_server_configuration"
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
