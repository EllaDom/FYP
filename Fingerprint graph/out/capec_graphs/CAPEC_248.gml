graph [
  directed 1
  capec_id "248"
  name "Command Injection"
  abstraction "Meta"
  status "Stable"
  description "An adversary looking to execute a command of their choosing, injects new items into an existing command thus modifying interpretation away from what was intended. Commands in this context are often standalone strings that are interpreted by a downstream component and cause specific responses. This type of attack is possible when untrusted values are used to build these command strings. Weaknesses in input validation or command construction can enable the attack and lead to successful exploitation."
  likelihood "Medium"
  severity "High"
  related_attack_patterns "[]"
  prerequisites "_networkx_list_start"
  prerequisites "The target application must accept input from the user and then use this input in the construction of commands to be executed. In virtually all cases, this is some form of string input that is concatenated to a constant string defined by the application to form the full command to be executed."
  skills_required "[]"
  resources_required "[]"
  consequences "_networkx_list_start"
  consequences [
    scope "Confidentiality"
    scope "Integrity"
    scope "Availability"
    impact "Execute Unauthorized Commands"
  ]
  mitigations "All user-controllable input should be validated and filtered for potentially unwanted characters. Using an allowlist for input is desired, but if use of a denylist approach is necessary, then focusing on command related terms and delimiters is necessary."
  mitigations "Input should be encoded prior to use in commands to make sure command related characters are not treated as part of the command. For example, quotation characters may need to be encoded so that the application does not treat the quotation as a delimiter."
  mitigations "Input should be parameterized, or restricted to data sections of a command, thus removing the chance that the input will be treated as part of the command itself."
  example_instances "[]"
  related_weaknesses "_networkx_list_start"
  related_weaknesses "77"
  matched_cwes "_networkx_list_start"
  matched_cwes "77"
  taxonomy_mappings "_networkx_list_start"
  taxonomy_mappings [
    taxonomy_name "OWASP Attacks"
    entry_id ""
    entry_name "Command Injection"
  ]
  execution_flow "[]"
  node [
    id 0
    label "accept_a_string_as_user_input"
  ]
  node [
    id 1
    label "concatenate_that"
  ]
  edge [
    source 0
    target 1
  ]
]
