graph [
  directed 1
  capec_id "62"
  name "Cross Site Request Forgery"
  abstraction "Standard"
  status "Draft"
  description "An attacker crafts malicious web links and distributes them (via web pages, email, etc.), typically in a targeted manner, hoping to induce users to click on the link and execute the malicious action against some third-party application. If successful, the action embedded in the malicious link will be processed and accepted by the targeted application with the users' privilege level. This type of attack leverages the persistence and implicit trust placed in user session cookies by many web applications today. In such an architecture, once the user authenticates to an application and a session cookie is created on the user's system, all following transactions for that session are authenticated using that cookie including potential actions initiated by an attacker and simply &#34;riding&#34; the existing session cookie."
  likelihood "High"
  severity "Very High"
  related_attack_patterns "_networkx_list_start"
  related_attack_patterns [
    capec_id "21"
    nature "ChildOf"
  ]
  prerequisites "[]"
  skills_required "_networkx_list_start"
  skills_required [
    level "Medium"
    description "The attacker needs to figure out the exact invocation of the targeted malicious action and then craft a link that performs the said action. Having the user click on such a link is often accomplished by sending an email or posting such a link to a bulletin board or the likes."
  ]
  resources_required "_networkx_list_start"
  resources_required "All the attacker needs is the exact representation of requests to be made to the application and to be able to get the malicious link across to a victim."
  consequences [
    scope "Confidentiality"
    scope "Access Control"
    scope "Authorization"
    impact "Gain Privileges"
  ]
  consequences [
    scope "_networkx_list_start"
    scope "Confidentiality"
    impact "Read Data"
  ]
  consequences [
    scope "_networkx_list_start"
    scope "Integrity"
    impact "Modify Data"
  ]
  mitigations "Use cryptographic tokens to associate a request with a specific action. The token can be regenerated at every request so that if a request with an invalid token is encountered, it can be reliably discarded. The token is considered invalid if it arrived with a request other than the action it was supposed to be associated with."
  mitigations "Although less reliable, the use of the optional HTTP Referrer header can also be used to determine whether an incoming request was actually one that the user is authorized for, in the current context."
  mitigations "Additionally, the user can also be prompted to confirm an action every time an action concerning potentially sensitive data is invoked. This way, even if the attacker manages to get the user to click on a malicious link and request the desired action, the user has a chance to recover by denying confirmation. This solution is also implicitly tied to using a second factor of authentication before performing such actions."
  mitigations "In general, every request must be checked for the appropriate authentication token as well as authorization in the current session context."
  example_instances "_networkx_list_start"
  example_instances "While a user is logged into their bank account, an attacker can send an email with some potentially interesting content and require the user to click on a link in the email. The link points to or contains an attacker setup script, probably even within an iFrame, that mimics an actual user form submission to perform a malicious activity, such as transferring funds from the victim's account. The attacker can have the script embedded in, or targeted by, the link perform any arbitrary action as the authenticated user. When this script is executed, the targeted application authenticates and accepts the actions based on the victims existing session cookie. See also: Cross-site request forgery (CSRF) vulnerability in util.pl in @Mail WebMail 4.51 allows remote attackers to modify arbitrary settings and perform unauthorized actions as an arbitrary user, as demonstrated using a settings action in the SRC attribute of an IMG element in an HTML e-mail."
  related_weaknesses "352"
  related_weaknesses "306"
  related_weaknesses "664"
  related_weaknesses "732"
  related_weaknesses "1275"
  matched_cwes "352"
  matched_cwes "732"
  matched_cwes "306"
  taxonomy_mappings [
    taxonomy_name "WASC"
    entry_id "09"
    entry_name "Cross-Site Request Forgery"
  ]
  taxonomy_mappings [
    taxonomy_name "OWASP Attacks"
    entry_id ""
    entry_name "Cross Site Request Forgery (CSRF)"
  ]
  execution_flow [
    step "1"
    phase "Explore"
    description "[Explore target website] The attacker first explores the target website to determine pieces of functionality that are of interest to them (e.g. money transfers). The attacker will need a legitimate user account on the target website. It would help to have two accounts."
    techniques "Use web application debugging tool such as WebScarab, Tamper Data or TamperIE to analyze the information exchanged between the client and the server"
    techniques "Use network sniffing tool such as Wireshark to analyze the information exchanged between the client and the server"
    techniques "View HTML source of web pages that contain links or buttons that perform actions of interest."
  ]
  execution_flow [
    step "2"
    phase "Experiment"
    description "[Create a link that when clicked on, will execute the interesting functionality.] The attacker needs to create a link that will execute some interesting functionality such as transfer money, change a password, etc."
    techniques "Create a GET request containing all required parameters (e.g. https://www.somebank.com/members/transfer.asp?to=012345678901&#38;amt=10000)"
    techniques "Create a form that will submit a POST request (e.g. <form method=&#34;POST&#34; action=&#34;https://www.somebank.com/members/transfer.asp&#34;><input type=&#34;hidden&#34; Name=&#34;to&#34; value=&#34;012345678901&#34;/><input type=&#34;hidden&#34; Name=&#34;amt&#34; value=&#34;10000&#34;/><input type=&#34;submit&#34; src=&#34;clickhere.jpg&#34;/></form>"
  ]
  execution_flow [
    step "3"
    phase "Exploit"
    description "[Convince user to click on link] Finally, the attacker needs to convince a user that is logged into the target website to click on a link to execute the CSRF attack."
    techniques "Execute a phishing attack and send the user an e-mail convincing them to click on a link."
    techniques "Execute a stored XSS attack on a website to permanently embed the malicious link into the website."
    techniques "Execute a stored XSS attack on a website where an XMLHTTPRequest object will automatically execute the attack as soon as a user visits the page. This removes the step of convincing a user to click on a link."
    techniques "Include the malicious link on the attackers' own website where the user may have to click on the link, or where an XMLHTTPRequest object may automatically execute the attack when a user visits the site."
  ]
  node [
    id 0
    label "find_target_web_site"
  ]
  node [
    id 1
    label "need_a_legitimate_user_account_on_the_target_website"
  ]
  node [
    id 2
    label "help_to_have_two_accounts"
  ]
  node [
    id 3
    label "debug_tool_such_as_tamper_data_tamperie_webscarab_etc"
  ]
  node [
    id 4
    label "use_a_utility_such_as_wireshark"
  ]
  node [
    id 5
    label "contain_links_or_buttons_that_perform_actions_of_interest"
  ]
  node [
    id 6
    label "create_a_link_that_when_clicked_on_will_execute_the_interesting_functionality"
  ]
  node [
    id 7
    label "need_to_create_a_link_that_will_execute_some_interesting_functionality_such_as_transfer_money"
  ]
  node [
    id 8
    label "create_a_get_request_containing_all_required_parameters_e_g_https_www_somebank_com_members_transfer_asp_to_012345678901_amt_10000"
  ]
  node [
    id 9
    label "create_a_form_that_will_submit_a_post_request"
  ]
  node [
    id 10
    label "execute_a_phishing_attack"
  ]
  node [
    id 11
    label "execute_a_stored_xss_attack_on_a_website"
  ]
  node [
    id 12
    label "remove_the_step_of_convincing_a_user_to_click_on_a_link"
  ]
  node [
    id 13
    label "include_the_malicious_link_on_the_attackers_own_website_where_the_user_may_have_to_click_on_the_link_or_where_an_xmlhttprequest_object_may_automatically_execute_the_attack_when_a_user_visits_the_site"
  ]
  node [
    id 14
    label "log_a_user"
  ]
  node [
    id 15
    label "execute_this_script_the_targeted_application_authenticates"
  ]
  node [
    id 16
    label "see_cross_site_request_forgery_csrf_vulnerability_in_util_pl_in_mail"
  ]
  node [
    id 17
    label "allow_as_demonstrated_using_a_settings_action_in_the_src_attribute_of_an_img_element_in_an_html_e_mail"
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
