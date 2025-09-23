graph [
  directed 1
  capec_id "459"
  name "Creating a Rogue Certification Authority Certificate"
  abstraction "Detailed"
  status "Draft"
  description "An adversary exploits a weakness resulting from using a hashing algorithm with weak collision resistance to generate certificate signing requests (CSR) that contain collision blocks in their &#34;to be signed&#34; parts. The adversary submits one CSR to be signed by a trusted certificate authority then uses the signed blob to make a second certificate appear signed by said certificate authority. Due to the hash collision, both certificates, though different, hash to the same value and so the signed blob works just as well in the second certificate. The net effect is that the adversary's second X.509 certificate, which the Certification Authority has never seen, is now signed and validated by that Certification Authority."
  likelihood "Medium"
  severity "Very High"
  related_attack_patterns "_networkx_list_start"
  related_attack_patterns [
    capec_id "473"
    nature "ChildOf"
  ]
  prerequisites "_networkx_list_start"
  prerequisites "Certification Authority is using a hash function with insufficient collision resistance to generate the certificate hash to be signed"
  skills_required [
    level "High"
    description "Understanding of how to force a hash collision in X.509 certificates"
  ]
  skills_required [
    level "High"
    description "An attacker must be able to craft two X.509 certificates that produce the same hash value"
  ]
  skills_required [
    level "Medium"
    description "Knowledge needed to set up a certification authority"
  ]
  resources_required "Knowledge of a certificate authority that uses hashing algorithms with poor collision resistance"
  resources_required "A valid certificate request and a malicious certificate request with identical hash values"
  consequences "_networkx_list_start"
  consequences [
    scope "Access Control"
    scope "Authentication"
    impact "Gain Privileges"
  ]
  mitigations "_networkx_list_start"
  mitigations "Certification Authorities need to stop using deprecated or cryptographically insecure hashing algorithms to hash the certificates that they are about to sign. Instead they should be using stronger hashing functions such as SHA-256 or SHA-512."
  example_instances "MD5 Collisions The MD5 algorithm is not collision resistant, allowing attackers to use spoofing attacks to create rogue certificate Authorities. See also: CVE-2004-2761"
  example_instances "SHA1 Collisions The SHA1 algorithm is not collision resistant, allowing attackers to use spoofing attacks to create rogue certificate Authorities. See also: CVE-2005-4900"
  example_instances "PKI Infrastructure vulnerabilities Research has show significant vulnerabilities in PKI infrastructure. Trusted certificate authorities have been shown to use weak hashing algorithms after attacks have been demonstrated against those algorithms. Additionally, reliable methods have been demonstrated for generated MD5 collisions that could be used to generate malicious CSRs."
  related_weaknesses "327"
  related_weaknesses "295"
  related_weaknesses "290"
  matched_cwes "295"
  matched_cwes "327"
  matched_cwes "290"
  taxonomy_mappings "[]"
  execution_flow [
    step "1"
    phase "Experiment"
    description "[Craft Certificates] The adversary crafts two different, but valid X.509 certificates that when hashed with an insufficiently collision resistant hashing algorithm would yield the same value."
    techniques "[]"
  ]
  execution_flow [
    step "2"
    phase "Experiment"
    description "[Send CSR to Certificate Authority] The adversary sends the CSR for one of the certificates to the Certification Authority which uses the targeted hashing algorithm. That request is completely valid and the Certificate Authority issues an X.509 certificate to the adversary which is signed with its private key."
    techniques "[]"
  ]
  execution_flow [
    step "3"
    phase "Exploit"
    description "[Insert Signed Blob into Unsigned Certificate] The adversary takes the signed blob and inserts it into the second X.509 certificate that the attacker generated. Due to the hash collision, both certificates, though different, hash to the same value and so the signed blob is valid in the second certificate. The result is two certificates that appear to be signed by a valid certificate authority despite only one having been signed."
    techniques "[]"
  ]
  node [
    id 0
    label "send_csr"
  ]
  node [
    id 1
    label "issue_an_x_509_certificate_to_the_adversary_which_is_signed_with_its_private_key"
  ]
  node [
    id 2
    label "sign_blob"
  ]
  node [
    id 3
    label "appear_to_be_signed_by_a_valid_certificate_authority_despite_only_one_having_been_signed"
  ]
  node [
    id 4
    label "show_significant_vulnerabilities_in_pki_infrastructure"
  ]
  node [
    id 5
    label "demonstrate_reliable_methods"
  ]
  node [
    id 6
    label "generate_the_certificate_hash"
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
