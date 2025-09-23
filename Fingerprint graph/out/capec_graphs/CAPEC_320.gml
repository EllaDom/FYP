graph [
  directed 1
  capec_id "320"
  name "TCP Timestamp Probe"
  abstraction "Detailed"
  status "Stable"
  description "This OS fingerprinting probe examines the remote server's implementation of TCP timestamps. Not all operating systems implement timestamps within the TCP header, but when timestamps are used then this provides the attacker with a means to guess the operating system of the target. The attacker begins by probing any active TCP service in order to get response which contains a TCP timestamp. Different Operating systems update the timestamp value using different intervals. This type of analysis is most accurate when multiple timestamp responses are received and then analyzed. TCP timestamps can be found in the TCP Options field of the TCP header."
  likelihood "Medium"
  severity "Low"
  related_attack_patterns "_networkx_list_start"
  related_attack_patterns [
    capec_id "312"
    nature "ChildOf"
  ]
  prerequisites "_networkx_list_start"
  prerequisites "The ability to monitor and interact with network communications.Access to at least one host, and the privileges to interface with the network interface card.The target OS must support the TCP timestamp option in order to obtain a fingerprint."
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
    impact "Bypass Protection Mechanism"
  ]
  mitigations "[]"
  example_instances "[]"
  related_weaknesses "_networkx_list_start"
  related_weaknesses "200"
  matched_cwes "_networkx_list_start"
  matched_cwes "200"
  taxonomy_mappings "[]"
  execution_flow [
    step "1"
    phase "Explore"
    description "[Determine if timestamps are present.] The adversary sends a probe packet to the remote host to identify if timestamps are present."
    techniques "[]"
  ]
  execution_flow [
    step "2"
    phase "Experiment"
    description "[Record and analyze timestamp values.] If the remote host is using timestamp, obtain several timestamps, analyze them and compare them to known values."
    techniques "The adversary sends several requests and records the timestamp values."
    techniques "The adversary analyzes the timestamp values and determines an average increments per second in the timestamps for the target."
    techniques "The adversary compares this result to a database of known TCP timestamp increments for a possible match."
  ]
  node [
    id 0
    label "determine_if_timestamps_are_present"
  ]
  node [
    id 1
    label "send_a_probe_packet"
  ]
  node [
    id 2
    label "obtain_several_timestamps"
  ]
  node [
    id 3
    label "send_request"
  ]
  node [
    id 4
    label "analyze_the_timestamp_values"
  ]
  node [
    id 5
    label "compare_this_result"
  ]
  node [
    id 6
    label "support_the_tcp_timestamp_option"
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
]
