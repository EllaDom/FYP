graph [
  directed 1
  capec_id "12"
  name "Choosing Message Identifier"
  abstraction "Standard"
  status "Draft"
  description "This pattern of attack is defined by the selection of messages distributed via multicast or public information channels that are intended for another client by determining the parameter value assigned to that client. This attack allows the adversary to gain access to potentially privileged information, and to possibly perpetrate other attacks through the distribution means by impersonation. If the channel/message being manipulated is an input rather than output mechanism for the system, (such as a command bus), this style of attack could be used to change the adversary's identifier to more a privileged one."
  likelihood "High"
  severity "High"
  related_attack_patterns [
    capec_id "21"
    nature "PeerOf"
  ]
  related_attack_patterns [
    capec_id "216"
    nature "ChildOf"
  ]
  prerequisites "Information and client-sensitive (and client-specific) data must be present through a distribution channel available to all users."
  prerequisites "Distribution means must code (through channel, message identifiers, or convention) message destination in a manner visible within the distribution means itself (such as a control channel) or in the messages themselves."
  skills_required "_networkx_list_start"
  skills_required [
    level "Low"
    description "All the adversary needs to discover is the format of the messages on the channel/distribution means and the particular identifier used within the messages."
  ]
  resources_required "_networkx_list_start"
  resources_required "The adversary needs the ability to control source code or application configuration responsible for selecting which message/channel id is absorbed from the public distribution means."
  consequences [
    scope "_networkx_list_start"
    scope "Confidentiality"
    impact "Read Data"
  ]
  consequences [
    scope "Confidentiality"
    scope "Access Control"
    scope "Authorization"
    impact "Gain Privileges"
  ]
  mitigations "Associate some ACL (in the form of a token) with an authenticated user which they provide middleware. The middleware uses this token as part of its channel/message selection for that client, or part of a discerning authorization decision for privileged channels/messages. The purpose is to architect the system in a way that associates proper authentication/authorization with each channel/message."
  mitigations "Re-architect system input/output channels as appropriate to distribute self-protecting data. That is, encrypt (or otherwise protect) channels/messages so that only authorized readers can see them."
  example_instances "_networkx_list_start"
  example_instances "A certain B2B interface on a large application codes for messages passed over an MQSeries queue, on a single &#34;Partners&#34; channel. Messages on that channel code for their client destination based on a partner_ID field, held by each message. That field is a simple integer. Adversaries having access to that channel, perhaps a particularly nosey partner, can simply choose to store messages of another partner's ID and read them as they desire. Note that authentication does not prevent a partner from leveraging this attack on other partners. It simply disallows adversaries without partner status from conducting this attack."
  related_weaknesses "201"
  related_weaknesses "306"
  matched_cwes "_networkx_list_start"
  matched_cwes "306"
  taxonomy_mappings "[]"
  execution_flow [
    step "1"
    phase "Explore"
    description "[Determine Nature of Messages] Determine the nature of messages being transported as well as the identifiers to be used as part of the attack"
    techniques "[]"
  ]
  execution_flow [
    step "2"
    phase "Experiment"
    description "[Authenticate] If required, authenticate to the distribution channel"
    techniques "[]"
  ]
  execution_flow [
    step "3"
    phase "Experiment"
    description "[Identify Known Client Identifiers] If any particular client's information is available through a control channel available to all users, the adversary will discover particular identifiers for targeted clients by observing this channel, or requesting client information through this channel."
    techniques "[]"
  ]
  execution_flow [
    step "4"
    phase "Experiment"
    description "[Change Message Identifier] Adversaries with client access connecting to output channels could change their channel identifier and see someone else's (perhaps more privileged) data."
    techniques "[]"
  ]
  node [
    id 0
    label "determine_nature_of_messages"
  ]
  node [
    id 1
    label "determine_the_nature_of_messages_being_transported_as_well_as_the_identifiers_to_be_used_as_part_of_the_attack"
  ]
  node [
    id 2
    label "identify_known_client_identifiers"
  ]
  node [
    id 3
    label "choose_to_store_messages_of_another_partner_s_id_and_read_them_as_they_desire"
  ]
  node [
    id 4
    label "disallow_adversaries_without_partner_status"
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
