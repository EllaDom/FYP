graph [
  directed 1
  capec_id "37"
  name "Retrieve Embedded Sensitive Data"
  abstraction "Detailed"
  status "Draft"
  description "An attacker examines a target system to find sensitive data that has been embedded within it. This information can reveal confidential contents, such as account numbers or individual keys/credentials that can be used as an intermediate step in a larger attack."
  likelihood "High"
  severity "Very High"
  related_attack_patterns "_networkx_list_start"
  related_attack_patterns [
    capec_id "167"
    nature "ChildOf"
  ]
  prerequisites "In order to feasibly execute this type of attack, some valuable data must be present in client software."
  prerequisites "Additionally, this information must be unprotected, or protected in a flawed fashion, or through a mechanism that fails to resist reverse engineering, statistical, or other attack."
  skills_required "_networkx_list_start"
  skills_required [
    level "Medium"
    description "The attacker must possess knowledge of client code structure as well as ability to reverse-engineer or decompile it or probe it in other ways. This knowledge is specific to the technology and language used for the client distribution"
  ]
  resources_required "_networkx_list_start"
  resources_required "The attacker must possess access to the system or code being exploited. Such access, for this set of attacks, will likely be physical. The attacker will make use of reverse engineering technologies, perhaps for data or to extract functionality from the binary. Such tool use may be as simple as &#34;Strings&#34; or a hex editor. Removing functionality may require the use of only a hex editor, or may require aspects of the toolchain used to construct the application: for instance the Adobe Flash development environment. Attacks of this nature do not require network access or undue CPU, memory, or other hardware-based resources."
  consequences [
    scope "_networkx_list_start"
    scope "Confidentiality"
    impact "Read Data"
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
  mitigations "[]"
  example_instances "Using a tool such as 'strings' or similar to pull out text data, perhaps part of a database table, that extends beyond what a particular user's purview should be."
  example_instances "An attacker can also use a decompiler to decompile a downloaded Java applet in order to look for information such as hardcoded IP addresses, file paths, passwords or other such contents."
  example_instances "Attacker uses a tool such as a browser plug-in to pull cookie or other token information that, from a previous user at the same machine (perhaps a kiosk), allows the attacker to log in as the previous user."
  related_weaknesses "226"
  related_weaknesses "311"
  related_weaknesses "525"
  related_weaknesses "312"
  related_weaknesses "314"
  related_weaknesses "315"
  related_weaknesses "318"
  related_weaknesses "1239"
  related_weaknesses "1258"
  related_weaknesses "1266"
  related_weaknesses "1272"
  related_weaknesses "1278"
  related_weaknesses "1301"
  related_weaknesses "1330"
  matched_cwes "311"
  matched_cwes "312"
  taxonomy_mappings [
    taxonomy_name "ATTACK"
    entry_id "1005"
    entry_name "Data from Local System"
  ]
  taxonomy_mappings [
    taxonomy_name "ATTACK"
    entry_id "1552.004"
    entry_name "Unsecured Credentials: Private Keys"
  ]
  execution_flow [
    step "1"
    phase "Explore"
    description "[Identify Target] Attacker identifies client components to extract information from. These may be binary executables, class files, shared libraries (e.g., DLLs), configuration files, or other system files."
    techniques "Binary file extraction. The attacker extracts binary files from zips, jars, wars, PDFs or other composite formats."
    techniques "Package listing. The attacker uses a package manifest provided with the software installer, or the filesystem itself, to identify component files suitable for attack."
  ]
  execution_flow [
    step "2"
    phase "Exploit"
    description "[Retrieve Embedded Data] The attacker then uses a variety of techniques, such as sniffing, reverse-engineering, and cryptanalysis to retrieve the information of interest."
    techniques "API Profiling. The attacker monitors the software's use of registry keys or other operating system-provided storage locations that can contain sensitive information."
    techniques "Execution in simulator. The attacker physically removes mass storage from the system and explores it using a simulator, external system, or other debugging harness."
    techniques "Common decoding methods. The attacker applies methods to decode such encodings and compressions as Base64, unzip, unrar, RLE decoding, gzip decompression and so on."
    techniques "Common data typing. The attacker looks for common file signatures for well-known file types (JPEG, TIFF, ASN.1, LDIF, etc.). If the signatures match, they attempt decoding in that format."
  ]
  node [
    id 0
    label "identify_known_client_identifiers"
  ]
  node [
    id 1
    label "extract_binary_files"
  ]
  node [
    id 2
    label "retrieve_the_information_of_interest"
  ]
  node [
    id 3
    label "monitor_the_software_s_use_of_registry_keys_or_other_operating_system_provided_storage_locations_that_can_contain_sensitive_information"
  ]
  node [
    id 4
    label "remove_mass_storage"
  ]
  node [
    id 5
    label "apply_methods"
  ]
  node [
    id 6
    label "type_common_data"
  ]
  node [
    id 7
    label "pull_text_data_perhaps_part_of_a_database_table"
  ]
  node [
    id 8
    label "decompile_a_downloaded_java_applet"
  ]
  node [
    id 9
    label "pull_cookie_or_other_token_information"
  ]
  node [
    id 10
    label "execute_this_type_of_attack"
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
]
