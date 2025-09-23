graph [
  directed 1
  capec_id "182"
  name "Flash Injection"
  abstraction "Standard"
  status "Draft"
  description "An attacker tricks a victim to execute malicious flash content that executes commands or makes flash calls specified by the attacker. One example of this attack is cross-site flashing, an attacker controlled parameter to a reference call loads from content specified by the attacker."
  likelihood "High"
  severity "Medium"
  related_attack_patterns [
    capec_id "137"
    nature "ChildOf"
  ]
  related_attack_patterns [
    capec_id "248"
    nature "CanAlsoBe"
  ]
  prerequisites "_networkx_list_start"
  prerequisites "The target must be capable of running Flash applications. In some cases, the victim must follow an attacker-supplied link."
  skills_required "_networkx_list_start"
  skills_required [
    level "Medium"
    description "The attacker needs to have knowledge of Flash, especially how to insert content the executes commands."
  ]
  resources_required "_networkx_list_start"
  resources_required "None: No specialized resources are required to execute this type of attack. The attacker may need to be able to serve the injected Flash content."
  consequences [
    scope "_networkx_list_start"
    scope "Confidentiality"
    impact "Other"
  ]
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
    scope "_networkx_list_start"
    scope "Authorization"
    impact "Execute Unauthorized Commands"
  ]
  consequences [
    scope "Accountability"
    scope "Authentication"
    scope "Authorization"
    scope "Non-Repudiation"
    impact "Gain Privileges"
  ]
  consequences [
    scope "Access Control"
    scope "Authorization"
    impact "Bypass Protection Mechanism"
  ]
  mitigations "Implementation: remove sensitive information such as user name and password in the SWF file."
  mitigations "Implementation: use validation on both client and server side."
  mitigations "Implementation: remove debug information."
  mitigations "Implementation: use SSL when loading external data"
  mitigations "Implementation: use crossdomain.xml file to allow the application domain to load stuff or the SWF file called by other domain."
  example_instances "_networkx_list_start"
  example_instances "In the following example, the SWF file contains getURL('javascript:SomeFunc(&#34;someValue&#34;)','','GET') A request like http://example.com/noundef.swf?a=0:0;alert('XSS') becomes javascript:SomeFunc(&#34;someValue&#34;)?a=0:0;alert(123)"
  related_weaknesses "20"
  related_weaknesses "184"
  related_weaknesses "697"
  matched_cwes "_networkx_list_start"
  matched_cwes "20"
  taxonomy_mappings "[]"
  execution_flow [
    step "1"
    phase "Explore"
    description "[Find Injection Entry Points] The attacker first takes an inventory of the entry points of the application."
    techniques "Spider the website for all available URLs that reference a Flash application."
    techniques "List all uninitialized global variables (such as _root.*, _global.*, _level0.*) in ActionScript, registered global variables in included files, load variables to external movies."
  ]
  execution_flow [
    step "2"
    phase "Experiment"
    description "[Determine the application's susceptibility to Flash injection] Determine the application's susceptibility to Flash injection. For each URL identified in the explore phase, the attacker attempts to use various techniques such as direct load asfunction, controlled evil page/host, Flash HTML injection, and DOM injection to determine whether the application is susceptible to Flash injection."
    techniques "Test the page using direct load asfunction, getURL,javascript:gotRoot(&#34;&#34;)///d.jpg"
    techniques "Test the page using controlled evil page/host, http://example.com/evil.swf"
    techniques "Test the page using Flash HTML injection, &#34;'><img src='asfunction:getURL,javascript:gotRoot(&#34;&#34;)//.jpg' >"
    techniques "Test the page using DOM injection, (gotRoot(''))"
  ]
  execution_flow [
    step "3"
    phase "Exploit"
    description "[Inject malicious content into target] Inject malicious content into target utilizing vulnerable injection vectors identified in the Experiment phase"
    techniques "[]"
  ]
  node [
    id 0
    label "find_injection_point"
  ]
  node [
    id 1
    label "take_an_inventory_of_the_entry_points_of_the_application"
  ]
  node [
    id 2
    label "spider_the_web_site_for_all_available_links"
  ]
  node [
    id 3
    label "list_all_uninitialized_global_variables_such_as_root"
  ]
  node [
    id 4
    label "determine_the_application_s_susceptibility"
  ]
  node [
    id 5
    label "test_the_page"
  ]
  node [
    id 6
    label "inject_their_malicious_file"
  ]
  node [
    id 7
    label "become_somefunc_somevalue_a_0_0_alert_123"
  ]
  node [
    id 8
    label "target_the_current_flash_application"
  ]
  node [
    id 9
    label "follow_an_attacker_supplied_link"
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
    target 5
  ]
  edge [
    source 5
    target 6
  ]
  edge [
    source 6
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
