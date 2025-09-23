graph [
  directed 1
  capec_id "204"
  name "Lifting Sensitive Data Embedded in Cache"
  abstraction "Detailed"
  status "Draft"
  description "An adversary examines a target application's cache, or a browser cache, for sensitive information. Many applications that communicate with remote entities or which perform intensive calculations utilize caches to improve efficiency. However, if the application computes or receives sensitive information and the cache is not appropriately protected, an attacker can browse the cache and retrieve this information. This can result in the disclosure of sensitive information."
  likelihood ""
  severity "Medium"
  related_attack_patterns [
    capec_id "167"
    nature "ChildOf"
  ]
  related_attack_patterns [
    capec_id "560"
    nature "CanPrecede"
  ]
  prerequisites "The target application must store sensitive information in a cache."
  prerequisites "The cache must be inadequately protected against attacker access."
  skills_required "[]"
  resources_required "_networkx_list_start"
  resources_required "The attacker must be able to reach the target application's cache. This may require prior access to the machine on which the target application runs. If the cache is encrypted, the attacker would need sufficient computational resources to crack the encryption. With strong encryption schemes, doing this could be intractable, but weaker encryption schemes could allow an attacker with sufficient resources to read the file."
  consequences "[]"
  mitigations "[]"
  example_instances "[]"
  related_weaknesses "524"
  related_weaknesses "311"
  related_weaknesses "1239"
  related_weaknesses "1258"
  matched_cwes "_networkx_list_start"
  matched_cwes "311"
  taxonomy_mappings "_networkx_list_start"
  taxonomy_mappings [
    taxonomy_name "ATTACK"
    entry_id "1005"
    entry_name "Data from Local System"
  ]
  execution_flow [
    step "1"
    phase "Explore"
    description "[Identify Application Cache] An adversary first identifies an application that utilizes a cache. This could either be a web application storing data in a browser cache, or an application running on a separate machine. The adversary examines the cache to determine file permissions and possible encryption."
    techniques "Use probing tools to look for application cache files on a machine."
    techniques "Use a web application and determine if any sensitive information is stored in browser cache."
  ]
  execution_flow [
    step "2"
    phase "Experiment"
    description "[Attempt to Access Cache] Once the cache has been discovered, the adversary attempts to access the cached data. This often requires previous access to a machine hosting the target application."
    techniques "Use priviledge escalation to access cache files that might have strict privileges."
    techniques "If the application cache is encrypted with weak encryption, attempt to understand the encryption technique and break the encryption."
  ]
  execution_flow [
    step "3"
    phase "Exploit"
    description "[Lift Sensitive Data from Cache] After gaining access to cached data, an adversary looks for potentially sensitive information and stores it for malicious use. This sensitive data could possibly be used in follow-up attacks related to authentication or authorization."
    techniques "_networkx_list_start"
    techniques "Using a public computer, or gaining access to a victim's computer, examine browser cache to look for sensitive data left over from previous sessions."
  ]
  node [
    id 0
    label "identify_an_application_that_utilizes_a_cache"
  ]
  node [
    id 1
    label "store_data"
  ]
  node [
    id 2
    label "require_previous_access_to_a_machine_hosting_the_target_application"
  ]
  node [
    id 3
    label "use_priviledge_escalation"
  ]
  node [
    id 4
    label "encrypt_the_application_cache"
  ]
  node [
    id 5
    label "gain_access_to_cached_data"
  ]
  node [
    id 6
    label "gain_access_to_a_victim_s_computer"
  ]
  node [
    id 7
    label "gain_access_to_sensitive_information"
  ]
  node [
    id 8
    label "protect_the_cache"
  ]
  edge [
    source 0
    target 1
  ]
  edge [
    source 0
    target 2
  ]
  edge [
    source 1
    target 0
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
]
