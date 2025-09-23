graph [
  directed 1
  capec_id "639"
  name "Probe System Files"
  abstraction "Detailed"
  status "Stable"
  description "An adversary obtains unauthorized information due to improperly protected files. If an application stores sensitive information in a file that is not protected by proper access control, then an adversary can access the file and search for sensitive information."
  likelihood ""
  severity "Medium"
  related_attack_patterns "_networkx_list_start"
  related_attack_patterns [
    capec_id "545"
    nature "ChildOf"
  ]
  prerequisites "_networkx_list_start"
  prerequisites "An adversary has access to the file system of a system."
  skills_required "[]"
  resources_required "[]"
  consequences "_networkx_list_start"
  consequences [
    scope "_networkx_list_start"
    scope "Confidentiality"
    impact "Read Data"
  ]
  mitigations "_networkx_list_start"
  mitigations "Verify that files have proper access controls set, and reduce the storage of sensitive information to only what is necessary."
  example_instances "Adversaries may search local file systems and remote file shares for files containing passwords. These can be files created by users to store their own credentials, shared credential stores for a group of individuals, configuration files containing passwords for a system or service, or source code/binary files containing embedded passwords."
  example_instances "Adversaries may search network shares on computers they have compromised to find files of interest."
  related_weaknesses "_networkx_list_start"
  related_weaknesses "552"
  matched_cwes "_networkx_list_start"
  matched_cwes "552"
  taxonomy_mappings [
    taxonomy_name "ATTACK"
    entry_id "1039"
    entry_name "Data from Network Shared Drive"
  ]
  taxonomy_mappings [
    taxonomy_name "ATTACK"
    entry_id "1552.001"
    entry_name "Unsecured Credentials: Credentials in Files"
  ]
  taxonomy_mappings [
    taxonomy_name "ATTACK"
    entry_id "1552.003"
    entry_name "Unsecured Credentials: Bash History"
  ]
  taxonomy_mappings [
    taxonomy_name "ATTACK"
    entry_id "1552.004"
    entry_name "Unsecured Credentials: Private Keys"
  ]
  taxonomy_mappings [
    taxonomy_name "ATTACK"
    entry_id "1552.006"
    entry_name "Unsecured Credentials: Group Policy Preferences"
  ]
  execution_flow "[]"
  node [
    id 0
    label "search_local_file_systems_and_remote_file_shares"
  ]
  node [
    id 1
    label "search_network_shares"
  ]
  node [
    id 2
    label "have_access_to_the_file_system_of_a_system"
  ]
  edge [
    source 0
    target 1
  ]
  edge [
    source 1
    target 2
  ]
]
