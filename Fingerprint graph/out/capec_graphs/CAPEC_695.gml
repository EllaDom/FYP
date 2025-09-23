graph [
  directed 1
  capec_id "695"
  name "Repo Jacking"
  abstraction "Detailed"
  status "Stable"
  description "&#10;            "
  likelihood "Medium"
  severity "High"
  related_attack_patterns "_networkx_list_start"
  related_attack_patterns [
    capec_id "616"
    nature "ChildOf"
  ]
  prerequisites "Identification of a popular repository that may be directly referenced in numerous software applications"
  prerequisites "A repository owner/maintainer who has recently changed their username or deleted their account"
  skills_required [
    level "Low"
    description "Ability to create an account on a VCS hosting site and recreate an existing directory structure."
  ]
  skills_required [
    level "Low"
    description "Ability to create malware that can exploit various software applications."
  ]
  resources_required "[]"
  consequences [
    scope "_networkx_list_start"
    scope "Integrity"
    impact "Read Data"
  ]
  consequences [
    scope "Access Control"
    scope "Authorization"
    impact "Execute Unauthorized Commands"
  ]
  mitigations "Leverage dedicated package managers instead of directly linking to VCS repositories."
  mitigations "Utilize version pinning and lock files to prevent use of maliciously modified repositories."
  mitigations "Implement &#34;vendoring&#34; (i.e., including third-party dependencies locally) and leverage automated testing techniques (e.g., static analysis) to determine if the software behaves maliciously."
  mitigations "Leverage automated tools, such as Checkmarx's &#34;ChainJacking&#34; tool, to determine susceptibility to Repo Jacking attacks."
  example_instances "In May 2022, the CTX Python package and PhPass PHP package were both exploited by the same adversary via Repo Jacking attacks. For the CTX package, the adversary performed an account takeover via a password reset, due to an expired domain-hosting email. The attack on PhPass entailed bypassing GitHub's authentication for retired repositories. In both cases, sensitive data in the form of API keys and passwords, each stored in the form of environment variables, were exfiltrated. [REF-732] [REF-733]"
  example_instances "In October 2021, the popular JavaScript library UAParser.js was exploited via the takeover of the author's Node Package Manager (NPM) account. The adversary-provided malware downloaded and executed binaries from a remote server to conduct crypto-mining and to exfiltrate sensitive data on Windows systems. This was a wide-scale attack as the package receives 8 to 9 million downloads per week. [REF-732]"
  related_weaknesses "494"
  related_weaknesses "829"
  matched_cwes "494"
  matched_cwes "829"
  taxonomy_mappings "_networkx_list_start"
  taxonomy_mappings [
    taxonomy_name "ATTACK"
    entry_id "1195.001"
    entry_name "Supply Chain Compromise: Compromise Software Dependencies and Development Tools"
  ]
  execution_flow [
    step "1"
    phase "Explore"
    description "[Identify target] The adversary must first identify a target repository that is commonly used and whose owner/maintainer has either changed/deleted their username or transferred ownership of the repository and then deleted their account. The target should typically be a popular and widely used package, as to increase the scope of the attack."
    techniques "[]"
  ]
  execution_flow [
    step "2"
    phase "Experiment"
    description "[Recreate initial repository path] The adversary re-registers the account that was renamed/deleted by the target repository's owner/maintainer and recreates the target repository with malicious code intended to exploit an application. These steps may need to happen in reverse (i.e., recreate repository and then rename an existing account to the target account) if protections are in place to prevent repository reuse."
    techniques "[]"
  ]
  execution_flow [
    step "3"
    phase "Exploit"
    description "[Exploit victims] The adversary's malicious code is incorporated into applications that directly reference the initial repository, which further allows the adversary to conduct additional attacks."
    techniques "[]"
  ]
  node [
    id 0
    label "identify_a_target_repository_for_them"
  ]
  node [
    id 1
    label "increase_the_scope_of_the_attack"
  ]
  node [
    id 2
    label "register_the_account_that_was_renamed"
  ]
  node [
    id 3
    label "need_to_happen_in_reverse"
  ]
  node [
    id 4
    label "prevent_repository_reuse"
  ]
  node [
    id 5
    label "incorporate_the_malicious_software"
  ]
  node [
    id 6
    label "exploit_the_ctx_python_package_and_phpass_php_package"
  ]
  node [
    id 7
    label "perform_an_account_takeover"
  ]
  node [
    id 8
    label "entail_bypassing_github_s_authentication_for_retired_repositories"
  ]
  node [
    id 9
    label "exploit_uaparser_js"
  ]
  node [
    id 10
    label "receive_8_to_9_million_downloads_per_week"
  ]
  node [
    id 11
    label "reference_that"
  ]
  node [
    id 12
    label "change_their_username"
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
