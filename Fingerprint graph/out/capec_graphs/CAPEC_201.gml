graph [
  directed 1
  capec_id "201"
  name "Serialized Data External Linking"
  abstraction "Detailed"
  status "Draft"
  description "An adversary creates a serialized data file (e.g. XML, YAML, etc...) that contains an external data reference. Because serialized data parsers may not validate documents with external references, there may be no checks on the nature of the reference in the external data. This can allow an adversary to open arbitrary files or connections, which may further lead to the adversary gaining access to information on the system that they would normally be unable to obtain."
  likelihood "High"
  severity "High"
  related_attack_patterns [
    capec_id "122"
    nature "ChildOf"
  ]
  related_attack_patterns [
    capec_id "278"
    nature "ChildOf"
  ]
  prerequisites "_networkx_list_start"
  prerequisites "The target must follow external data references without validating the validity of the reference target."
  skills_required "_networkx_list_start"
  skills_required [
    level "Low"
    description "To send serialized data messages with maliciously crafted schema."
  ]
  resources_required "_networkx_list_start"
  resources_required "None: No specialized resources are required to execute this type of attack."
  consequences "_networkx_list_start"
  consequences [
    scope "_networkx_list_start"
    scope "Confidentiality"
    impact "Read Data"
  ]
  mitigations "_networkx_list_start"
  mitigations "Configure the serialized data processor to only retrieve external entities from trusted sources."
  example_instances "The following DTD would attempt to open the /dev/tty device: <!DOCTYPE doc [ <!ENTITY ent SYSTEM &#34;file:///dev/tty&#34;> ]> A malicious actor could use this crafted DTD to reveal sensitive information."
  example_instances "The following XML snippet would attempt to open the /etc/passwd file: <foo xmlns:xi=&#34;http://www.w3.org/2001/XInclude&#34;> <xi:include parse=&#34;text&#34; href=&#34;file:///etc/passwd&#34;/></foo>"
  related_weaknesses "_networkx_list_start"
  related_weaknesses "829"
  matched_cwes "_networkx_list_start"
  matched_cwes "829"
  taxonomy_mappings "[]"
  execution_flow [
    step "1"
    phase "Explore"
    description "[Survey the target] Using a browser or an automated tool, an adversary records all instances of web services that process requests with serialized data."
    techniques "Use an automated tool to record all instances of URLs that process requests with serialized data."
    techniques "Use a browser to manually explore the website and analyze how the application processes serialized data requests."
  ]
  execution_flow [
    step "2"
    phase "Exploit"
    description "[Craft malicious payload] The adversary crafts malicious data message that contains references to sensitive files."
    techniques "[]"
  ]
  execution_flow [
    step "3"
    phase "Exploit"
    description "[Launch an External Linking attack] Send the malicious crafted message containing the reference to a sensitive file to the target URL."
    techniques "[]"
  ]
  node [
    id 0
    label "survey_the_target_application"
  ]
  node [
    id 1
    label "record_all_instances_of_urls_that_process_requests_with_serialized_data"
  ]
  node [
    id 2
    label "explore_the_website"
  ]
  node [
    id 3
    label "craft_malicious_payload"
  ]
  node [
    id 4
    label "launch_an_external_linking_attack"
  ]
  node [
    id 5
    label "follow_external_data_references"
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
]
