graph [
  directed 1
  capec_id "691"
  name "Spoof Open-Source Software Metadata"
  abstraction "Standard"
  status "Stable"
  description "&#10;            "
  likelihood "Medium"
  severity "High"
  related_attack_patterns [
    capec_id "690"
    nature "ChildOf"
  ]
  related_attack_patterns [
    capec_id "184"
    nature "CanPrecede"
  ]
  related_attack_patterns [
    capec_id "444"
    nature "CanPrecede"
  ]
  related_attack_patterns [
    capec_id "630"
    nature "PeerOf"
  ]
  prerequisites "_networkx_list_start"
  prerequisites "Identification of a popular open-source component whose metadata is to be spoofed."
  skills_required "_networkx_list_start"
  skills_required [
    level "Medium"
    description "Ability to spoof a variety of software metadata to convince victims the source is trusted."
  ]
  resources_required "[]"
  consequences [
    scope "_networkx_list_start"
    scope "Integrity"
    impact "Modify Data"
  ]
  consequences [
    scope "_networkx_list_start"
    scope "Accountability"
    impact "Hide Activities"
  ]
  consequences [
    scope "Access Control"
    scope "Authorization"
    impact "Execute Unauthorized Commands"
  ]
  mitigations "Before downloading open-source software, perform precursory metadata checks to determine the author(s), frequency of updates, when the software was last updated, and if the software is widely leveraged."
  mitigations "Within package managers, look for conflicting or non-unique repository references to determine if multiple packages share the same repository reference."
  mitigations "Reference vulnerability databases to determine if the software contains known vulnerabilities."
  mitigations "Only download open-source software from reputable hosting sites or package managers."
  mitigations "Only download open-source software that has been adequately signed by the developer(s). For repository commits/tags, look for the &#34;Verified&#34; status and for developers leveraging &#34;Vigilant Mode&#34; (GitHub) or similar modes."
  mitigations "After downloading open-source software, ensure integrity values have not changed."
  mitigations "Before executing or incorporating the software, leverage automated testing techniques (e.g., static and dynamic analysis) to determine if the software behaves maliciously."
  example_instances "_networkx_list_start"
  example_instances "An adversary provides a malicious open-source library, claiming to provide extended logging features and functionality, and spoofs the metadata with that of a widely used legitimate library. The adversary then tricks victims into including this library in their underlying application. Once the malicious software is incorporated into the application, the adversary is able to manipulate and exfiltrate log data."
  related_weaknesses "_networkx_list_start"
  related_weaknesses "494"
  matched_cwes "_networkx_list_start"
  matched_cwes "494"
  taxonomy_mappings [
    taxonomy_name "ATTACK"
    entry_id "1195.001"
    entry_name "Supply Chain Compromise: Compromise Software Dependencies and Development Tools"
  ]
  taxonomy_mappings [
    taxonomy_name "ATTACK"
    entry_id "1195.002"
    entry_name "Supply Chain Compromise: Compromise Software Supply Chain"
  ]
  execution_flow "[]"
  node [
    id 0
    label "craft_malicious_libraries"
  ]
  node [
    id 1
    label "trick_the_victim"
  ]
  node [
    id 2
    label "incorporate_the_malicious_software"
  ]
  edge [
    source 0
    target 1
  ]
  edge [
    source 1
    target 2
  ]
]
