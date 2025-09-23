graph [
  directed 1
  capec_id "150"
  name "Collect Data from Common Resource Locations"
  abstraction "Standard"
  status "Draft"
  description "An adversary exploits well-known locations for resources for the purposes of undermining the security of the target. In many, if not most systems, files and resources are organized in a default tree structure. This can be useful for adversaries because they often know where to look for resources or files that are necessary for attacks. Even when the precise location of a targeted resource may not be known, naming conventions may indicate a small area of the target machine's file tree where the resources are typically located. For example, configuration files are normally stored in the /etc director on Unix systems. Adversaries can take advantage of this to commit other types of attacks."
  likelihood ""
  severity "Medium"
  related_attack_patterns "_networkx_list_start"
  related_attack_patterns [
    capec_id "116"
    nature "ChildOf"
  ]
  prerequisites "_networkx_list_start"
  prerequisites "The targeted applications must either expect files to be located at a specific location or, if the location of the files can be configured by the user, the user either failed to move the files from the default location or placed them in a conventional location for files of the given type."
  skills_required "[]"
  resources_required "_networkx_list_start"
  resources_required "None: No specialized resources are required to execute this type of attack. In some cases, the attacker need not even have direct access to the locations on the target computer where the targeted resources reside."
  consequences "[]"
  mitigations "[]"
  example_instances "_networkx_list_start"
  example_instances "An adversary can use a technique called Bluesnarfing to retrieve data from Bluetooth enabled devices in which they know where the data is located. This is done by connecting to the device&#8217;s Object Exchange (OBEX) Push Profile and making OBEX GET requests for known filenames (contact lists, photos, recent calls). Bluesnarfing was patched shortly after its discovery in 2003 and will only work on devices created before or during this time."
  related_weaknesses "552"
  related_weaknesses "1239"
  related_weaknesses "1258"
  related_weaknesses "1266"
  related_weaknesses "1272"
  related_weaknesses "1323"
  related_weaknesses "1330"
  matched_cwes "_networkx_list_start"
  matched_cwes "552"
  taxonomy_mappings [
    taxonomy_name "ATTACK"
    entry_id "1003"
    entry_name "OS Credential Dumping"
  ]
  taxonomy_mappings [
    taxonomy_name "ATTACK"
    entry_id "1119"
    entry_name "Automated Collection"
  ]
  taxonomy_mappings [
    taxonomy_name "ATTACK"
    entry_id "1213"
    entry_name "Data from Information Repositories"
  ]
  taxonomy_mappings [
    taxonomy_name "ATTACK"
    entry_id "1530"
    entry_name "Data from Cloud Storage Object"
  ]
  taxonomy_mappings [
    taxonomy_name "ATTACK"
    entry_id "1555"
    entry_name "Credentials from Password Stores"
  ]
  taxonomy_mappings [
    taxonomy_name "ATTACK"
    entry_id "1602"
    entry_name "Data from Configuration Repository"
  ]
  execution_flow "[]"
  node [
    id 0
    label "push_profile"
  ]
  node [
    id 1
    label "patch_bluesnarfing"
  ]
  edge [
    source 0
    target 1
  ]
]
