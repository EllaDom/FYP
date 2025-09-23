graph [
  directed 1
  capec_id "22"
  name "Exploiting Trust in Client"
  abstraction "Meta"
  status "Draft"
  description "An attack of this type exploits vulnerabilities in client/server communication channel authentication and data integrity. It leverages the implicit trust a server places in the client, or more importantly, that which the server believes is the client. An attacker executes this type of attack by communicating directly with the server where the server believes it is communicating only with a valid client. There are numerous variations of this type of attack."
  likelihood "High"
  severity "High"
  related_attack_patterns "[]"
  prerequisites "_networkx_list_start"
  prerequisites "Server software must rely on client side formatted and validated values, and not reinforce these checks on the server side."
  skills_required "_networkx_list_start"
  skills_required [
    level "Medium"
    description "The attacker must have fairly detailed knowledge of the syntax and semantics of client/server communications protocols and grammars"
  ]
  resources_required "_networkx_list_start"
  resources_required "Ability to communicate synchronously or asynchronously with server"
  consequences [
    scope "Confidentiality"
    scope "Integrity"
    scope "Availability"
    impact "Execute Unauthorized Commands"
  ]
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
  mitigations "Design: Ensure that client process and/or message is authenticated so that anonymous communications and/or messages are not accepted by the system."
  mitigations "Design: Do not rely on client validation or encoding for security purposes."
  mitigations "Design: Utilize digital signatures to increase authentication assurance."
  mitigations "Design: Utilize two factor authentication to increase authentication assurance."
  mitigations "Implementation: Perform input validation for all remote content."
  example_instances "Web applications may use JavaScript to perform client side validation, request encoding/formatting, and other security functions, which provides some usability benefits and eliminates some client-server round-tripping. However, the web server cannot assume that the requests it receives have been subject to those validations, because an attacker can use an alternate method for crafting the HTTP Request and submit data that contains poisoned values designed to spoof a user and/or get the web server to disclose information."
  example_instances "Web 2.0 style applications may be particularly vulnerable because they in large part rely on existing infrastructure which provides scalability without the ability to govern the clients. Attackers identify vulnerabilities that either assume the client side is responsible for some security services (without the requisite ability to ensure enforcement of these checks) and/or the lack of a hardened, default deny server configuration that allows for an attacker probing for weaknesses in unexpected ways. Client side validation, request formatting and other services may be performed, but these are strictly usability enhancements not security enhancements."
  example_instances "Many web applications use client side scripting like JavaScript to enforce authentication, authorization, session state and other variables, but at the end of day they all make requests to the server. These client side checks may provide usability and performance gains, but they lack integrity in terms of the http request. It is possible for an attacker to post variables directly to the server without using any of the client script security checks and customize the patterns to impersonate other users or probe for more information."
  example_instances "Many message oriented middleware systems like MQ Series are rely on information that is passed along with the message request for making authorization decisions, for example what group or role the request should be passed. However, if the message server does not or cannot authenticate the authorization information in the request then the server's policy decisions about authorization are trivial to subvert because the client process can simply elevate privilege by passing in elevated group or role information which the message server accepts and acts on."
  related_weaknesses "290"
  related_weaknesses "287"
  related_weaknesses "20"
  related_weaknesses "200"
  related_weaknesses "693"
  matched_cwes "20"
  matched_cwes "287"
  matched_cwes "290"
  matched_cwes "693"
  matched_cwes "200"
  taxonomy_mappings "[]"
  execution_flow "[]"
  node [
    id 0
    label "perform_client_side_validation"
  ]
  node [
    id 1
    label "identify_vulnerabilities_that_either_assume_the_client_side_is_responsible_for_some_security_services_without_the_requisite_ability_to_ensure_enforcement_of_these_checks"
  ]
  node [
    id 2
    label "request_formatting_and_other_services"
  ]
  node [
    id 3
    label "enforce_authentication_authorization_session_state_and_other_variables"
  ]
  node [
    id 4
    label "provide_usability_and_performance_gains"
  ]
  node [
    id 5
    label "post_variables"
  ]
  node [
    id 6
    label "authenticate_the_authorization_information"
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
]
