graph [
  directed 1
  capec_id "681"
  name "Exploitation of Improperly Controlled Hardware Security Identifiers"
  abstraction "Detailed"
  status "Draft"
  description "&#10;            "
  likelihood "Medium"
  severity "Very High"
  related_attack_patterns [
    capec_id "1"
    nature "ChildOf"
  ]
  related_attack_patterns [
    capec_id "180"
    nature "ChildOf"
  ]
  prerequisites "Awareness of the hardware being leveraged."
  prerequisites "Access to the hardware being leveraged."
  skills_required [
    level "Medium"
    description "Ability to execute actions within the SoC."
  ]
  skills_required [
    level "High"
    description "Intricate knowledge of the identifiers being utilized."
  ]
  resources_required "[]"
  consequences [
    scope "_networkx_list_start"
    scope "Integrity"
    impact "Modify Data"
  ]
  consequences [
    scope "_networkx_list_start"
    scope "Confidentiality"
    impact "Read Data"
  ]
  consequences [
    scope "Confidentiality"
    scope "Access Control"
    scope "Authorization"
    impact "Gain Privileges"
  ]
  mitigations "Review generation of security identifiers for design inconsistencies and common weaknesses."
  mitigations "Review security identifier decoders for design inconsistencies and common weaknesses."
  mitigations "Test security identifier definition, access, and programming flow in both pre-silicon and post-silicon environments."
  example_instances "_networkx_list_start"
  example_instances "A system contains a register (divided into four 32-bit registers) that is used to store a 128-bit AES key for encryption/decryption, in addition to an access-policy register. The access-policy register determines which agents may access the AES-key registers, based on a corresponding security identifier. It is assumed the system has two agents: a Main-controller and an Aux-controller, with respective security identifiers &#34;1&#34; and &#34;2&#34;. The Main-controller (ID &#34;1&#34;) is meant to have access to the AES-key registers, while the Aux-controller (ID &#34;2&#34;) has access to the access-policy register. If a SoC incorrectly generates security identifier &#34;1&#34; for both agents, then both agents will have access to the AES-key registers. This could further result in a Denial-of-Service (DoS) or the execution of an action that in turn could result in privilege escalation or unintended access."
  related_weaknesses "1259"
  related_weaknesses "1267"
  related_weaknesses "1270"
  related_weaknesses "1294"
  related_weaknesses "1302"
  matched_cwes "_networkx_list_start"
  matched_cwes "1259"
  taxonomy_mappings "[]"
  execution_flow "[]"
  node [
    id 0
    label "contain_a_register_divided_into_four_32_bit_registers_that_is_used_to_store_a_128_bit_aes_key_for_encryption_decryption"
  ]
  node [
    id 1
    label "try_it"
  ]
  node [
    id 2
    label "mean_the_main_controller_id_1"
  ]
  node [
    id 3
    label "generate_1_for_both_agents"
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
]
