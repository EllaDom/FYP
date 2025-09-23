graph [
  directed 1
  capec_id "503"
  name "WebView Exposure"
  abstraction "Standard"
  status "Draft"
  description "An adversary, through a malicious web page, accesses application specific functionality by leveraging interfaces registered through WebView's addJavascriptInterface API. Once an interface is registered to WebView through addJavascriptInterface, it becomes global and all pages loaded in the WebView can call this interface."
  likelihood ""
  severity ""
  related_attack_patterns "_networkx_list_start"
  related_attack_patterns [
    capec_id "122"
    nature "ChildOf"
  ]
  prerequisites "_networkx_list_start"
  prerequisites "This type of an attack requires the adversary to convince the user to load the malicious web page inside the target application. Once loaded, the malicious web page will have the same permissions as the target application and will have access to all registered interfaces. Both the permission and the interface must be in place for the functionality to be exposed."
  skills_required "[]"
  resources_required "[]"
  consequences "[]"
  mitigations "_networkx_list_start"
  mitigations "To mitigate this type of an attack, an application should limit permissions to only those required and should verify the origin of all web content it loads."
  example_instances "[]"
  related_weaknesses "_networkx_list_start"
  related_weaknesses "284"
  matched_cwes "_networkx_list_start"
  matched_cwes "284"
  taxonomy_mappings "[]"
  execution_flow "[]"
  node [
    id 0
    label "allow_the_adversary"
  ]
  node [
    id 1
    label "expose_the_functionality"
  ]
  edge [
    source 0
    target 1
  ]
]
