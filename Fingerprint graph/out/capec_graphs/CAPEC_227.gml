graph [
  directed 1
  capec_id "227"
  name "Sustained Client Engagement"
  abstraction "Meta"
  status "Draft"
  description "An adversary attempts to deny legitimate users access to a resource by continually engaging a specific resource in an attempt to keep the resource tied up as long as possible. The adversary's primary goal is not to crash or flood the target, which would alert defenders; rather it is to repeatedly perform actions or abuse algorithmic flaws such that a given resource is tied up and not available to a legitimate user. By carefully crafting a requests that keep the resource engaged through what is seemingly benign requests, legitimate users are limited or completely denied access to the resource."
  likelihood ""
  severity ""
  related_attack_patterns "[]"
  prerequisites "_networkx_list_start"
  prerequisites "This pattern of attack requires a temporal aspect to the servicing of a given request. Success can be achieved if the adversary can make requests that collectively take more time to complete than legitimate user requests within the same time frame."
  skills_required "[]"
  resources_required "_networkx_list_start"
  resources_required "To successfully execute this pattern of attack, a script or program is often required that is capable of continually engaging the target and maintaining sustained usage of a specific resource. Depending on the configuration of the target, it may or may not be necessary to involve a network or cluster of objects all capable of making parallel requests."
  consequences "[]"
  mitigations "_networkx_list_start"
  mitigations "Potential mitigations include requiring a unique login for each resource request, constraining local unprivileged access by disallowing simultaneous engagements of the resource, or limiting access to the resource to one access per IP address. In such scenarios, the adversary would have to increase engagements either by launching multiple sessions manually or programmatically to counter such defenses."
  example_instances "[]"
  related_weaknesses "_networkx_list_start"
  related_weaknesses "400"
  matched_cwes "_networkx_list_start"
  matched_cwes "400"
  taxonomy_mappings [
    taxonomy_name "ATTACK"
    entry_id "1499"
    entry_name "Endpoint Denial of Service"
  ]
  taxonomy_mappings [
    taxonomy_name "WASC"
    entry_id "10"
    entry_name "Denial of Service"
  ]
  execution_flow "[]"
  node [
    id 0
    label "require_a_temporal_aspect"
  ]
  node [
    id 1
    label "achieve_success"
  ]
  edge [
    source 0
    target 1
  ]
]
