graph [
  directed 1
  capec_id "228"
  name "DTD Injection"
  abstraction "Detailed"
  status "Draft"
  description "An attacker injects malicious content into an application's DTD in an attempt to produce a negative technical impact. DTDs are used to describe how XML documents are processed. Certain malformed DTDs (for example, those with excessive entity expansion as described in CAPEC 197) can cause the XML parsers that process the DTDs to consume excessive resources resulting in resource depletion."
  likelihood ""
  severity "Medium"
  related_attack_patterns [
    capec_id "250"
    nature "ChildOf"
  ]
  related_attack_patterns [
    capec_id "197"
    nature "CanPrecede"
  ]
  related_attack_patterns [
    capec_id "491"
    nature "CanPrecede"
  ]
  prerequisites "_networkx_list_start"
  prerequisites "The target must be running an XML based application that leverages DTDs."
  skills_required "[]"
  resources_required "[]"
  consequences "[]"
  mitigations "Design: Sanitize incoming DTDs to prevent excessive expansion or other actions that could result in impacts like resource depletion."
  mitigations "Implementation: Disallow the inclusion of DTDs as part of incoming messages."
  mitigations "Implementation: Use XML parsing tools that protect against DTD attacks."
  example_instances "[]"
  related_weaknesses "_networkx_list_start"
  related_weaknesses "829"
  matched_cwes "_networkx_list_start"
  matched_cwes "829"
  taxonomy_mappings "[]"
  execution_flow [
    step "1"
    phase "Explore"
    description "[Survey the target] Using a browser or an automated tool, an attacker records all instances of web services to process XML requests."
    techniques "Use an automated tool to record all instances of URLs to process XML requests."
    techniques "Use a browser to manually explore the website and analyze how the application processes XML requests."
  ]
  execution_flow [
    step "2"
    phase "Explore"
    description "[Determine use of XML with DTDs] Examine application input to identify XML input that leverage the use of one or more DTDs."
    techniques "Examine any available documentation for the application that discusses expected XML input."
    techniques "Exercise the application using XML input with and without a DTD specified. Failure without DTD likely indicates use of DTD."
  ]
  execution_flow [
    step "3"
    phase "Exploit"
    description "[Craft and inject XML containg malicious DTD payload]"
    techniques "Inject XML expansion attack that creates a Denial of Service impact on the targeted server using its DTD."
    techniques "Inject XML External Entity (XEE) attack that can cause the disclosure of confidential information, execute abitrary code, create a Denial of Service of the targeted server, or several other malicious impacts."
  ]
  node [
    id 0
    label "survey_the_target_application"
  ]
  node [
    id 1
    label "record_all_instances_of_urls"
  ]
  node [
    id 2
    label "explore_the_website"
  ]
  node [
    id 3
    label "determine_use_of_xml_with_dtds"
  ]
  node [
    id 4
    label "examine_any_available_documentation_for_the_application"
  ]
  node [
    id 5
    label "exercise_the_application_using_xml_input_with_and_without_a_dtd_specified"
  ]
  node [
    id 6
    label "indicate_use_of_dtd"
  ]
  node [
    id 7
    label "inject_xml_expansion_attack_that_creates_a_denial_of_service_impact_on_the_targeted_server_using_its_dtd"
  ]
  node [
    id 8
    label "run_an_xml_based_application_that_leverages_dtds"
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
]
