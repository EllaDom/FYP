graph [
  directed 1
  capec_id "563"
  name "Add Malicious File to Shared Webroot"
  abstraction "Detailed"
  status "Draft"
  description "An adversaries may add malicious content to a website through the open file share and then browse to that content with a web browser to cause the server to execute the content. The malicious content will typically run under the context and permissions of the web server process, often resulting in local system or administrative privileges depending on how the web server is configured."
  likelihood ""
  severity ""
  related_attack_patterns "_networkx_list_start"
  related_attack_patterns [
    capec_id "17"
    nature "ChildOf"
  ]
  prerequisites "[]"
  skills_required "[]"
  resources_required "[]"
  consequences "[]"
  mitigations "_networkx_list_start"
  mitigations "Ensure proper permissions on directories that are accessible through a web server. Disallow remote access to the web root. Disable execution on directories within the web root. Ensure that permissions of the web server process are only what is required by not using built-in accounts and instead create specific accounts to limit unnecessary access or permissions overlap across multiple systems."
  example_instances "[]"
  related_weaknesses "_networkx_list_start"
  related_weaknesses "284"
  matched_cwes "_networkx_list_start"
  matched_cwes "284"
  taxonomy_mappings "[]"
  execution_flow "[]"
]
