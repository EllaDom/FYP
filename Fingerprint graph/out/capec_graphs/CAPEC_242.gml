graph [
  directed 1
  capec_id "242"
  name "Code Injection"
  abstraction "Meta"
  status "Stable"
  description "An adversary exploits a weakness in input validation on the target to inject new code into that which is currently executing. This differs from code inclusion in that code inclusion involves the addition or replacement of a reference to a code file, which is subsequently loaded by the target and used as part of the code of some application."
  likelihood "High"
  severity "High"
  related_attack_patterns "[]"
  prerequisites "_networkx_list_start"
  prerequisites "The target software does not validate user-controlled input such that the execution of a process may be altered by sending code in through legitimate data channels, using no other mechanism."
  skills_required "[]"
  resources_required "[]"
  consequences "_networkx_list_start"
  consequences [
    scope "Confidentiality"
    scope "Integrity"
    scope "Availability"
    impact "Other"
  ]
  mitigations "Utilize strict type, character, and encoding enforcement"
  mitigations "Ensure all input content that is delivered to client is sanitized against an acceptable content specification."
  mitigations "Perform input validation for all content."
  mitigations "Enforce regular patching of software."
  example_instances "[]"
  related_weaknesses "_networkx_list_start"
  related_weaknesses "94"
  matched_cwes "_networkx_list_start"
  matched_cwes "94"
  taxonomy_mappings "_networkx_list_start"
  taxonomy_mappings [
    taxonomy_name "OWASP Attacks"
    entry_id ""
    entry_name "Code Injection"
  ]
  execution_flow "[]"
  node [
    id 0
    label "validate_user_input"
  ]
]
