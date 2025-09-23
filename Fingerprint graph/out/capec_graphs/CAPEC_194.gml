graph [
  directed 1
  capec_id "194"
  name "Fake the Source of Data"
  abstraction "Standard"
  status "Stable"
  description "An adversary takes advantage of improper authentication to provide data or services under a falsified identity. The purpose of using the falsified identity may be to prevent traceability of the provided data or to assume the rights granted to another individual. One of the simplest forms of this attack would be the creation of an email message with a modified &#34;From&#34; field in order to appear that the message was sent from someone other than the actual sender. The root of the attack (in this case the email system) fails to properly authenticate the source and this results in the reader incorrectly performing the instructed action. Results of the attack vary depending on the details of the attack, but common results include privilege escalation, obfuscation of other attacks, and data corruption/manipulation."
  likelihood ""
  severity "Medium"
  related_attack_patterns [
    capec_id "151"
    nature "ChildOf"
  ]
  related_attack_patterns [
    capec_id "657"
    nature "CanPrecede"
  ]
  related_attack_patterns [
    capec_id "667"
    nature "CanPrecede"
  ]
  prerequisites "_networkx_list_start"
  prerequisites "This attack is only applicable when a vulnerable entity associates data or services with an identity. Without such an association, there would be no reason to fake the source."
  skills_required "[]"
  resources_required "_networkx_list_start"
  resources_required "Resources required vary depending on the nature of the attack. Possible tools needed by an attacker could include tools to create custom network packets, specific client software, and tools to capture network traffic. Many variants of this attack require no attacker resources, however."
  consequences [
    scope "_networkx_list_start"
    scope "Integrity"
    impact "Alter Execution Logic"
  ]
  consequences [
    scope "_networkx_list_start"
    scope "Integrity"
    impact "Gain Privileges"
  ]
  consequences [
    scope "_networkx_list_start"
    scope "Integrity"
    impact "Hide Activities"
  ]
  mitigations "[]"
  example_instances "[]"
  related_weaknesses "_networkx_list_start"
  related_weaknesses "287"
  matched_cwes "_networkx_list_start"
  matched_cwes "287"
  taxonomy_mappings "_networkx_list_start"
  taxonomy_mappings [
    taxonomy_name "WASC"
    entry_id "38"
    entry_name "URL Redirector Abuse"
  ]
  execution_flow "[]"
  node [
    id 0
    label "fake_the_source"
  ]
]
