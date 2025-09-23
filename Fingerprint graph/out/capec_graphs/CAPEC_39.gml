graph [
  directed 1
  capec_id "39"
  name "Manipulating Opaque Client-based Data Tokens"
  abstraction "Standard"
  status "Draft"
  description "In circumstances where an application holds important data client-side in tokens (cookies, URLs, data files, and so forth) that data can be manipulated. If client or server-side application components reinterpret that data as authentication tokens or data (such as store item pricing or wallet information) then even opaquely manipulating that data may bear fruit for an Attacker. In this pattern an attacker undermines the assumption that client side tokens have been adequately protected from tampering through use of encryption or obfuscation."
  likelihood "High"
  severity "Medium"
  related_attack_patterns "_networkx_list_start"
  related_attack_patterns [
    capec_id "22"
    nature "ChildOf"
  ]
  prerequisites "An attacker already has some access to the system or can steal the client based data tokens from another user who has access to the system."
  prerequisites "For an Attacker to viably execute this attack, some data (later interpreted by the application) must be held client-side in a way that can be manipulated without detection. This means that the data or tokens are not CRCd as part of their value or through a separate meta-data store elsewhere."
  skills_required [
    level "Medium"
    description "If the client site token is obfuscated."
  ]
  skills_required [
    level "High"
    description "If the client site token is encrypted."
  ]
  resources_required "_networkx_list_start"
  resources_required "The Attacker needs no special hardware-based resources in order to conduct this attack. Software plugins, such as Tamper Data for Firefox, may help in manipulating URL- or cookie-based data."
  consequences [
    scope "_networkx_list_start"
    scope "Integrity"
    impact "Modify Data"
  ]
  consequences [
    scope "Confidentiality"
    scope "Access Control"
    scope "Authorization"
    impact "Gain Privileges"
  ]
  mitigations "One solution to this problem is to protect encrypted data with a CRC of some sort. If knowing who last manipulated the data is important, then using a cryptographic &#34;message authentication code&#34; (or hMAC) is prescribed. However, this guidance is not a panacea. In particular, any value created by (and therefore encrypted by) the client, which itself is a &#34;malicious&#34; value, all the protective cryptography in the world can't make the value 'correct' again. Put simply, if the client has control over the whole process of generating and encoding the value, then simply protecting its integrity doesn't help."
  mitigations "Make sure to protect client side authentication tokens for confidentiality (encryption) and integrity (signed hash)"
  mitigations "Make sure that all session tokens use a good source of randomness"
  mitigations "Perform validation on the server side to make sure that client side data tokens are consistent with what is expected."
  example_instances "With certain price watching websites, that aggregate products available prices, the user can buy items through whichever vendors has product availability, the best price, or other differentiator. Once a user selects an item, the site must broker the purchase of that item with the vendor. Because vendors sell the same product through different channel partners at different prices, token exchange between price watching sites and selling vendors will often contain pricing information. With some price watching sites, manipulating URL-data (which is encrypted) even opaquely yields different prices charged by the fulfilling vendor. If the manipulated price turns out higher, the Attacker can cancel purchase. If the Attacker succeeded in manipulating the token and creating a lower price, they proceed."
  example_instances "Upon successful authentication user is granted an encrypted authentication cookie by the server and it is stored on the client. One piece of information stored in the authentication cookie reflects the access level of the user (e.g. &#34;u&#34; for user). The authentication cookie is encrypted using the Electronic Code Book (ECB) mode, that naively encrypts each of the plaintext blocks to each of the ciphertext blocks separately. An attacker knows the structure of the cookie and can figure out what bits (encrypted) store the information relating to the access level of the user. An attacker modifies the authentication cookie and effectively substitutes &#34;u&#34; for &#34;a&#34; by flipping some of the corresponding bits of ciphertext (trial and error). Once the correct &#34;flip&#34; is found, when the system is accessed, the attacker is granted administrative privileges in the system. Note that in this case an attacker did not have to figure out the exact encryption algorithm or find the secret key, but merely exploit the weakness inherent in using the ECB encryption mode."
  example_instances "Archangel Weblog 0.90.02 allows remote attackers to bypass authentication by setting the ba_admin cookie to 1. See also: CVE-2006-0944"
  related_weaknesses "353"
  related_weaknesses "285"
  related_weaknesses "302"
  related_weaknesses "472"
  related_weaknesses "565"
  related_weaknesses "315"
  related_weaknesses "539"
  related_weaknesses "384"
  related_weaknesses "233"
  matched_cwes "285"
  matched_cwes "384"
  taxonomy_mappings "[]"
  execution_flow [
    step "1"
    phase "Explore"
    description "[Enumerate information passed to client side] The attacker identifies the parameters used as part of tokens to take business or security decisions"
    techniques "Use WebScarab to reveal hidden fields while browsing."
    techniques "Use a sniffer to capture packets"
    techniques "View source of web page to find hidden fields"
    techniques "Examine URL to see if any opaque tokens are in it"
    techniques "Disassemble or decompile client-side application"
    techniques "Use debugging tools such as File Monitor, Registry Monitor, Debuggers, etc."
  ]
  execution_flow [
    step "2"
    phase "Explore"
    description "[Determine protection mechanism for opaque token] The attacker determines the protection mechanism used to protect the confidentiality and integrity of these data tokens. They may be obfuscated or a full blown encryption may be used."
    techniques "Look for signs of well-known character encodings"
    techniques "Look for cryptographic signatures"
    techniques "Look for delimiters or other indicators of structure"
  ]
  execution_flow [
    step "3"
    phase "Experiment"
    description "[Modify parameter/token values] Trying each parameter in turn, the attacker modifies the values"
    techniques "Modify tokens logically"
    techniques "Modify tokens arithmetically"
    techniques "Modify tokens bitwise"
    techniques "Modify structural components of tokens"
    techniques "Modify order of parameters/tokens"
  ]
  execution_flow [
    step "4"
    phase "Experiment"
    description "[Cycle through values for each parameter.] Depending on the nature of the application, the attacker now cycles through values of each parameter and observes the effects of this modification in the data returned by the server"
    techniques "Use network-level packet injection tools such as netcat"
    techniques "Use application-level data modification tools such as Tamper Data, WebScarab, TamperIE, etc."
    techniques "Use modified client (modified by reverse engineering)"
    techniques "Use debugging tools to modify data in client"
  ]
  node [
    id 0
    label "identify_the_parameters_used_as_part_of_tokens_to_take_business_or_security_decisions"
  ]
  node [
    id 1
    label "find_hidden_fields"
  ]
  node [
    id 2
    label "capture_packets"
  ]
  node [
    id 3
    label "determine_protection_mechanism_for_opaque_token"
  ]
  node [
    id 4
    label "determine_the_protection_mechanism_used_to_protect_the_confidentiality_and_integrity_of_these_data_tokens"
  ]
  node [
    id 5
    label "obfuscate_they"
  ]
  node [
    id 6
    label "try_each_parameter"
  ]
  node [
    id 7
    label "modify_structural_components_of_tokens"
  ]
  node [
    id 8
    label "modify_order_of_parameters_tokens"
  ]
  node [
    id 9
    label "inject_command_delimiters_using_network_packet_injection_tools_netcat_nemesis_etc"
  ]
  node [
    id 10
    label "watch_websites"
  ]
  node [
    id 11
    label "select_an_item"
  ]
  node [
    id 12
    label "sell_the_same_product"
  ]
  node [
    id 13
    label "grant_an_encrypted_authentication_cookie_by_the_server"
  ]
  node [
    id 14
    label "know_the_structure_of_the_cookie"
  ]
  node [
    id 15
    label "replace_cookie"
  ]
  node [
    id 16
    label "find_the_correct_flip"
  ]
  node [
    id 17
    label "allow_remote_attackers"
  ]
  node [
    id 18
    label "steal_the_client"
  ]
  node [
    id 19
    label "execute_this_type_of_attack"
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
    source 10
    target 13
  ]
  edge [
    source 11
    target 12
  ]
  edge [
    source 12
    target 10
  ]
  edge [
    source 13
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
