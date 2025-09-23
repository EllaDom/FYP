graph [
  directed 1
  capec_id "472"
  name "Browser Fingerprinting"
  abstraction "Detailed"
  status "Draft"
  description "An attacker carefully crafts small snippets of Java Script to efficiently detect the type of browser the potential victim is using. Many web-based attacks need prior knowledge of the web browser including the version of browser to ensure successful exploitation of a vulnerability. Having this knowledge allows an attacker to target the victim with attacks that specifically exploit known or zero day weaknesses in the type and version of the browser used by the victim. Automating this process via Java Script as a part of the same delivery system used to exploit the browser is considered more efficient as the attacker can supply a browser fingerprinting method and integrate it with exploit code, all contained in Java Script and in response to the same web page request by the browser."
  likelihood ""
  severity "Low"
  related_attack_patterns "_networkx_list_start"
  related_attack_patterns [
    capec_id "541"
    nature "ChildOf"
  ]
  prerequisites "_networkx_list_start"
  prerequisites "Victim's browser visits a website that contains attacker's Java ScriptJava Script is not disabled in the victim's browser"
  skills_required "[]"
  resources_required "[]"
  consequences "[]"
  mitigations "_networkx_list_start"
  mitigations "Configuration: Disable Java Script in the browser"
  example_instances "_networkx_list_start"
  example_instances "The following code snippets can be used to detect various browsers: Firefox 2/3 FF=/a/[-1]=='a' Firefox 3 FF3=(function x(){})[-5]=='x' Firefox 2 FF2=(function x(){})[-6]=='x' IE IE='\v'=='v' Safari Saf=/a/.__proto__=='//' Chrome Chr=/source/.test((/a/.toString+'')) Opera Op=/^function \(/.test([].sort)"
  related_weaknesses "_networkx_list_start"
  related_weaknesses "200"
  matched_cwes "_networkx_list_start"
  matched_cwes "200"
  taxonomy_mappings "[]"
  execution_flow "[]"
  node [
    id 0
    label "visit_a_website_that_contains_attacker_s_java_scriptjava_script"
  ]
]
