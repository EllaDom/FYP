graph [
  directed 1
  capec_id "73"
  name "User-Controlled Filename"
  abstraction "Standard"
  status "Draft"
  description "An attack of this type involves an adversary inserting malicious characters (such as a XSS redirection) into a filename, directly or indirectly that is then used by the target software to generate HTML text or other potentially executable content. Many websites rely on user-generated content and dynamically build resources like files, filenames, and URL links directly from user supplied data. In this attack pattern, the attacker uploads code that can execute in the client browser and/or redirect the client browser to a site that the attacker owns. All XSS attack payload variants can be used to pass and exploit these vulnerabilities."
  likelihood "High"
  severity "High"
  related_attack_patterns [
    capec_id "165"
    nature "ChildOf"
  ]
  related_attack_patterns [
    capec_id "592"
    nature "CanPrecede"
  ]
  prerequisites "_networkx_list_start"
  prerequisites "The victim must trust the name and locale of user controlled filenames."
  skills_required [
    level "Low"
    description "To achieve a redirection and use of less trusted source, an attacker can simply edit data that the host uses to build the filename"
  ]
  skills_required [
    level "Medium"
    description "Deploying a malicious &#34;look-a-like&#34; site (such as a site masquerading as a bank or online auction site) that the user enters their authentication data into."
  ]
  skills_required [
    level "High"
    description "Exploiting a client side vulnerability to inject malicious scripts into the browser's executable process."
  ]
  resources_required "[]"
  consequences [
    scope "Confidentiality"
    scope "Access Control"
    scope "Authorization"
    impact "Gain Privileges"
  ]
  consequences [
    scope "Confidentiality"
    scope "Integrity"
    scope "Availability"
    impact "Execute Unauthorized Commands"
  ]
  consequences [
    scope "_networkx_list_start"
    scope "Availability"
    impact "Alter Execution Logic"
  ]
  consequences [
    scope "_networkx_list_start"
    scope "Confidentiality"
    impact "Read Data"
  ]
  mitigations "Design: Use browser technologies that do not allow client side scripting."
  mitigations "Implementation: Ensure all content that is delivered to client is sanitized against an acceptable content specification."
  mitigations "Implementation: Perform input validation for all remote content."
  mitigations "Implementation: Perform output validation for all remote content."
  mitigations "Implementation: Disable scripting languages such as JavaScript in browser"
  mitigations "Implementation: Scan dynamically generated content against validation specification"
  example_instances "_networkx_list_start"
  example_instances "Phishing attacks rely on a user clicking on links on that are supplied to them by attackers masquerading as a trusted resource such as a bank or online auction site. The end user's email client hosts the supplied resource name in this case via email. The resource name, however may either 1) direct the client browser to a malicious site to steal credentials and/or 2) execute code on the client machine to probe the victim's host system and network environment."
  related_weaknesses "20"
  related_weaknesses "184"
  related_weaknesses "96"
  related_weaknesses "348"
  related_weaknesses "116"
  related_weaknesses "350"
  related_weaknesses "86"
  related_weaknesses "697"
  matched_cwes "20"
  matched_cwes "116"
  taxonomy_mappings "[]"
  execution_flow "[]"
  node [
    id 0
    label "rely_are_supplied_to_them_by_attackers_masquerading_as_a_trusted_resource_such_as_a_bank_or_online_auction_site"
  ]
  node [
    id 1
    label "direct_the_client_browser"
  ]
  node [
    id 2
    label "trust_the_name_and_locale_of_user_controlled_filenames"
  ]
  edge [
    source 0
    target 1
  ]
  edge [
    source 1
    target 2
  ]
]
