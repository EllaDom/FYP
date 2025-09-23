graph [
  directed 1
  capec_id "388"
  name "Application API Button Hijacking"
  abstraction "Detailed"
  status "Draft"
  description "An attacker manipulates either egress or ingress data from a client within an application framework in order to change the destination and/or content of buttons displayed to a user within API messages. Performing this attack allows the attacker to manipulate content in such a way as to produce messages or content that looks authentic but contains buttons that point to an attacker controlled destination."
  likelihood ""
  severity "Medium"
  related_attack_patterns "_networkx_list_start"
  related_attack_patterns [
    capec_id "386"
    nature "ChildOf"
  ]
  prerequisites "_networkx_list_start"
  prerequisites "Targeted software is utilizing application framework APIs"
  skills_required "[]"
  resources_required "_networkx_list_start"
  resources_required "A software program that allows the use of adversary-in-the-middle (CAPEC-94) communications between the client and server, such as a adversary-in-the-middle (CAPEC-94) proxy."
  consequences "[]"
  mitigations "[]"
  example_instances "_networkx_list_start"
  example_instances "An in-game event occurs and the attacker traps the result, which turns out to be a form that will be populated to their primary profile. The attacker, using a MITM proxy, observes the following data: [Button][Claim_Item]Sourdough_Cookie[URL_IMG]foo[/URL_IMG][Claim_Link]bar[/Claim_Link] By altering the destination of &#34;Claim_Link&#34; to point to the attackers' server an unwitting victim can be enticed to click the link. Another example would be for the attacker to rewrite the button destinations for an event so that clicking &#34;Yes&#34; or &#34;No&#34; causes the user to load the attackers' code."
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
    label "observe_the_following_data"
  ]
  node [
    id 1
    label "alter_the_destination_of_claim_link"
  ]
  node [
    id 2
    label "rewrite_the_button_destinations"
  ]
  node [
    id 3
    label "utilize_application_framework_apis"
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
