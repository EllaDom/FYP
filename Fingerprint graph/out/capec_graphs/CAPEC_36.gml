graph [
  directed 1
  capec_id "36"
  name "Using Unpublished Interfaces or Functionality"
  abstraction "Standard"
  status "Draft"
  description "An adversary searches for and invokes interfaces or functionality that the target system designers did not intend to be publicly available. If interfaces fail to authenticate requests, the attacker may be able to invoke functionality they are not authorized for."
  likelihood "Medium"
  severity "High"
  related_attack_patterns "_networkx_list_start"
  related_attack_patterns [
    capec_id "113"
    nature "ChildOf"
  ]
  prerequisites "_networkx_list_start"
  prerequisites "The architecture under attack must publish or otherwise make available services that clients can attach to, either in an unauthenticated fashion, or having obtained an authentication token elsewhere. The service need not be 'discoverable', but in the event it isn't it must have some way of being discovered by an attacker. This might include listening on a well-known port. Ultimately, the likelihood of exploit depends on discoverability of the vulnerable service."
  skills_required "_networkx_list_start"
  skills_required [
    level "Low"
    description "A number of web service digging tools are available for free that help discover exposed web services and their interfaces. In the event that a web service is not listed, the attacker does not need to know much more in addition to the format of web service messages that they can sniff/monitor for."
  ]
  resources_required "_networkx_list_start"
  resources_required "None: No specialized resources are required to execute this type of attack. Web service digging tools may be helpful."
  consequences [
    scope "_networkx_list_start"
    scope "Confidentiality"
    impact "Read Data"
  ]
  consequences [
    scope "Confidentiality"
    scope "Access Control"
    scope "Authorization"
    impact "Gain Privileges"
  ]
  mitigations "_networkx_list_start"
  mitigations "Authenticating both services and their discovery, and protecting that authentication mechanism simply fixes the bulk of this problem. Protecting the authentication involves the standard means, including: 1) protecting the channel over which authentication occurs, 2) preventing the theft, forgery, or prediction of authentication credentials or the resultant tokens, or 3) subversion of password reset and the like."
  example_instances "_networkx_list_start"
  example_instances "To an extent, Google services (such as Google Maps) are all well-known examples. Calling these services, or extending them for one's own (perhaps very different) purposes is as easy as knowing they exist. Their unencumbered public use, however, is a purposeful aspect of Google's business model. Most organizations, however, do not have the same business model. Organizations publishing services usually fall back on thoughts that Attackers &#34;will not know services exist&#34; and that &#34;even if they did, they wouldn't be able to access them because they're not on the local LAN.&#34; Simple threat modeling exercises usually uncovers simple attack vectors that can invalidate these assumptions."
  related_weaknesses "306"
  related_weaknesses "693"
  related_weaknesses "695"
  related_weaknesses "1242"
  matched_cwes "693"
  matched_cwes "306"
  taxonomy_mappings "[]"
  execution_flow [
    step "1"
    phase "Explore"
    description "[Identify services] Discover a service of interest by exploring service registry listings or by connecting on a known port or some similar means."
    techniques "Search via internet for known, published services."
    techniques "Use automated tools to scan known ports to identify internet-enabled services."
    techniques "Dump the code from the chip and then perform reverse engineering to analyze the code."
  ]
  execution_flow [
    step "2"
    phase "Explore"
    description "[Authenticate to service] Authenticate to the service, if required, in order to explore it."
    techniques "Use published credentials to access system."
    techniques "Find unpublished credentials to access service."
    techniques "Use other attack pattern or weakness to bypass authentication."
  ]
  execution_flow [
    step "3"
    phase "Explore"
    description "[Identify all interfaces] Determine the exposed interfaces by querying the registry as well as probably sniffing to expose interfaces that are not explicitly listed."
    techniques "For any published services, determine exposed interfaces via the documentation provided."
    techniques "For any services found, use error messages from poorly formed service calls to determine valid interfaces. In some cases, services will respond to poorly formed calls with valid ones."
  ]
  execution_flow [
    step "4"
    phase "Experiment"
    description "[Attempt to discover unpublished functions] Using manual or automated means, discover unpublished or undocumented functions exposed by the service."
    techniques "Manually attempt calls to the service using an educated guess approach, including the use of terms like' 'test', 'debug', 'delete', etc."
    techniques "Use automated tools to scan the service to attempt to reverse engineer exposed, but undocumented, features."
  ]
  execution_flow [
    step "5"
    phase "Exploit"
    description "[Exploit unpublished functions] Using information determined via experimentation, exploit the unpublished features of the service."
    techniques "Execute features that are not intended to be used by general system users."
    techniques "Craft malicious calls to features not intended to be used by general system users that take advantage of security flaws found in the functions."
  ]
  node [
    id 0
    label "dump_the_code"
  ]
  node [
    id 1
    label "require_authenticate_to_the_service"
  ]
  node [
    id 2
    label "publish_credentials"
  ]
  node [
    id 3
    label "find_unpublished_credentials"
  ]
  node [
    id 4
    label "use_other_attack_pattern_or_weakness_to_bypass_authentication"
  ]
  node [
    id 5
    label "identify_all_interfaces"
  ]
  node [
    id 6
    label "attempt_to_discover_unpublished_functions"
  ]
  node [
    id 7
    label "intend_that"
  ]
  node [
    id 8
    label "craft_malicious_calls_to_features_not_intended_to_be_used_by_general_system_users_that_take_advantage_of_security_flaws_found_in_the_functions"
  ]
  node [
    id 9
    label "call_these_services"
  ]
  node [
    id 10
    label "have_the_same_business_model"
  ]
  node [
    id 11
    label "uncover_simple_attack_vectors_that_can_invalidate_these_assumptions"
  ]
  node [
    id 12
    label "include_listening_on_a_well_known_port"
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
  edge [
    source 9
    target 10
  ]
  edge [
    source 10
    target 11
  ]
  edge [
    source 11
    target 12
  ]
]
