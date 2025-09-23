graph [
  directed 1
  capec_id "295"
  name "Timestamp Request"
  abstraction "Detailed"
  status "Stable"
  description "This pattern of attack leverages standard requests to learn the exact time associated with a target system. An adversary may be able to use the timestamp returned from the target to attack time-based security algorithms, such as random number generators, or time-based authentication mechanisms."
  likelihood ""
  severity "Low"
  related_attack_patterns "_networkx_list_start"
  related_attack_patterns [
    capec_id "292"
    nature "ChildOf"
  ]
  prerequisites "_networkx_list_start"
  prerequisites "The ability to send a timestamp request to a remote target and receive a response."
  skills_required "[]"
  resources_required "_networkx_list_start"
  resources_required "Scanners or utilities that provide the ability to send custom ICMP queries."
  consequences "_networkx_list_start"
  consequences [
    scope "_networkx_list_start"
    scope "Confidentiality"
    impact "Other"
  ]
  mitigations "[]"
  example_instances "An adversary sends an ICMP type 13 Timestamp Request to determine the time as recorded by a remote target. Timestamp Replies, ICMP Type 14, usually return a value in Greenwich Mean Time. An adversary can attempt to use an ICMP Timestamp requests to 'ping' a remote system to see if is alive. Additionally, because these types of messages are rare they are easily spotted by intrusion detection systems, many ICMP scanning tools support IP spoofing to help conceal the origin of the actual request among a storm of similar ICMP messages. It is a common practice for border firewalls and gateways to be configured to block ingress ICMP type 13 and egress ICMP type 14 messages."
  example_instances "An adversary may gather the system time or time zone from a local or remote system. This information may be gathered in a number of ways, such as with Net on Windows by performing net time \\hostname to gather the system time on a remote system. The victim's time zone may also be inferred from the current system time or gathered by using w32tm /tz. The information could be useful for performing other techniques, such as executing a file with a Scheduled Task, or to discover locality information based on time zone to assist in victim targeting"
  related_weaknesses "_networkx_list_start"
  related_weaknesses "200"
  matched_cwes "_networkx_list_start"
  matched_cwes "200"
  taxonomy_mappings "_networkx_list_start"
  taxonomy_mappings [
    taxonomy_name "ATTACK"
    entry_id "1124"
    entry_name "System Time Discovery"
  ]
  execution_flow "[]"
  node [
    id 0
    label "send_an_icmp_type_13_timestamp_request"
  ]
  node [
    id 1
    label "return_a_value"
  ]
  node [
    id 2
    label "attempt_to_use_an_icmp_timestamp_requests_to_ping_a_remote_system_to_see_if_is_alive"
  ]
  node [
    id 3
    label "spot_because_these_types_of_messages_are_rare"
  ]
  node [
    id 4
    label "configure_to_block_ingress_icmp_type_13"
  ]
  node [
    id 5
    label "gather_the_system_time_or_time_zone"
  ]
  node [
    id 6
    label "gather_the_necessary_information"
  ]
  node [
    id 7
    label "infer_the_victim_s_time_zone"
  ]
  node [
    id 8
    label "perform_other_techniques_such_as_executing_a_file_with_a_scheduled_task_or_to_discover_locality_information_based_on_time_zone_to_assist_in_victim_targeting"
  ]
  node [
    id 9
    label "send_a_timestamp_request"
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
