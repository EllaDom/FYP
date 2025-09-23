graph [
  directed 1
  capec_id "50"
  name "Password Recovery Exploitation"
  abstraction "Standard"
  status "Draft"
  description "An attacker may take advantage of the application feature to help users recover their forgotten passwords in order to gain access into the system with the same privileges as the original user. Generally password recovery schemes tend to be weak and insecure."
  likelihood "Medium"
  severity "High"
  related_attack_patterns [
    capec_id "212"
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
  prerequisites "The system allows users to recover their passwords and gain access back into the system."
  prerequisites "Password recovery mechanism has been designed or implemented insecurely."
  prerequisites "Password recovery mechanism relies only on something the user knows and not something the user has."
  prerequisites "No third party intervention is required to use the password recovery mechanism."
  skills_required [
    level "Low"
    description "Brute force attack"
  ]
  skills_required [
    level "Medium"
    description "Social engineering and more sophisticated technical attacks."
  ]
  resources_required "_networkx_list_start"
  resources_required "For a brute force attack one would need a machine with sufficient CPU, RAM and HD."
  consequences "_networkx_list_start"
  consequences [
    scope "Confidentiality"
    scope "Access Control"
    scope "Authorization"
    impact "Gain Privileges"
  ]
  mitigations "Use multiple security questions (e.g. have three and make the user answer two of them correctly). Let the user select their own security questions or provide them with choices of questions that are not generic."
  mitigations "E-mail the temporary password to the registered e-mail address of the user rather than letting the user reset the password online."
  mitigations "Ensure that your password recovery functionality is not vulnerable to an injection style attack."
  example_instances "An attacker clicks on the &#34;forgot password&#34; and is presented with a single security question. The question is regarding the name of the first dog of the user. The system does not limit the number of attempts to provide the dog's name. An attacker goes through a list of 100 most popular dog names and finds the right name, thus getting the ability to reset the password and access the system."
  example_instances "phpBanner Exchange is a PHP script (using the mySQL database) that facilitates the running of a banner exchange without extensive knowledge of PHP or mySQL. A SQL injection was discovered in the password recovery module of the system that allows recovering an arbitrary user's password and taking over their account. The problem is due to faulty input sanitization in the phpBannerExchange, specifically the e-mail address of the user which is requested by the password recovery module. The e-mail address requested by the password recovery module on the resetpw.php page. That e-mail address is validated with the following regular expression: if(!eregi(&#34;^[_a-z0-9-]+(\.[_a-z0-9-]+)*@[a-z0-9-]+(\.[a-z0-9-]+)* (\.[a-z]{2,3})$&#34;, $email)){ A bug in the implementation of eregi() allows to pass additional character using a null byte &#34;\0&#34;. Since eregi() is implemented in C, the variable $email is treated as a zero-terminated string. All characters following the Null Byte will not be recognized by the regular expression. So an e-mail address can be provided that includes the special character &#34; ' &#34; to break the SQL query below (and it will not be rejected by the regular expression because of the null byte trick). So a SQL injection becomes possible: $get_info=mysql_query(&#34;select * from banneruser where email='$email' &#34;); This query will return a non-zero result set even though the email supplied (attacker's email) is not in the database. Then a new password for the user is generated and sent to the $email address, an e-mail address controlled by the attacker. An attacker can then log in into the system. See also: CVE-2006-3013"
  related_weaknesses "522"
  related_weaknesses "640"
  matched_cwes "640"
  matched_cwes "522"
  taxonomy_mappings "[]"
  execution_flow [
    step "1"
    phase "Explore"
    description "Understand the password recovery mechanism and how it works."
    techniques "[]"
  ]
  execution_flow [
    step "2"
    phase "Exploit"
    description "Find a weakness in the password recovery mechanism and exploit it. For instance, a weakness may be that a standard single security question is used with an easy to determine answer."
    techniques "[]"
  ]
  node [
    id 0
    label "understand_the_password_recovery_mechanism_and_how_it_works"
  ]
  node [
    id 1
    label "determine_answer"
  ]
  node [
    id 2
    label "regard_the_name_of_the_first_dog_of_the_user"
  ]
  node [
    id 3
    label "limit_the_number_of_attempts_to_provide_the_dog_s_name"
  ]
  node [
    id 4
    label "facilitate_the_running_of_a_banner_exchange"
  ]
  node [
    id 5
    label "discover_a_sql_injection"
  ]
  node [
    id 6
    label "request_which"
  ]
  node [
    id 7
    label "validate_that_e_mail_address_a_z_2_3_email"
  ]
  node [
    id 8
    label "allow_to_pass_additional_character_using_a_null_byte_0"
  ]
  node [
    id 9
    label "implement_eregi"
  ]
  node [
    id 10
    label "append_a_null_byte"
  ]
  node [
    id 11
    label "provide_an_e_mail_address_that_includes_the_special_character_to_break_the_sql_query_below"
  ]
  node [
    id 12
    label "generate_a_new_password_for_the_user"
  ]
  node [
    id 13
    label "require_no_third_party_intervention"
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
    source 0
    target 13
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
    target 0
  ]
]
