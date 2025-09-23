graph [
  directed 1
  capec_id "169"
  name "Footprinting"
  abstraction "Meta"
  status "Stable"
  description "An adversary engages in probing and exploration activities to identify constituents and properties of the target."
  likelihood "High"
  severity "Very Low"
  related_attack_patterns "[]"
  prerequisites "_networkx_list_start"
  prerequisites "An application must publicize identifiable information about the system or application through voluntary or involuntary means. Certain identification details of information systems are visible on communication networks (e.g., if an adversary uses a sniffer to inspect the traffic) due to their inherent structure and protocol standards. Any system or network that can be detected can be footprinted. However, some configuration choices may limit the useful information that can be collected during a footprinting attack."
  skills_required "_networkx_list_start"
  skills_required [
    level "Low"
    description "The adversary knows how to send HTTP request, run the scan tool."
  ]
  resources_required "_networkx_list_start"
  resources_required "The adversary requires a variety of tools to collect information about the target. These include port/network scanners and tools to analyze responses from applications to determine version and configuration information. Footprinting a system adequately may also take a few days if the attacker wishes the footprinting attempt to go undetected."
  consequences "_networkx_list_start"
  consequences [
    scope "_networkx_list_start"
    scope "Confidentiality"
    impact "Read Data"
  ]
  mitigations "Keep patches up to date by installing weekly or daily if possible."
  mitigations "Shut down unnecessary services/ports."
  mitigations "Change default passwords by choosing strong passwords."
  mitigations "Curtail unexpected input."
  mitigations "Encrypt and password-protect sensitive data."
  mitigations "Avoid including information that has the potential to identify and compromise your organization's security such as access to business plans, formulas, and proprietary documents."
  example_instances "_networkx_list_start"
  example_instances "In this example let us look at the website http://www.example.com to get much information we can about Alice. From the website, we find that Alice also runs foobar.org. We type in www example.com into the prompt of the Name Lookup window in a tool, and our result is this IP address: 192.173.28.130 We type the domain into the Name Lookup prompt and we are given the same IP. We can safely say that example and foobar.org are hosted on the same box. But if we were to do a reverse name lookup on the IP, which domain will come up? www.example.com or foobar.org? Neither, the result is nijasvspirates.org. So nijasvspirates.org is the name of the box hosting 31337squirrel.org and foobar.org. So now that we have the IP, let's check to see if nijasvspirates is awake. We type the IP into the prompt in the Ping window. We'll set the interval between packets to 1 millisecond. We'll set the number of seconds to wait until a ping times out to 5. We'll set the ping size to 500 bytes and we'll send ten pings. Ten packets sent and ten packets received. nijasvspirates.org returned a message to my computer within an average of 0.35 seconds for every packet sent. nijasvspirates is alive. We open the Whois window and type nijasvspirates.org into the Query prompt, and whois.networksolutions.com into the Server prompt. This means we'll be asking Network Solutions to tell us everything they know about nijasvspirates.org. The result is this laundry list of info: Registrant: FooBar (nijasvspirates -DOM) p.o.box 11111 SLC, UT 84151 US Domain Name: nijasvspirates.ORG Administrative Contact, Billing Contact: Smith, John jsmith@anonymous.net FooBar p.o.box 11111 SLC, UT 84151 555-555-6103 Technical Contact: Johnson, Ken kj@fierymonkey.org fierymonkey p.o.box 11111 SLC, UT 84151 555-555-3849 Record last updated on 17-Aug-2001. Record expires on 11-Aug-2002. Record created on 11-Aug-2000. Database last updated on 12-Dec-2001 04:06:00 EST. Domain servers in listed order: NS1. fierymonkey.ORG 192.173.28.130 NS2. fierymonkey.ORG 64.192.168.80 A corner stone of footprinting is Port Scanning. Let's port scan nijasvspirates.org and see what kind of services are running on that box. We type in the nijasvspirates IP into the Host prompt of the Port Scan window. We'll start searching from port number 1, and we'll stop at the default Sub7 port, 27374. Our results are: 21 TCP ftp 22 TCP ssh SSH-1.99-OpenSSH_2.30 25 TCP smtp 53 TCP domain 80 TCP www 110 TCP pop3 111 TCP sunrpc 113 TCP ident Just by this we know that Alice is running a website and email, using POP3, SUNRPC (SUN Remote Procedure Call), and ident."
  related_weaknesses "_networkx_list_start"
  related_weaknesses "200"
  matched_cwes "_networkx_list_start"
  matched_cwes "200"
  taxonomy_mappings [
    taxonomy_name "ATTACK"
    entry_id "1217"
    entry_name "Browser Bookmark Discovery"
  ]
  taxonomy_mappings [
    taxonomy_name "ATTACK"
    entry_id "1592"
    entry_name "Gather Victim Host Information"
  ]
  taxonomy_mappings [
    taxonomy_name "ATTACK"
    entry_id "1595"
    entry_name "Active Scanning"
  ]
  execution_flow "_networkx_list_start"
  execution_flow [
    step "1"
    phase "Explore"
    description "[Request Footprinting] The attacker examines the website information and source code of the website and uses automated tools to get as much information as possible about the system and organization."
    techniques "Open Source Footprinting: Examine the website about the organization and skim through the webpage's HTML source to look for comments."
    techniques "Network Enumeration: Perform various queries (Registrar Query, Organizational Query, Domain Query, Network Query, POC Query) on the many whois databases found on the internet to identify domain names and associated networks."
    techniques "DNS Interrogation: Once basic information is gathered the attack could begin to query DNS."
    techniques "Other Techniques: Use ping sweep, TCP scan, UDP scan, OS Identification various techniques to gain more information about the system and network."
  ]
  node [
    id 0
    label "examine_the_website_information_and_source_code_of_the_website"
  ]
  node [
    id 1
    label "perform_various_queries_registrar_query_organizational_query_domain_query_network_query_poc_query_on_the_many_whois_databases_found_on_the_internet_to_identify_domain_names_and_associated_networks"
  ]
  node [
    id 2
    label "gather_the_necessary_information"
  ]
  node [
    id 3
    label "os_identification"
  ]
  node [
    id 4
    label "type_the_domain"
  ]
  node [
    id 5
    label "host_31337squirrel_org_and_foobar_org"
  ]
  node [
    id 6
    label "type_the_ip"
  ]
  node [
    id 7
    label "set_the_interval_between_packets"
  ]
  node [
    id 8
    label "set_the_number_of_seconds"
  ]
  node [
    id 9
    label "set_the_ping_size"
  ]
  node [
    id 10
    label "return_a_message"
  ]
  node [
    id 11
    label "open_the_whois_window"
  ]
  node [
    id 12
    label "type_ip_into_the_host_prompt_of_the_port_scan_window"
  ]
  node [
    id 13
    label "start_searching_from_port_number_1"
  ]
  node [
    id 14
    label "publicize_identifiable_information_about_the_system_or_application_through_voluntary_or_involuntary_means"
  ]
  node [
    id 15
    label "capture_traffic"
  ]
  node [
    id 16
    label "validate_that"
  ]
  node [
    id 17
    label "limit_the_useful_information_that_can_be_collected_during_a_footprinting_attack"
  ]
  edge [
    source 0
    target 0
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
]
