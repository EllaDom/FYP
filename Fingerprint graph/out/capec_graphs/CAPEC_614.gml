graph [
  directed 1
  capec_id "614"
  name "Rooting SIM Cards"
  abstraction "Detailed"
  status "Draft"
  description "SIM cards are the de facto trust anchor of mobile devices worldwide. The cards protect the mobile identity of subscribers, associate devices with phone numbers, and increasingly store payment credentials, for example in NFC-enabled phones with mobile wallets. This attack leverages over-the-air (OTA) updates deployed via cryptographically-secured SMS messages to deliver executable code to the SIM. By cracking the DES key, an attacker can send properly signed binary SMS messages to a device, which are treated as Java applets and are executed on the SIM. These applets are allowed to send SMS, change voicemail numbers, and query the phone location, among many other predefined functions. These capabilities alone provide plenty of potential for abuse."
  likelihood ""
  severity "High"
  related_attack_patterns "_networkx_list_start"
  related_attack_patterns [
    capec_id "186"
    nature "ChildOf"
  ]
  prerequisites "_networkx_list_start"
  prerequisites "A SIM card that relies on the DES cipher."
  skills_required "_networkx_list_start"
  skills_required [
    level "Medium"
    description "This is a sophisticated attack, but detailed techniques are published in open literature."
  ]
  resources_required "[]"
  consequences "_networkx_list_start"
  consequences [
    scope "Confidentiality"
    scope "Integrity"
    impact "Execute Unauthorized Commands"
  ]
  mitigations "_networkx_list_start"
  mitigations "Upgrade the SIM card to use the state-of-the-art AES or the somewhat outdated 3DES algorithm for OTA."
  example_instances "[]"
  related_weaknesses "_networkx_list_start"
  related_weaknesses "327"
  matched_cwes "_networkx_list_start"
  matched_cwes "327"
  taxonomy_mappings "[]"
  execution_flow "[]"
]
