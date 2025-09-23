graph [
  directed 1
  capec_id "660"
  name "Root/Jailbreak Detection Evasion via Hooking"
  abstraction "Detailed"
  status "Stable"
  description "An adversary forces a non-restricted mobile application to load arbitrary code or code files, via Hooking, with the goal of evading Root/Jailbreak detection. Mobile device users often Root/Jailbreak their devices in order to gain administrative control over the mobile operating system and/or to install third-party mobile applications that are not provided by authorized application stores (e.g. Google Play Store and Apple App Store). Adversaries may further leverage these capabilities to escalate privileges or bypass access control on legitimate applications. Although many mobile applications check if a mobile device is Rooted/Jailbroken prior to authorized use of the application, adversaries may be able to &#34;hook&#34; code in order to circumvent these checks. Successfully evading Root/Jailbreak detection allows an adversary to execute administrative commands, obtain confidential data, impersonate legitimate users of the application, and more."
  likelihood "Medium"
  severity "Very High"
  related_attack_patterns "_networkx_list_start"
  related_attack_patterns [
    capec_id "251"
    nature "ChildOf"
  ]
  prerequisites "_networkx_list_start"
  prerequisites "The targeted application must be non-restricted to allow code hooking."
  skills_required [
    level "High"
    description "Knowledge about Root/Jailbreak detection and evasion techniques."
  ]
  skills_required [
    level "Medium"
    description "Knowledge about code hooking."
  ]
  resources_required "The adversary must have a Rooted/Jailbroken mobile device."
  resources_required "The adversary needs to have enough access to the target application to control the included code or file."
  consequences [
    scope "Integrity"
    scope "Authorization"
    impact "Execute Unauthorized Commands"
  ]
  consequences [
    scope "Confidentiality"
    scope "Access Control"
    scope "Authorization"
    impact "Gain Privileges"
  ]
  consequences [
    scope "Confidentiality"
    scope "Access Control"
    impact "Read Data"
  ]
  mitigations "Ensure mobile applications are signed appropriately to avoid code inclusion via hooking."
  mitigations "Inspect the application's memory for suspicious artifacts, such as shared objects/JARs or dylibs, after other Root/Jailbreak detection methods."
  mitigations "Inspect the application's stack trace for suspicious method calls."
  mitigations "Allow legitimate native methods, and check for non-allowed native methods during Root/Jailbreak detection methods."
  mitigations "For iOS applications, ensure application methods do not originate from outside of Apple's SDK."
  example_instances "An adversary targets a non-restricted iOS banking application in an attempt to compromise sensitive user data. The adversary creates Objective-C runtime code that always returns &#34;false&#34; when checking for the existence of the Cydia application. The malicious code is then dynamically loaded into the application via the DYLD_INSERT_LIBRARIES environment variable. When the banking applications checks for Cydia, the hooked code returns &#34;false&#34;, so the application assumes the device is stock (i.e. not Jailbroken) and allows it to access the application. However, the adversary has just evaded Jailbreak detection and is now able to glean user credentials and/or transaction details."
  example_instances "An adversary targets a mobile voting application on an Android device with the goal of committing voter fraud. Leveraging the Xposed framework, the adversary is able to create and hook Java code into the application that bypasses Root detection methods. When the voting application attempts to detect a Rooted device by checking for commonly known installed packages associated with Rooting, the hooked code removes the suspicious packages before returning to the application. As a result, the application believes the device is stock (i.e. not Rooted) when in actuality this is not the case. Having evading Root detection, the adversary is now able to cast votes for the candidate of their choosing as a variety of different users."
  related_weaknesses "_networkx_list_start"
  related_weaknesses "829"
  matched_cwes "_networkx_list_start"
  matched_cwes "829"
  taxonomy_mappings "_networkx_list_start"
  taxonomy_mappings [
    taxonomy_name "ATTACK"
    entry_id "1055"
    entry_name "Process Injection"
  ]
  execution_flow [
    step "1"
    phase "Explore"
    description "[Identify application with attack potential] The adversary searches for and identifies a mobile application that could be exploited for malicious purposes (e.g. banking, voting, or medical applications)."
    techniques "_networkx_list_start"
    techniques "Search application stores for mobile applications worth exploiting"
  ]
  execution_flow [
    step "2"
    phase "Experiment"
    description "[Develop code to be hooked into chosen target application] The adversary develops code or leverages existing code that will be hooked into the target application in order to evade Root/Jailbreak detection methods."
    techniques "Develop code or leverage existing code to bypass Root/Jailbreak detection methods."
    techniques "Test the code to see if it works."
    techniques "Iteratively develop the code until Root/Jailbreak detection methods are evaded."
  ]
  execution_flow [
    step "3"
    phase "Exploit"
    description "[Execute code hooking to evade Root/Jailbreak detection methods] Once hooking code has been developed or obtained, execute the code against the target application to evade Root/Jailbreak detection methods."
    techniques "_networkx_list_start"
    techniques "Hook code into the target application."
  ]
  node [
    id 0
    label "identify_application_with_attack_potential"
  ]
  node [
    id 1
    label "develop_code"
  ]
  node [
    id 2
    label "develop_code_or_leverage_existing_code"
  ]
  node [
    id 3
    label "test_the_code"
  ]
  node [
    id 4
    label "evade_root_jailbreak_detection_methods"
  ]
  node [
    id 5
    label "target_a_non_restricted_ios_banking_application"
  ]
  node [
    id 6
    label "create_objective_c_runtime_code_that_always_returns_false_when_checking_for_the_existence_of_the_cydia_application"
  ]
  node [
    id 7
    label "place_the_malicious_file"
  ]
  node [
    id 8
    label "target_a_mobile_voting_application_on_an_android_device_with_the_goal_of_committing_voter_fraud"
  ]
  node [
    id 9
    label "leverage_the_xposed_framework"
  ]
  node [
    id 10
    label "attempt_to_detect_a_rooted_device_by_checking_for_commonly_known_installed_packages_associated_with_rooting"
  ]
  node [
    id 11
    label "evade_root_detection"
  ]
  edge [
    source 0
    target 1
  ]
  edge [
    source 1
    target 1
  ]
  edge [
    source 1
    target 2
  ]
  edge [
    source 1
    target 4
  ]
  edge [
    source 2
    target 3
  ]
  edge [
    source 3
    target 1
  ]
  edge [
    source 4
    target 5
  ]
  edge [
    source 4
    target 8
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
    target 4
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
]
