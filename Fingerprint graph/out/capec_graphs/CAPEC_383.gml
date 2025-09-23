graph [
  directed 1
  capec_id "383"
  name "Harvesting Information via API Event Monitoring"
  abstraction "Detailed"
  status "Draft"
  description "An adversary hosts an event within an application framework and then monitors the data exchanged during the course of the event for the purpose of harvesting any important data leaked during the transactions. One example could be harvesting lists of usernames or userIDs for the purpose of sending spam messages to those users. One example of this type of attack involves the adversary creating an event within the sub-application. Assume the adversary hosts a &#34;virtual sale&#34; of rare items. As other users enter the event, the attacker records via AiTM (CAPEC-94) proxy the user_ids and usernames of everyone who attends. The adversary would then be able to spam those users within the application using an automated script."
  likelihood ""
  severity "Low"
  related_attack_patterns [
    capec_id "407"
    nature "ChildOf"
  ]
  related_attack_patterns [
    capec_id "94"
    nature "CanPrecede"
  ]
  prerequisites "_networkx_list_start"
  prerequisites "The target software is utilizing application framework APIs"
  skills_required "[]"
  resources_required "[]"
  consequences "_networkx_list_start"
  consequences [
    scope "_networkx_list_start"
    scope "Confidentiality"
    impact "Read Data"
  ]
  mitigations "_networkx_list_start"
  mitigations "Leverage encryption techniques during information transactions so as to protect them from attack patterns of this kind."
  example_instances "[]"
  related_weaknesses "311"
  related_weaknesses "319"
  related_weaknesses "419"
  related_weaknesses "602"
  matched_cwes "311"
  matched_cwes "419"
  matched_cwes "319"
  matched_cwes "602"
  taxonomy_mappings "_networkx_list_start"
  taxonomy_mappings [
    taxonomy_name "ATTACK"
    entry_id "1056.004"
    entry_name "Input Capture: Credential API Hooking"
  ]
  execution_flow "[]"
  node [
    id 0
    label "utilize_application_framework_apis"
  ]
]
