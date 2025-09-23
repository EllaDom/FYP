graph [
  directed 1
  capec_id "549"
  name "Local Execution of Code"
  abstraction "Meta"
  status "Stable"
  description "An adversary installs and executes malicious code on the target system in an effort to achieve a negative technical impact. Examples include rootkits, ransomware, spyware, adware, and others."
  likelihood "Medium"
  severity "High"
  related_attack_patterns "[]"
  prerequisites "_networkx_list_start"
  prerequisites "Knowledge of the target system's vulnerabilities that can be capitalized on with malicious code.The adversary must be able to place the malicious code on the target system."
  skills_required "[]"
  resources_required "_networkx_list_start"
  resources_required "The means by which the adversary intends to place the malicious code on the system dictates the tools required. For example, suppose the adversary wishes to leverage social engineering and convince a legitimate user to open a malicious file attached to a seemingly legitimate email. In this case, the adversary might require a tool capable of wrapping malicious code into an innocuous filetype (e.g., PDF, .doc, etc.)"
  consequences [
    scope "Confidentiality"
    scope "Integrity"
    scope "Availability"
    impact "Execute Unauthorized Commands"
  ]
  consequences [
    scope "Confidentiality"
    scope "Integrity"
    scope "Availability"
    impact "Other"
  ]
  mitigations "Employ robust cybersecurity training for all employees."
  mitigations "Implement system antivirus software that scans all attachments before opening them."
  mitigations "Regularly patch all software."
  mitigations "Execute all suspicious files in a sandbox environment."
  example_instances "_networkx_list_start"
  example_instances "BlueBorne refers to a set of nine vulnerabilities on different platforms (Linux, Windows, Android, iOS) that offer an adversary the ability to install and execute malicious code on a system if they were close in proximity to a Bluetooth enabled device. One vulnerability affecting iOS versions 7 through 9 allowed an attacker to overflow the Low Energy Audio Protocol since commands sent over this protocol are improperly validated and gain the elevated permissions of the Bluetooth stack. These vulnerabilities were a result of poor validation and were patched shortly after their exposure in 2017, but many non-updated devices remain vulnerable."
  related_weaknesses "_networkx_list_start"
  related_weaknesses "829"
  matched_cwes "_networkx_list_start"
  matched_cwes "829"
  taxonomy_mappings "[]"
  execution_flow "[]"
  node [
    id 0
    label "affect_ios_versions"
  ]
  node [
    id 1
    label "capitalize_that"
  ]
  node [
    id 2
    label "place_the_malicious_file"
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
