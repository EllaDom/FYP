graph [
  directed 1
  capec_id "384"
  name "Application API Message Manipulation via Man-in-the-Middle"
  abstraction "Standard"
  status "Draft"
  description "An attacker manipulates either egress or ingress data from a client within an application framework in order to change the content of messages. Performing this attack can allow the attacker to gain unauthorized privileges within the application, or conduct attacks such as phishing, deceptive strategies to spread malware, or traditional web-application attacks. The techniques require use of specialized software that allow the attacker to perform adversary-in-the-middle (CAPEC-94) communications between the web browser and the remote system. Despite the use of AiTH software, the attack is actually directed at the server, as the client is one node in a series of content brokers that pass information along to the application framework. Additionally, it is not true &#34;Adversary-in-the-Middle&#34; attack at the network layer, but an application-layer attack the root cause of which is the master applications trust in the integrity of code supplied by the client."
  likelihood ""
  severity "Low"
  related_attack_patterns "_networkx_list_start"
  related_attack_patterns [
    capec_id "94"
    nature "ChildOf"
  ]
  prerequisites "_networkx_list_start"
  prerequisites "Targeted software is utilizing application framework APIs"
  skills_required "[]"
  resources_required "_networkx_list_start"
  resources_required "A software program that allows a user to man-in-the-middle communications between the client and server, such as a man-in-the-middle proxy."
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
