graph [
  directed 1
  capec_id "386"
  name "Application API Navigation Remapping"
  abstraction "Standard"
  status "Draft"
  description "An attacker manipulates either egress or ingress data from a client within an application framework in order to change the destination and/or content of links/buttons displayed to a user within API messages. Performing this attack allows the attacker to manipulate content in such a way as to produce messages or content that looks authentic but contains links/buttons that point to an attacker controlled destination. Some applications make navigation remapping more difficult to detect because the actual HREF values of images, profile elements, and links/buttons are masked. One example would be to place an image in a user's photo gallery that when clicked upon redirected the user to an off-site location. Also, traditional web vulnerabilities (such as CSRF) can be constructed with remapped buttons or links. In some cases navigation remapping can be used for Phishing attacks or even means to artificially boost the page view, user site reputation, or click-fraud."
  likelihood ""
  severity "Medium"
  related_attack_patterns "_networkx_list_start"
  related_attack_patterns [
    capec_id "94"
    nature "ChildOf"
  ]
  prerequisites "_networkx_list_start"
  prerequisites "Targeted software is utilizing application framework APIs"
  skills_required "[]"
  resources_required "_networkx_list_start"
  resources_required "A software program that allows the use of adversary-in-the-middle (CAPEC-94) communications between the client and server, such as a man-in-the-middle proxy."
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
