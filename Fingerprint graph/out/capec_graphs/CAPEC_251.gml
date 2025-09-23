graph [
  directed 1
  capec_id "251"
  name "Local Code Inclusion"
  abstraction "Standard"
  status "Stable"
  description "The attacker forces an application to load arbitrary code files from the local machine. The attacker could use this to try to load old versions of library files that have known vulnerabilities, to load files that the attacker placed on the local machine during a prior attack, or to otherwise change the functionality of the targeted application in unexpected ways."
  likelihood ""
  severity "Medium"
  related_attack_patterns "_networkx_list_start"
  related_attack_patterns [
    capec_id "175"
    nature "ChildOf"
  ]
  prerequisites "The targeted application must have a bug that allows an adversary to control which code file is loaded at some juncture."
  prerequisites "Some variants of this attack may require that old versions of some code files be present and in predictable locations."
  skills_required "[]"
  resources_required "_networkx_list_start"
  resources_required "The adversary needs to have enough access to the target application to control the identity of a locally included file. The attacker may also need to be able to upload arbitrary code files to the target machine, although any location for these files may be acceptable."
  consequences [
    scope "_networkx_list_start"
    scope "Integrity"
    impact "Execute Unauthorized Commands"
  ]
  consequences [
    scope "_networkx_list_start"
    scope "Confidentiality"
    impact "Read Data"
  ]
  mitigations "_networkx_list_start"
  mitigations "Implementation: Avoid passing user input to filesystem or framework API. If necessary to do so, implement a specific, allowlist approach."
  example_instances "[]"
  related_weaknesses "_networkx_list_start"
  related_weaknesses "829"
  matched_cwes "_networkx_list_start"
  matched_cwes "829"
  taxonomy_mappings "_networkx_list_start"
  taxonomy_mappings [
    taxonomy_name "ATTACK"
    entry_id "1055"
    entry_name "Process Injection"
  ]
  execution_flow "[]"
]
