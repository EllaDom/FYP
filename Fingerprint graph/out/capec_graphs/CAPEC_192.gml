graph [
  directed 1
  capec_id "192"
  name "Protocol Analysis"
  abstraction "Meta"
  status "Stable"
  description "An adversary engages in activities to decipher and/or decode protocol information for a network or application communication protocol used for transmitting information between interconnected nodes or systems on a packet-switched data network. While this type of analysis involves the analysis of a networking protocol inherently, it does not require the presence of an actual or physical network."
  likelihood "Low"
  severity "Low"
  related_attack_patterns "[]"
  prerequisites "Access to a binary executable."
  prerequisites "The ability to observe and interact with a communication channel between communicating processes."
  skills_required "_networkx_list_start"
  skills_required [
    level "High"
    description "Knowlegde of the Open Systems Interconnection model (OSI model), and famililarity with Wireshark or some other packet analyzer."
  ]
  resources_required "_networkx_list_start"
  resources_required "Depending on the type of analysis, a variety of tools might be required, such as static code and/or dynamic analysis tools. Alternatively, the effort might require debugging programs such as ollydbg, SoftICE, or disassemblers like IDA Pro. In some instances, packet sniffing or packet analyzing programs such as TCP dump or Wireshark are necessary. Lastly, specific protocol analysis might require tools such as PDB (Protocol Debug), or packet injection tools like pcap or Nemesis."
  consequences [
    scope "_networkx_list_start"
    scope "Confidentiality"
    impact "Read Data"
  ]
  consequences [
    scope "_networkx_list_start"
    scope "Integrity"
    impact "Modify Data"
  ]
  mitigations "[]"
  example_instances "[]"
  related_weaknesses "_networkx_list_start"
  related_weaknesses "326"
  matched_cwes "_networkx_list_start"
  matched_cwes "326"
  taxonomy_mappings "[]"
  execution_flow "[]"
]
