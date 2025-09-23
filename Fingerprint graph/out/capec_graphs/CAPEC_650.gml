graph [
  directed 1
  capec_id "650"
  name "Upload a Web Shell to a Web Server"
  abstraction "Detailed"
  status "Draft"
  description "By exploiting insufficient permissions, it is possible to upload a web shell to a web server in such a way that it can be executed remotely. This shell can have various capabilities, thereby acting as a &#34;gateway&#34; to the underlying web server. The shell might execute at the higher permission level of the web server, providing the ability the execute malicious code at elevated levels."
  likelihood ""
  severity "High"
  related_attack_patterns "_networkx_list_start"
  related_attack_patterns [
    capec_id "17"
    nature "ChildOf"
  ]
  prerequisites "_networkx_list_start"
  prerequisites "The web server is susceptible to one of the various web application exploits that allows for uploading a shell file."
  skills_required "[]"
  resources_required "[]"
  consequences [
    scope "_networkx_list_start"
    scope "Confidentiality"
    impact "Read Data"
  ]
  consequences [
    scope "Confidentiality"
    scope "Access Control"
    scope "Authorization"
    impact "Gain Privileges"
  ]
  consequences [
    scope "Confidentiality"
    scope "Integrity"
    scope "Availability"
    impact "Execute Unauthorized Commands"
  ]
  mitigations "Make sure your web server is up-to-date with all patches to protect against known vulnerabilities."
  mitigations "Ensure that the file permissions in directories on the web server from which files can be execute is set to the &#34;least privilege&#34; settings, and that those directories contents is controlled by an allowlist."
  example_instances "[]"
  related_weaknesses "287"
  related_weaknesses "553"
  matched_cwes "_networkx_list_start"
  matched_cwes "287"
  taxonomy_mappings "_networkx_list_start"
  taxonomy_mappings [
    taxonomy_name "ATTACK"
    entry_id "1505.003"
    entry_name "Server Software Component:Web Shell"
  ]
  execution_flow "[]"
]
