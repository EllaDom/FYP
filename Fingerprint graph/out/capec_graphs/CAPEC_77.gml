graph [
  directed 1
  capec_id "77"
  name "Manipulating User-Controlled Variables"
  abstraction "Standard"
  status "Draft"
  description "This attack targets user controlled variables (DEBUG=1, PHP Globals, and So Forth). An adversary can override variables leveraging user-supplied, untrusted query variables directly used on the application server without any data sanitization. In extreme cases, the adversary can change variables controlling the business logic of the application. For instance, in languages like PHP, a number of poorly set default configurations may allow the user to override variables."
  likelihood "High"
  severity "Very High"
  related_attack_patterns "_networkx_list_start"
  related_attack_patterns [
    capec_id "22"
    nature "ChildOf"
  ]
  prerequisites "A variable consumed by the application server is exposed to the client."
  prerequisites "A variable consumed by the application server can be overwritten by the user."
  prerequisites "The application server trusts user supplied data to compute business logic."
  prerequisites "The application server does not perform proper input validation."
  skills_required [
    level "Low"
    description "The malicious user can easily try some well-known global variables and find one which matches."
  ]
  skills_required [
    level "Medium"
    description "The adversary can use automated tools to probe for variables that they can control."
  ]
  resources_required "[]"
  consequences [
    scope "_networkx_list_start"
    scope "Integrity"
    impact "Modify Data"
  ]
  consequences [
    scope "Confidentiality"
    scope "Integrity"
    scope "Availability"
    impact "Execute Unauthorized Commands"
  ]
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
  mitigations "Do not allow override of global variables and do Not Trust Global Variables. If the register_globals option is enabled, PHP will create global variables for each GET, POST, and cookie variable included in the HTTP request. This means that a malicious user may be able to set variables unexpectedly. For instance make sure that the server setting for PHP does not expose global variables."
  mitigations "A software system should be reluctant to trust variables that have been initialized outside of its trust boundary. Ensure adequate checking is performed when relying on input from outside a trust boundary."
  mitigations "Separate the presentation layer and the business logic layer. Variables at the business logic layer should not be exposed at the presentation layer. This is to prevent computation of business logic from user controlled input data."
  mitigations "Use encapsulation when declaring your variables. This is to lower the exposure of your variables."
  mitigations "Assume all input is malicious. Create an allowlist that defines all valid input to the software system based on the requirements specifications. Input that does not match against the allowlist should be rejected by the program."
  example_instances "_networkx_list_start"
  example_instances "PHP is a study in bad security. The main idea pervading PHP is &#34;ease of use,&#34; and the mantra &#34;don't make the developer go to any extra work to get stuff done&#34; applies in all cases. This is accomplished in PHP by removing formalism from the language, allowing declaration of variables on first use, initializing everything with preset values, and taking every meaningful variable from a transaction and making it available. In cases of collision with something more technical, the simple almost always dominates in PHP. One consequence of all this is that PHP allows users of a Web application to override environment variables with user-supplied, untrusted query variables. Thus, critical values such as the CWD and the search path can be overwritten and directly controlled by a remote anonymous user. Another similar consequence is that variables can be directly controlled and assigned from the user-controlled values supplied in GET and POST request fields. So seemingly normal code like this, does bizarre things: while($count < 10){  // Do something  $count++;  } Normally, this loop will execute its body ten times. The first iteration will be an undefined zero, and further trips though the loop will result in an increment of the variable $count. The problem is that the coder does not initialize the variable to zero before entering the loop. This is fine because PHP initializes the variable on declaration. The result is code that seems to function, regardless of badness. The problem is that a user of the Web application can supply a request such as GET /login.php?count=9 and cause $count to start out at the value 9, resulting in only one trip through the loop. Yerg. Depending on the configuration, PHP may accept user-supplied variables in place of environment variables. PHP initializes global variables for all process environment variables, such as $PATH and $HOSTNAME. These variables are of critical importance because they may be used in file or network operations. If an adversary can supply a new $PATH variable (such as PATH='/var'), the program may be exploitable. PHP may also take field tags supplied in GET/POST requests and transform them into global variables. This is the case with the $count variable we explored in our previous example. Consider another example of this problem in which a program defines a variable called $tempfile. An adversary can supply a new temp file such as $tempfile = &#34;/etc/passwd&#34;. Then the temp file may get erased later via a call to unlink($tempfile);. Now the passwd file has been erased--a bad thing indeed on most OSs. Also consider that the use of include() and require() first search $PATH, and that using calls to the shell may execute crucial programs such as ls. In this way, ls may be &#34;Trojaned&#34; (the adversary can modify $PATH to cause a Trojan copy of ls to be loaded). This type of attack could also apply to loadable libraries if $LD_LIBRARY_PATH is modified. Finally, some versions of PHP may pass user data to syslog as a format string, thus exposing the application to a format string buffer overflow. See also: File upload allows arbitrary file read by setting hidden form variables to match internal variable names (CVE-2000-0860)"
  related_weaknesses "15"
  related_weaknesses "94"
  related_weaknesses "96"
  related_weaknesses "285"
  related_weaknesses "302"
  related_weaknesses "473"
  related_weaknesses "1321"
  matched_cwes "94"
  matched_cwes "285"
  taxonomy_mappings "[]"
  execution_flow [
    step "1"
    phase "Explore"
    description "[Probe target application] The adversary first probes the target application to determine important information about the target. This information could include types software used, software versions, what user input the application consumes, and so on."
    techniques "[]"
  ]
  execution_flow [
    step "2"
    phase "Experiment"
    description "[Find user-controlled variables] Using the information found by probing the application, the adversary attempts to manipulate many user-controlled variables and observes the effects on the application. If the adversary notices any significant changes to the application, they will know that a certain variable is useful to the application."
    techniques "Adversaries will try to alter many common variable names such as &#34;count&#34;, &#34;tempFile&#34;, &#34;i&#34;, etc. The hope is that they can alter the flow of the application without knowing the inner-workings."
    techniques "Adversaries will try to alter known environment variables."
  ]
  execution_flow [
    step "3"
    phase "Exploit"
    description "[Manipulate user-controlled variables] Once the adversary has found a user-controller variable(s) that is important to the application, they will manipulate it to change the normal behavior in a way that benefits the adversary."
    techniques "[]"
  ]
  node [
    id 0
    label "probe_the_target_application"
  ]
  node [
    id 1
    label "include_types_software_used_software_versions_what_user_input_the_application_consumes_and_so_on"
  ]
  node [
    id 2
    label "find_user_controlled_environment_variables"
  ]
  node [
    id 3
    label "notice_any_significant_changes_to_the_application"
  ]
  node [
    id 4
    label "try_to_alter_many_common_variable_names_such_as_count_tempfile_i_etc"
  ]
  node [
    id 5
    label "alter_the_flow_of_the_application"
  ]
  node [
    id 6
    label "change_the_values_of_environment_variables"
  ]
  node [
    id 7
    label "find_a_user_controller_variable_s_that_is_important_to_the_application"
  ]
  node [
    id 8
    label "pervade_php"
  ]
  node [
    id 9
    label "achieve_this"
  ]
  node [
    id 10
    label "overwrite_critical_values_such_as_the_cwd_and_the_search_path"
  ]
  node [
    id 11
    label "control_variables"
  ]
  node [
    id 12
    label "do_something_count"
  ]
  node [
    id 13
    label "execute_its_body"
  ]
  node [
    id 14
    label "initialize_the_variable"
  ]
  node [
    id 15
    label "seem_to_function"
  ]
  node [
    id 16
    label "supply_a_request_such_as_get_login_php_count_9"
  ]
  node [
    id 17
    label "initialize_global_variables_for_all_process_environment_variables_such_as_path_and_hostname"
  ]
  node [
    id 18
    label "use_they"
  ]
  node [
    id 19
    label "supply_a_new_path_variable_such_as_path_var"
  ]
  node [
    id 20
    label "take_field_tags_supplied_in_get_post_requests"
  ]
  node [
    id 21
    label "consider_another_example_of_this_problem_in_which_a_program_defines_a_variable_called_tempfile"
  ]
  node [
    id 22
    label "supply_a_new_temp_file_such_as_tempfile_etc_passwd"
  ]
  node [
    id 23
    label "remove_the_temporary_file"
  ]
  node [
    id 24
    label "erase_a_bad_thing_indeed_on_most_oss"
  ]
  node [
    id 25
    label "change_the_ld_library_path_environment"
  ]
  node [
    id 26
    label "pass_user_data"
  ]
  node [
    id 27
    label "supply_data"
  ]
  node [
    id 28
    label "perform_sufficient_validation"
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
  edge [
    source 17
    target 18
  ]
  edge [
    source 18
    target 19
  ]
  edge [
    source 19
    target 20
  ]
  edge [
    source 20
    target 21
  ]
  edge [
    source 21
    target 22
  ]
  edge [
    source 22
    target 23
  ]
  edge [
    source 23
    target 24
  ]
  edge [
    source 24
    target 25
  ]
  edge [
    source 25
    target 26
  ]
  edge [
    source 26
    target 27
  ]
  edge [
    source 27
    target 28
  ]
]
