graph [
  directed 1
  capec_id "1"
  name "Accessing Functionality Not Properly Constrained by ACLs"
  abstraction "Standard"
  status "Draft"
  description "In applications, particularly web applications, access to functionality is mitigated by an authorization framework. This framework maps Access Control Lists (ACLs) to elements of the application's functionality; particularly URL's for web apps. In the case that the administrator failed to specify an ACL for a particular element, an attacker may be able to access it with impunity. An attacker with the ability to access functionality not properly constrained by ACLs can obtain sensitive information and possibly compromise the entire application. Such an attacker can access resources that must be available only to users at a higher privilege level, can access management sections of the application, or can run queries for data that they otherwise not supposed to."
  likelihood "High"
  severity "High"
  related_attack_patterns [
    capec_id "122"
    nature "ChildOf"
  ]
  related_attack_patterns [
    capec_id "17"
    nature "CanPrecede"
  ]
  prerequisites "The application must be navigable in a manner that associates elements (subsections) of the application with ACLs."
  prerequisites "The various resources, or individual URLs, must be somehow discoverable by the attacker"
  prerequisites "The administrator must have forgotten to associate an ACL or has associated an inappropriately permissive ACL with a particular navigable resource."
  skills_required "_networkx_list_start"
  skills_required [
    level "Low"
    description "In order to discover unrestricted resources, the attacker does not need special tools or skills. They only have to observe the resources or access mechanisms invoked as each action is performed and then try and access those access mechanisms directly."
  ]
  resources_required "_networkx_list_start"
  resources_required "None: No specialized resources are required to execute this type of attack."
  consequences "_networkx_list_start"
  consequences [
    scope "Confidentiality"
    scope "Access Control"
    scope "Authorization"
    impact "Gain Privileges"
  ]
  mitigations "_networkx_list_start"
  mitigations "In a J2EE setting, administrators can associate a role that is impossible for the authenticator to grant users, such as &#34;NoAccess&#34;, with all Servlets to which access is guarded by a limited number of servlets visible to, and accessible by, the user. Having done so, any direct access to those protected Servlets will be prohibited by the web container. In a more general setting, the administrator must mark every resource besides the ones supposed to be exposed to the user as accessible by a role impossible for the user to assume. The default security setting must be to deny access and then grant access only to those resources intended by business logic."
  example_instances "_networkx_list_start"
  example_instances "Implementing the Model-View-Controller (MVC) within Java EE's Servlet paradigm using a &#34;Single front controller&#34; pattern that demands that brokered HTTP requests be authenticated before hand-offs to other Action Servlets. If no security-constraint is placed on those Action Servlets, such that positively no one can access them, the front controller can be subverted."
  related_weaknesses "276"
  related_weaknesses "285"
  related_weaknesses "434"
  related_weaknesses "693"
  related_weaknesses "732"
  related_weaknesses "1191"
  related_weaknesses "1193"
  related_weaknesses "1220"
  related_weaknesses "1297"
  related_weaknesses "1311"
  related_weaknesses "1314"
  related_weaknesses "1315"
  related_weaknesses "1318"
  related_weaknesses "1320"
  related_weaknesses "1321"
  related_weaknesses "1327"
  matched_cwes "276"
  matched_cwes "732"
  matched_cwes "693"
  matched_cwes "1191"
  matched_cwes "434"
  matched_cwes "285"
  matched_cwes "1220"
  taxonomy_mappings "_networkx_list_start"
  taxonomy_mappings [
    taxonomy_name "ATTACK"
    entry_id "1574.010"
    entry_name "Hijack Execution Flow: ServicesFile Permissions Weakness"
  ]
  execution_flow [
    step "1"
    phase "Explore"
    description "[Survey] The attacker surveys the target application, possibly as a valid and authenticated user"
    techniques "Spidering web sites for all available links"
    techniques "Brute force guessing of resource names"
    techniques "Brute force guessing of user names / credentials"
    techniques "Brute force guessing of function names / actions"
  ]
  execution_flow [
    step "2"
    phase "Explore"
    description "[Identify Functionality] At each step, the attacker notes the resource or functionality access mechanism invoked upon performing specific actions"
    techniques "Use the web inventory of all forms and inputs and apply attack data to those inputs."
    techniques "Use a packet sniffer to capture and record network traffic"
    techniques "Execute the software in a debugger and record API calls into the operating system or important libraries. This might occur in an environment other than a production environment, in order to find weaknesses that can be exploited in a production environment."
  ]
  execution_flow [
    step "3"
    phase "Experiment"
    description "[Iterate over access capabilities] Possibly as a valid user, the attacker then tries to access each of the noted access mechanisms directly in order to perform functions not constrained by the ACLs."
    techniques "_networkx_list_start"
    techniques "Fuzzing of API parameters (URL parameters, OS API parameters, protocol parameters)"
  ]
  node [
    id 0
    label "survey_the_target_application"
  ]
  node [
    id 1
    label "guess_actions"
  ]
  node [
    id 2
    label "identify_functionality"
  ]
  node [
    id 3
    label "note_the_resource_or_functionality_access_mechanism_invoked_upon_performing_specific_actions"
  ]
  node [
    id 4
    label "apply_attack_data"
  ]
  node [
    id 5
    label "execute_the_software"
  ]
  node [
    id 6
    label "implement_the_model_view_controller_mvc"
  ]
  node [
    id 7
    label "place_no_security_constraint"
  ]
  node [
    id 8
    label "associate_elements_subsections_of_the_application_with_acls"
  ]
  node [
    id 9
    label "forget_to_associate_an_acl"
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
  edge [
    source 3
    target 4
  ]
  edge [
    source 4
    target 5
  ]
  edge [
    source 5
    target 6
  ]
  edge [
    source 6
    target 7
  ]
  edge [
    source 7
    target 8
  ]
  edge [
    source 8
    target 9
  ]
]
