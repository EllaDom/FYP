graph [
  directed 1
  capec_id "142"
  name "DNS Cache Poisoning"
  abstraction "Detailed"
  status "Draft"
  description "A domain name server translates a domain name (such as www.example.com) into an IP address that Internet hosts use to contact Internet resources. An adversary modifies a public DNS cache to cause certain names to resolve to incorrect addresses that the adversary specifies. The result is that client applications that rely upon the targeted cache for domain name resolution will be directed not to the actual address of the specified domain name but to some other address. Adversaries can use this to herd clients to sites that install malware on the victim's computer or to masquerade as part of a Pharming attack."
  likelihood "High"
  severity "High"
  related_attack_patterns [
    capec_id "141"
    nature "ChildOf"
  ]
  related_attack_patterns [
    capec_id "89"
    nature "CanPrecede"
  ]
  prerequisites "_networkx_list_start"
  prerequisites "A DNS cache must be vulnerable to some attack that allows the adversary to replace addresses in its lookup table.Client applications must trust the corrupted cashed values and utilize them for their domain name resolutions."
  skills_required "_networkx_list_start"
  skills_required [
    level "Medium"
    description "To overwrite/modify targeted DNS cache"
  ]
  resources_required "_networkx_list_start"
  resources_required "The adversary must have the resources to modify the targeted cache. In addition, in most cases the adversary will wish to host the sites to which users will be redirected, although in some cases redirecting to a third party site will accomplish the adversary's goals."
  consequences "[]"
  mitigations "Configuration: Make sure your DNS servers have been updated to the latest versions"
  mitigations "Configuration: UNIX services like rlogin, rsh/rcp, xhost, and nfs are all susceptible to wrong information being held in a cache. Care should be taken with these services so they do not rely upon DNS caches that have been exposed to the Internet."
  mitigations "Configuration: Disable client side DNS caching."
  example_instances "_networkx_list_start"
  example_instances "In this example, an adversary sends request to a local DNS server to look up www.example .com. The associated IP address of www.example.com is 1.3.5.7. Local DNS usually caches IP addresses and do not go to remote DNS every time. Since the local record is not found, DNS server tries to connect to remote DNS for queries. However, before the remote DNS returns the right IP address 1.3.5.7, the adversary floods local DNS with crafted responses with IP address 2.4.6.8. The result is that 2.4.6.8 is stored in DNS cache. Meanwhile, 2.4.6.8 is associated with a malicious website www.maliciousexampsle.com When users connect to www.example.com, the local DNS will direct it to www.maliciousexample.com, this works as part of a Pharming attack."
  related_weaknesses "348"
  related_weaknesses "345"
  related_weaknesses "349"
  related_weaknesses "346"
  related_weaknesses "350"
  matched_cwes "_networkx_list_start"
  matched_cwes "345"
  taxonomy_mappings "_networkx_list_start"
  taxonomy_mappings [
    taxonomy_name "ATTACK"
    entry_id "1584.002"
    entry_name "Compromise Infrastructure: DNS Server"
  ]
  execution_flow [
    step "1"
    phase "Explore"
    description "[Explore resolver caches] Check DNS caches on local DNS server and client's browser with DNS cache enabled."
    techniques "Run tools that check the resolver cache in the memory to see if it contains a target DNS entry."
    techniques "Figure out if the client's browser has DNS cache enabled."
  ]
  execution_flow [
    step "2"
    phase "Experiment"
    description "[Attempt sending crafted records to DNS cache] A request is sent to the authoritative server for target website and wait for the iterative name resolver. An adversary sends bogus request to the DNS local server, and then floods responses that trick a DNS cache to remember malicious responses, which are wrong answers of DNS query."
    techniques "Adversary must know the transaction ID by intercepting a DNS query, or sending a bogus query with known transaction ID."
    techniques "If the transaction ID used to identify each query instance is randomized in some new DNS software, the attack must guess the transaction ID. Slow the response of the real DNS server by causing Denial-of-service. This gives adversaries enough time to guess transaction"
    techniques "Adversary crafts DNS response with the same transaction ID as in the request. The adversary sends out DNS responses before the authorized DNS server. This forces DNS local cache stores fake DNS response (wrong answer). The fake DNS responses usually include a malicious website's IP address."
  ]
  execution_flow [
    step "3"
    phase "Exploit"
    description "[Redirect users to malicious website] As the adversary succeeds in exploiting the vulnerability, the victim connects to a malicious site using a good web site's domain name."
    techniques "Redirecting Web traffic to a site that looks enough like the original so as to not raise any suspicion."
    techniques "Adversary-in-the-Middle (CAPEC-94) intercepts secure communication between two parties."
  ]
  node [
    id 0
    label "run_tools_that_check_the_resolver_cache_in_the_memory_to_see_if_it_contains_a_target_dns_entry"
  ]
  node [
    id 1
    label "figure_if_the_client_s_browser_has_dns_cache_enabled"
  ]
  node [
    id 2
    label "attempt_sending_crafted_records_to_dns_cache"
  ]
  node [
    id 3
    label "send_bogus_request"
  ]
  node [
    id 4
    label "know_the_transaction_id"
  ]
  node [
    id 5
    label "identify_each_query_instance"
  ]
  node [
    id 6
    label "slow_the_response_of_the_real_dns_server"
  ]
  node [
    id 7
    label "allow_the_adversary"
  ]
  node [
    id 8
    label "send_dns_responses"
  ]
  node [
    id 9
    label "include_a_malicious_website_s_ip_address"
  ]
  node [
    id 10
    label "redirect_users"
  ]
  node [
    id 11
    label "redirect_web_traffic"
  ]
  node [
    id 12
    label "intercept_secure_communication_between_two_parties"
  ]
  node [
    id 13
    label "send_request"
  ]
  node [
    id 14
    label "cache_ip_addresses"
  ]
  node [
    id 15
    label "find_the_local_record"
  ]
  node [
    id 16
    label "return_the_right_ip_address_1_3_5_7"
  ]
  node [
    id 17
    label "store_2_4_6_8"
  ]
  node [
    id 18
    label "associate_2_4_6_8"
  ]
  node [
    id 19
    label "trust_the_corrupted_cashed_values"
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
  edge [
    source 12
    target 13
  ]
  edge [
    source 13
    target 14
  ]
  edge [
    source 14
    target 15
  ]
  edge [
    source 15
    target 16
  ]
  edge [
    source 16
    target 17
  ]
  edge [
    source 17
    target 18
  ]
  edge [
    source 18
    target 19
  ]
]
