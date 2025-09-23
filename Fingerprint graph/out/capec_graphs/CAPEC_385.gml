graph [
  directed 1
  capec_id "385"
  name "Transaction or Event Tampering via Application API Manipulation"
  abstraction "Detailed"
  status "Draft"
  description "An attacker hosts or joins an event or transaction within an application framework in order to change the content of messages or items that are being exchanged. Performing this attack allows the attacker to manipulate content in such a way as to produce messages or content that look authentic but may contain deceptive links, substitute one item or another, spoof an existing item and conduct a false exchange, or otherwise change the amounts or identity of what is being exchanged. The techniques require use of specialized software that allow the attacker to man-in-the-middle communications between the web browser and the remote system in order to change the content of various application elements. Often, items exchanged in game can be monetized via sales for coin, virtual dollars, etc. The purpose of the attack is for the attack to scam the victim by trapping the data packets involved the exchange and altering the integrity of the transfer process."
  likelihood ""
  severity "Medium"
  related_attack_patterns "_networkx_list_start"
  related_attack_patterns [
    capec_id "384"
    nature "ChildOf"
  ]
  prerequisites "_networkx_list_start"
  prerequisites "Targeted software is utilizing application framework APIs"
  skills_required "[]"
  resources_required "_networkx_list_start"
  resources_required "A software program that allows the use of adversary-in-the-middle communications (CAPEC-94) between the client and server, such as a man-in-the-middle proxy."
  consequences "[]"
  mitigations "[]"
  example_instances "[]"
  related_weaknesses "471"
  related_weaknesses "345"
  related_weaknesses "346"
  related_weaknesses "602"
  related_weaknesses "311"
  matched_cwes "345"
  matched_cwes "311"
  matched_cwes "602"
  taxonomy_mappings "[]"
  execution_flow "[]"
  node [
    id 0
    label "utilize_application_framework_apis"
  ]
]
