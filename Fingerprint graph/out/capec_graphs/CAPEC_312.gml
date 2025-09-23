graph [
  directed 1
  capec_id "312"
  name "Active OS Fingerprinting"
  abstraction "Standard"
  status "Stable"
  description "An adversary engages in activity to detect the operating system or firmware version of a remote target by interrogating a device, server, or platform with a probe designed to solicit behavior that will reveal information about the operating systems or firmware in the environment. Operating System detection is possible because implementations of common protocols (Such as IP or TCP) differ in distinct ways. While the implementation differences are not sufficient to 'break' compatibility with the protocol the differences are detectable because the target will respond in unique ways to specific probing activity that breaks the semantic or logical rules of packet construction for a protocol. Different operating systems will have a unique response to the anomalous input, providing the basis to fingerprint the OS behavior. This type of OS fingerprinting can distinguish between operating system types and versions."
  likelihood "Medium"
  severity "Low"
  related_attack_patterns "_networkx_list_start"
  related_attack_patterns [
    capec_id "224"
    nature "ChildOf"
  ]
  prerequisites "_networkx_list_start"
  prerequisites "The ability to monitor and interact with network communications.Access to at least one host, and the privileges to interface with the network interface card."
  skills_required "[]"
  resources_required "_networkx_list_start"
  resources_required "Any type of active probing that involves non-standard packet headers requires the use of raw sockets, which is not available on particular operating systems (Microsoft Windows XP SP 2, for example). Raw socket manipulation on Unix/Linux requires root privileges. A tool capable of sending and receiving packets from a remote system."
  consequences [
    scope "_networkx_list_start"
    scope "Confidentiality"
    impact "Read Data"
  ]
  consequences [
    scope "Confidentiality"
    scope "Access Control"
    scope "Authorization"
    impact "Hide Activities"
  ]
  mitigations "[]"
  example_instances "[]"
  related_weaknesses "_networkx_list_start"
  related_weaknesses "200"
  matched_cwes "_networkx_list_start"
  matched_cwes "200"
  taxonomy_mappings "_networkx_list_start"
  taxonomy_mappings [
    taxonomy_name "ATTACK"
    entry_id "1082"
    entry_name "System Information Discovery"
  ]
  execution_flow "[]"
]
