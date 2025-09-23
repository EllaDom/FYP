graph [
  directed 1
  capec_id "70"
  name "Try Common or Default Usernames and Passwords"
  abstraction "Detailed"
  status "Draft"
  description "An adversary may try certain common or default usernames and passwords to gain access into the system and perform unauthorized actions. An adversary may try an intelligent brute force using empty passwords, known vendor default credentials, as well as a dictionary of common usernames and passwords. Many vendor products come preconfigured with default (and thus well-known) usernames and passwords that should be deleted prior to usage in a production environment. It is a common mistake to forget to remove these default login credentials. Another problem is that users would pick very simple (common) passwords (e.g. &#34;secret&#34; or &#34;password&#34;) that make it easier for the attacker to gain access to the system compared to using a brute force attack or even a dictionary attack using a full dictionary."
  likelihood "Medium"
  severity "High"
  related_attack_patterns [
    capec_id "49"
    nature "ChildOf"
  ]
  related_attack_patterns [
    capec_id "600"
    nature "CanPrecede"
  ]
  related_attack_patterns [
    capec_id "151"
    nature "CanPrecede"
  ]
  related_attack_patterns [
    capec_id "560"
    nature "CanPrecede"
  ]
  related_attack_patterns [
    capec_id "561"
    nature "CanPrecede"
  ]
  related_attack_patterns [
    capec_id "653"
    nature "CanPrecede"
  ]
  prerequisites "_networkx_list_start"
  prerequisites "The system uses one factor password based authentication.The adversary has the means to interact with the system."
  skills_required "_networkx_list_start"
  skills_required [
    level "Low"
    description "An adversary just needs to gain access to common default usernames/passwords specific to the technologies used by the system. Additionally, a brute force attack leveraging common passwords can be easily realized if the user name is known."
  ]
  resources_required "_networkx_list_start"
  resources_required "Technology or vendor specific list of default usernames and passwords."
  consequences "_networkx_list_start"
  consequences [
    scope "Confidentiality"
    scope "Access Control"
    scope "Authorization"
    impact "Gain Privileges"
  ]
  mitigations "Delete all default account credentials that may be put in by the product vendor."
  mitigations "Implement a password throttling mechanism. This mechanism should take into account both the IP address and the log in name of the user."
  mitigations "Put together a strong password policy and make sure that all user created passwords comply with it. Alternatively automatically generate strong passwords for users."
  mitigations "Passwords need to be recycled to prevent aging, that is every once in a while a new password must be chosen."
  example_instances "A user sets their password to &#34;123&#34; or intentionally leaves their password blank. If the system does not have password strength enforcement against a sound password policy, this password may be admitted. Passwords like these two examples are two simple and common passwords that are easily able to be guessed by the adversary."
  example_instances "Cisco 2700 Series Wireless Location Appliances (version 2.1.34.0 and earlier) have a default administrator username &#34;root&#34; with a password &#34;password&#34;. This allows remote attackers to easily obtain administrative privileges. See also: CVE-2006-5288"
  example_instances "In April 2019, adversaries attacked several popular IoT devices (a VOIP phone, an office printer, and a video decoder) across multiple customer locations. An investigation conducted by the Microsoft Security Resposne Center (MSRC) discovered that these devices were used to gain initial access to corporate networks. In two of the cases, the passwords for the devices were deployed without changing the default manufacturer&#8217;s passwords and in the third instance the latest security update had not been applied to the device. [REF-572]"
  related_weaknesses "521"
  related_weaknesses "262"
  related_weaknesses "263"
  related_weaknesses "798"
  related_weaknesses "654"
  related_weaknesses "308"
  related_weaknesses "309"
  matched_cwes "521"
  matched_cwes "798"
  taxonomy_mappings "_networkx_list_start"
  taxonomy_mappings [
    taxonomy_name "ATTACK"
    entry_id "1078.001"
    entry_name "Valid Accounts:Default Accounts"
  ]
  execution_flow "[]"
  node [
    id 0
    label "choose_their_own_passwords"
  ]
  node [
    id 1
    label "admit_if_the_system_does_not_have_password_strength_enforcement_against_a_sound_password_policy"
  ]
  node [
    id 2
    label "have_a_default_administrator_username_root_with_a_password_password"
  ]
  node [
    id 3
    label "attack_several_popular_iot_devices_a_voip_phone_an_office_printer_and_a_video_decoder_across_multiple_customer_locations"
  ]
  node [
    id 4
    label "deploy_the_passwords_for_the_devices"
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
]
