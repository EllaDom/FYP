graph [
  directed 1
  capec_id "141"
  name "Cache Poisoning"
  abstraction "Standard"
  status "Draft"
  description "An attacker exploits the functionality of cache technologies to cause specific data to be cached that aids the attackers' objectives. This describes any attack whereby an attacker places incorrect or harmful material in cache. The targeted cache can be an application's cache (e.g. a web browser cache) or a public cache (e.g. a DNS or ARP cache). Until the cache is refreshed, most applications or clients will treat the corrupted cache value as valid. This can lead to a wide range of exploits including redirecting web browsers towards sites that install malware and repeatedly incorrect calculations based on the incorrect value."
  likelihood "High"
  severity "High"
  related_attack_patterns "_networkx_list_start"
  related_attack_patterns [
    capec_id "161"
    nature "ChildOf"
  ]
  prerequisites "The attacker must be able to modify the value stored in a cache to match a desired value."
  prerequisites "The targeted application must not be able to detect the illicit modification of the cache and must trust the cache value in its calculations."
  skills_required "_networkx_list_start"
  skills_required [
    level "Medium"
    description "To overwrite/modify targeted cache"
  ]
  resources_required "[]"
  consequences "[]"
  mitigations "Configuration: Disable client side caching."
  mitigations "Implementation: Listens for query replies on a network, and sends a notification via email when an entry changes."
  example_instances "_networkx_list_start"
  example_instances "In this example, an attacker sends request to a local DNS server to look up www.example .com. The associated IP address of www.example.com is 1.3.5.7. Local DNS usually caches IP addresses and do not go to remote DNS every time. Since the local record is not found, DNS server tries to connect to remote DNS for queries. However, before the remote DNS returns the right IP address 1.3.5.7, the attacker floods local DNS with crafted responses with IP address 2.4.6.8. The result is that 2.4.6.8 is stored in DNS cache. Meanwhile, 2.4.6.8 is associated with a malicious website www.maliciousexampsle.com When users connect to www.example.com, the local DNS will direct it to www.maliciousexample.com, this works as part of a Pharming attack."
  related_weaknesses "348"
  related_weaknesses "345"
  related_weaknesses "349"
  related_weaknesses "346"
  matched_cwes "_networkx_list_start"
  matched_cwes "345"
  taxonomy_mappings [
    taxonomy_name "ATTACK"
    entry_id "1557.002"
    entry_name "Adversary-in-the-Middle: ARP Cache Poisoning"
  ]
  taxonomy_mappings [
    taxonomy_name "OWASP Attacks"
    entry_id ""
    entry_name "Cache Poisoning"
  ]
  execution_flow [
    step "1"
    phase "Explore"
    description "[Identify and explore caches] Use tools to sniff traffic and scan a network in order to locate application's cache (e.g. a web browser cache) or a public cache (e.g. a DNS or ARP cache) that may have vulnerabilities. Look for poisoning point in cache table entries."
    techniques "_networkx_list_start"
    techniques "Run tools that check available entries in the cache."
  ]
  execution_flow [
    step "2"
    phase "Experiment"
    description "[Cause specific data to be cached] An attacker sends bogus request to the target, and then floods responses that trick a cache to remember malicious responses, which are wrong answers of queries."
    techniques "_networkx_list_start"
    techniques "Intercept or modify a query, or send a bogus query with known credentials (such as transaction ID)."
  ]
  execution_flow [
    step "3"
    phase "Exploit"
    description "[Redirect users to malicious website] As the attacker succeeds in exploiting the vulnerability, they are able to manipulate and interpose malicious response data to targeted victim queries."
    techniques "Intercept or modify a query, or send a bogus query with known credentials (such as transaction ID)."
    techniques "Adversary-in-the-Middle attacks (CAPEC-94) intercept secure communication between two parties."
  ]
  node [
    id 0
    label "run_tools_that_check_available_entries_in_the_cache"
  ]
  node [
    id 1
    label "send_bogus_request"
  ]
  node [
    id 2
    label "redirect_users"
  ]
  node [
    id 3
    label "intercept_secure_communication_between_two_parties"
  ]
  node [
    id 4
    label "send_request"
  ]
  node [
    id 5
    label "cache_ip_addresses"
  ]
  node [
    id 6
    label "find_the_local_record"
  ]
  node [
    id 7
    label "return_the_right_ip_address_1_3_5_7"
  ]
  node [
    id 8
    label "store_2_4_6_8"
  ]
  node [
    id 9
    label "associate_2_4_6_8"
  ]
  node [
    id 10
    label "modify_the_value_stored_in_a_cache"
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
]
