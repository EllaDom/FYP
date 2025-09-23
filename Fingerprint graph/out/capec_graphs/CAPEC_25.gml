graph [
  directed 1
  capec_id "25"
  name "Forced Deadlock"
  abstraction "Meta"
  status "Stable"
  description "The adversary triggers and exploits a deadlock condition in the target software to cause a denial of service. A deadlock can occur when two or more competing actions are waiting for each other to finish, and thus neither ever does. Deadlock conditions can be difficult to detect."
  likelihood "Low"
  severity "High"
  related_attack_patterns "[]"
  prerequisites "The target host has a deadlock condition. There are four conditions for a deadlock to occur, known as the Coffman conditions. [REF-101]"
  prerequisites "The target host exposes an API to the user."
  skills_required "_networkx_list_start"
  skills_required [
    level "Medium"
    description "This type of attack may be sophisticated and require knowledge about the system's resources and APIs."
  ]
  resources_required "[]"
  consequences "_networkx_list_start"
  consequences [
    scope "_networkx_list_start"
    scope "Availability"
    impact "Resource Consumption"
  ]
  mitigations "Use known algorithm to avoid deadlock condition (for instance non-blocking synchronization algorithms)."
  mitigations "For competing actions, use well-known libraries which implement synchronization."
  example_instances "_networkx_list_start"
  example_instances "An example of a deadlock which may occur in database products is the following. Client applications using the database may require exclusive access to a table, and in order to gain exclusive access they ask for a lock. If one client application holds a lock on a table and attempts to obtain the lock on a second table that is already held by a second client application, this may lead to deadlock if the second application then attempts to obtain the lock that is held by the first application (Source: Wikipedia, http://en.wikipedia.org/wiki/Deadlock)"
  related_weaknesses "412"
  related_weaknesses "567"
  related_weaknesses "662"
  related_weaknesses "667"
  related_weaknesses "833"
  related_weaknesses "1322"
  matched_cwes "_networkx_list_start"
  matched_cwes "662"
  taxonomy_mappings "_networkx_list_start"
  taxonomy_mappings [
    taxonomy_name "ATTACK"
    entry_id "1499.004"
    entry_name "Endpoint Denial of Service: Application or System Exploitation"
  ]
  execution_flow [
    step "1"
    phase "Explore"
    description "The adversary initiates an exploratory phase to get familiar with the system."
    techniques "[]"
  ]
  execution_flow [
    step "2"
    phase "Explore"
    description "The adversary triggers a first action (such as holding a resource) and initiates a second action which will wait for the first one to finish."
    techniques "[]"
  ]
  execution_flow [
    step "3"
    phase "Explore"
    description "If the target program has a deadlock condition, the program waits indefinitely resulting in a denial of service."
    techniques "[]"
  ]
  node [
    id 0
    label "initiate_an_exploratory_phase_to_get_familiar_with_the_system"
  ]
  node [
    id 1
    label "trigger_a_first_action_such_as_holding_a_resource"
  ]
  node [
    id 2
    label "wait_if_the_target_program_has_a_deadlock_condition"
  ]
  node [
    id 3
    label "require_exclusive_access_to_a_table"
  ]
  node [
    id 4
    label "hold_a_lock_on_a_table"
  ]
  node [
    id 5
    label "expose_an_api"
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
    source 2
    target 5
  ]
  edge [
    source 3
    target 4
  ]
  edge [
    source 4
    target 2
  ]
]
