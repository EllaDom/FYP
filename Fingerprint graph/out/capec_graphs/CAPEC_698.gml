graph [
  directed 1
  capec_id "698"
  name "Install Malicious Extension"
  abstraction "Detailed"
  status "Stable"
  description "&#10;            "
  likelihood "Medium"
  severity "High"
  related_attack_patterns "_networkx_list_start"
  related_attack_patterns [
    capec_id "542"
    nature "ChildOf"
  ]
  prerequisites "The adversary must craft malware based on the type of software and system(s) they intend to exploit."
  prerequisites "If the adversary intends to install the malicious extension themself, they must first compromise the target machine via some other means."
  skills_required [
    level "Medium"
    description "Ability to create malicious extensions that can exploit specific software applications and systems."
  ]
  skills_required [
    level "Medium"
    description "Optional: Ability to exploit target system(s) via other means in order to gain entry."
  ]
  resources_required "[]"
  consequences [
    scope "Confidentiality"
    scope "Access Control"
    impact "Read Data"
  ]
  consequences [
    scope "Integrity"
    scope "Access Control"
    impact "Modify Data"
  ]
  consequences [
    scope "Authorization"
    scope "Access Control"
    impact "Execute Unauthorized Commands"
  ]
  mitigations "Only install extensions/plugins from official/verifiable sources."
  mitigations "Confirm extensions/plugins are legitimate and not malware masquerading as a legitimate extension/plugin."
  mitigations "Ensure the underlying software leveraging the extension/plugin (including operating systems) is up-to-date."
  mitigations "Implement an extension/plugin allow list, based on the given security policy."
  mitigations "If applicable, confirm extensions/plugins are properly signed by the official developers."
  mitigations "For web browsers, close sessions when finished to prevent malicious extensions/plugins from executing the the background."
  example_instances "In January 2018, Palo Alto's Unit 42 reported that a malicious Internet Information Services (IIS) extension they named RGDoor was used to create a backdoor into several Middle Eastern government organizations, as well as a financial institution and an educational institution. This malware was used in conjunction with the TwoFace webshell and allowed the adversaries to upload/download files and execute unauthorized commands. [REF-740]"
  example_instances "In December 2018, it was reported that North Korea-based APT Kimusky (also known as Velvet Chollima) infected numerous legitimate academic organizations within the U.S., many specializing in biomedical engineering, with a malicious Google Chrome extension. Dubbed &#34;Operation STOLEN PENCIL&#34;, the attack entailed conducting spear-phishing attacks to trick victims into installing a malicious PDF reader named &#34;Auto Font Manager&#34;. Once installed, the malware allowed adversaries to steal cookies and site passwords, as well as forward emails from some compromised accounts. [REF-741]"
  related_weaknesses "507"
  related_weaknesses "829"
  matched_cwes "_networkx_list_start"
  matched_cwes "829"
  taxonomy_mappings [
    taxonomy_name "ATTACK"
    entry_id "1176"
    entry_name "Browser Extensions"
  ]
  taxonomy_mappings [
    taxonomy_name "ATTACK"
    entry_id "1505.004"
    entry_name "Server Software Component: IIS Components"
  ]
  execution_flow [
    step "1"
    phase "Explore"
    description "[Identify target(s)] The adversary must first identify target software that allows for extensions/plugins and which they wish to exploit, such as a web browser or desktop application. To increase the attack space, this will often be popular software with a large user-base."
    techniques "[]"
  ]
  execution_flow [
    step "2"
    phase "Experiment"
    description "[Create malicious extension] Having identified a suitable target, the adversary crafts a malicious extension/plugin that can be installed by the underlying target software. This malware may be targeted to execute on specific operating systems or be operating system agnostic."
    techniques "[]"
  ]
  execution_flow [
    step "3"
    phase "Exploit"
    description "[Install malicious extension] The malicious extension/plugin is installed by the underlying target software and executes the adversary-created malware, resulting in a variety of negative technical impacts."
    techniques "Adversary-Installed: Having already compromised the target system, the adversary simply installs the malicious extension/plugin themself."
    techniques "User-Installed: The adversary tricks the user into installing the malicious extension/plugin, via means such as social engineering, or may upload the malware on a reputable extension/plugin hosting site and wait for unknowing victims to install the malicious component."
  ]
  node [
    id 0
    label "identify_target_software_that_allows_for_extensions_plugins_and_they_wish_which_to_exploit_such_as_a_web_browser_or_desktop_application"
  ]
  node [
    id 1
    label "increase_the_attack_space"
  ]
  node [
    id 2
    label "create_malicious_extension"
  ]
  node [
    id 3
    label "target_this_malware"
  ]
  node [
    id 4
    label "report_it"
  ]
  node [
    id 5
    label "dub_operation_stolen_pencil"
  ]
  node [
    id 6
    label "craft_malware"
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
    target 2
  ]
]
