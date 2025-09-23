graph [
  directed 1
  capec_id "54"
  name "Query System for Information"
  abstraction "Standard"
  status "Draft"
  description "An adversary, aware of an application's location (and possibly authorized to use the application), probes an application's structure and evaluates its robustness by submitting requests and examining responses. Often, this is accomplished by sending variants of expected queries in the hope that these modified queries might return information beyond what the expected set of queries would provide."
  likelihood "High"
  severity "Low"
  related_attack_patterns "_networkx_list_start"
  related_attack_patterns [
    capec_id "116"
    nature "ChildOf"
  ]
  prerequisites "_networkx_list_start"
  prerequisites "This class of attacks does not strictly require authorized access to the application. As Attackers use this attack process to classify, map, and identify vulnerable aspects of an application, it simply requires hypotheses to be verified, interaction with the application, and time to conduct trial-and-error activities."
  skills_required "_networkx_list_start"
  skills_required [
    level "Medium"
    description "Although fuzzing parameters is not difficult, and often possible with automated fuzzers, interpreting the error conditions and modifying the parameters so as to move further in the process of mapping the application requires detailed knowledge of target platform, the languages and packages used as well as software design."
  ]
  resources_required "_networkx_list_start"
  resources_required "The Attacker needs the ability to probe application functionality and provide it erroneous directives or data without triggering intrusion detection schemes or making enough of an impact on application logging that steps are taken against the adversary. The Attack does not need special hardware, software, skills, or access."
  consequences "_networkx_list_start"
  consequences [
    scope "_networkx_list_start"
    scope "Confidentiality"
    impact "Read Data"
  ]
  mitigations "Application designers can construct a 'code book' for error messages. When using a code book, application error messages aren't generated in string or stack trace form, but are cataloged and replaced with a unique (often integer-based) value 'coding' for the error. Such a technique will require helpdesk and hosting personnel to use a 'code book' or similar mapping to decode application errors/logs in order to respond to them normally."
  mitigations "Application designers can wrap application functionality (preferably through the underlying framework) in an output encoding scheme that obscures or cleanses error messages to prevent such attacks. Such a technique is often used in conjunction with the above 'code book' suggestion."
  example_instances "Blind SQL injection is an example of this technique, applied to successful exploit. See also: CVE-2006-4705"
  example_instances "Attacker sends bad data at various servlets in a J2EE system, records returned exception stack traces, and maps application functionality. In addition, this technique allows attackers to correlate those servlets used with the underlying open source packages (and potentially version numbers) that provide them."
  related_weaknesses "_networkx_list_start"
  related_weaknesses "209"
  matched_cwes "_networkx_list_start"
  matched_cwes "209"
  taxonomy_mappings "[]"
  execution_flow [
    step "1"
    phase "Explore"
    description "[Determine parameters] Determine all user-controllable parameters of the application either by probing or by finding documentation"
    techniques "[]"
  ]
  execution_flow [
    step "2"
    phase "Experiment"
    description "[Cause error condition] Inject each parameter with content that causes an error condition to manifest"
    techniques "[]"
  ]
  execution_flow [
    step "3"
    phase "Experiment"
    description "[Modify parameters] Modify the content of each parameter according to observed error conditions"
    techniques "[]"
  ]
  execution_flow [
    step "4"
    phase "Exploit"
    description "[Follow up attack] Once the above steps have been repeated with enough parameters, the application will be sufficiently mapped out. The adversary can then launch a desired attack (for example, Blind SQL Injection)"
    techniques "[]"
  ]
  node [
    id 0
    label "cause_error_condition"
  ]
  node [
    id 1
    label "modify_the_content_of_each_parameter"
  ]
  node [
    id 2
    label "follow_attack"
  ]
  node [
    id 3
    label "launch_a_desired_attack_for_example_blind_sql_injection"
  ]
  node [
    id 4
    label "send_more_data"
  ]
  node [
    id 5
    label "require_authorized_access_to_the_application"
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
]
