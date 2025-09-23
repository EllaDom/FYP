graph [
  directed 1
  capec_id "127"
  name "Directory Indexing"
  abstraction "Detailed"
  status "Draft"
  description "An adversary crafts a request to a target that results in the target listing/indexing the content of a directory as output. One common method of triggering directory contents as output is to construct a request containing a path that terminates in a directory name rather than a file name since many applications are configured to provide a list of the directory's contents when such a request is received. An adversary can use this to explore the directory tree on a target as well as learn the names of files. This can often end up revealing test files, backup files, temporary files, hidden files, configuration files, user accounts, script contents, as well as naming conventions, all of which can be used by an attacker to mount additional attacks."
  likelihood "High"
  severity "Medium"
  related_attack_patterns "_networkx_list_start"
  related_attack_patterns [
    capec_id "54"
    nature "ChildOf"
  ]
  prerequisites "The target must be misconfigured to return a list of a directory's content when it receives a request that ends in a directory name rather than a file name."
  prerequisites "The adversary must be able to control the path that is requested of the target."
  prerequisites "The administrator must have failed to properly configure an ACL or has associated an overly permissive ACL with a particular directory."
  prerequisites "The server version or patch level must not inherently prevent known directory listing attacks from working."
  skills_required [
    level "Low"
    description "To issue the request to URL without given a specific file name"
  ]
  skills_required [
    level "High"
    description "To bypass the access control of the directory of listings"
  ]
  resources_required "_networkx_list_start"
  resources_required "Ability to send HTTP requests to a web application."
  consequences "_networkx_list_start"
  consequences [
    scope "_networkx_list_start"
    scope "Confidentiality"
    impact "Read Data"
  ]
  mitigations "1. Using blank index.html: putting blank index.html simply prevent directory listings from displaying to site visitors."
  mitigations "2. Preventing with .htaccess in Apache web server: In .htaccess, write &#34;Options-indexes&#34;."
  mitigations "3. Suppressing error messages: using error 403 &#34;Forbidden&#34; message exactly like error 404 &#34;Not Found&#34; message."
  example_instances "_networkx_list_start"
  example_instances "The adversary uses directory listing to view sensitive files in the application. This is an example of accessing the backup file. The attack issues a request for http://www.example.com/admin/ and receives the following dynamic directory indexing content in the response: Index of /admin Name Last Modified Size Description backup/ 31-May-2007 08:18 - Apache/ 2.0.55 Server at www.example.com Port 80 The target application does not have direct hyperlink to the &#34;backup&#34; directory in the normal html webpage, however the attacker has learned of this directory due to indexing the content. The client then requests the backup directory URL and receives output which has a &#34;db_dump.php&#34; file in it. This sensitive data should not be disclosed publicly."
  related_weaknesses "424"
  related_weaknesses "425"
  related_weaknesses "288"
  related_weaknesses "285"
  related_weaknesses "732"
  related_weaknesses "276"
  related_weaknesses "693"
  matched_cwes "288"
  matched_cwes "276"
  matched_cwes "732"
  matched_cwes "693"
  matched_cwes "285"
  matched_cwes "425"
  taxonomy_mappings "_networkx_list_start"
  taxonomy_mappings [
    taxonomy_name "ATTACK"
    entry_id "1083"
    entry_name "File and Directory Discovery"
  ]
  execution_flow [
    step "1"
    phase "Explore"
    description "[Directory Discovery] Use a method, either manual, scripted, or automated to discover the directories on the server by making requests for directories that may possibly exist. During this phase the adversary is less concerned with whether a directory can be accessed or indexed and more focused on simply discovering what directories do exist on the target."
    techniques "Send requests to the web server for common directory names"
    techniques "If directories are discovered that are native to a server type further refine the directory search to include directories usually present on those types of servers."
    techniques "Search for uncommon or potentially user created directories that may be present."
  ]
  execution_flow [
    step "2"
    phase "Experiment"
    description "[Iteratively explore directory/file structures] The adversary attempts to access the discovered directories that allow access and may attempt to bypass server or application level ACLs by using manual or automated methods"
    techniques "Use a scanner tool to dynamically add directories/files to include their scan based upon data obtained in initial probes."
    techniques "Use a browser to manually explore the website by issuing a request ending the URL in a slash '/'."
    techniques "Attempt to bypass ACLs on directories by using methods that known to work against some server types by appending data to the directory request. For instance, appending a Null byte to the end of the request which may cause an ACL to fail and allow access."
    techniques "Sequentially request a list of common base files to each directory discovered."
    techniques "Try multiple fuzzing techniques to list directory contents for directories that will not reveal their contents with a &#34;/&#34; request"
  ]
  execution_flow [
    step "3"
    phase "Exploit"
    description "[Read directories or files which are not intended for public viewing.] The adversary attempts to access the discovered directories that allow access and may attempt to bypass server or application level ACLs by using manual or automated methods"
    techniques "Try multiple exploit techniques to list directory contents for directories that will not reveal their contents with a &#34;/&#34; request"
    techniques "Try other known exploits to elevate privileges sufficient to bypass protected directories."
    techniques "List the files in the directory by issuing a request with the URL ending in a &#34;/&#34; slash."
    techniques "Access the files via direct URL and capture contents."
    techniques "Attempt to bypass ACLs on directories by using methods that are known to work against some server types by appending data to the directory request. For instance, appending a Null byte to the end of the request which may cause an ACL to fail and allow access."
    techniques "Sequentially request a list of common base files to each directory discovered."
  ]
  node [
    id 0
    label "automate_to_discover_the_directories_on_the_server"
  ]
  node [
    id 1
    label "access_a_directory"
  ]
  node [
    id 2
    label "send_requests_to_the_web_server_for_common_directory_names"
  ]
  node [
    id 3
    label "explore_directory_file_structures"
  ]
  node [
    id 4
    label "attempt_to_access_the_discovered_directories_that_allow_access_and_may_attempt_to_bypass_server_or_application_level_acls_by_using_manual_or_automated_methods"
  ]
  node [
    id 5
    label "add_directories_files"
  ]
  node [
    id 6
    label "explore_the_website"
  ]
  node [
    id 7
    label "attempt_to_bypass_acls_on_directories_by_using_methods_that_known_to_work_against_some_server_types_by_appending_data_to_the_directory_request"
  ]
  node [
    id 8
    label "append_a_null_byte"
  ]
  node [
    id 9
    label "request_a_list_of_common_base_files"
  ]
  node [
    id 10
    label "try_multiple_fuzzing_techniques"
  ]
  node [
    id 11
    label "read_directories_or_files_which_are_not_intended_for_public_viewing"
  ]
  node [
    id 12
    label "try_multiple_exploit_techniques_to_list_directory_contents_for_directories_that_will_not_reveal_their_contents_with_a_request"
  ]
  node [
    id 13
    label "try_other_known_exploits"
  ]
  node [
    id 14
    label "list_the_files_in_the_directory"
  ]
  node [
    id 15
    label "access_arbitrary_files"
  ]
  node [
    id 16
    label "list_to_view_sensitive_files_in_the_application"
  ]
  node [
    id 17
    label "access_the_backup_file"
  ]
  node [
    id 18
    label "issue_a_request_for_http_www_example_com_admin_index_of_admin_name_last_modified_size_description_backup_31_may_2007_08_18_apache"
  ]
  node [
    id 19
    label "request_the_backup_directory_url"
  ]
  node [
    id 20
    label "disclose_this_sensitive_data"
  ]
  node [
    id 21
    label "misconfigure_the_target"
  ]
  node [
    id 22
    label "control_the_path_that_is_requested_of_the_target"
  ]
  node [
    id 23
    label "fail_to_properly_configure_an_acl"
  ]
  node [
    id 24
    label "prevent_known_directory_listing_attacks"
  ]
  edge [
    source 0
    target 1
  ]
  edge [
    source 0
    target 3
  ]
  edge [
    source 1
    target 2
  ]
  edge [
    source 2
    target 0
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
    source 4
    target 12
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
    source 9
    target 16
  ]
  edge [
    source 10
    target 11
  ]
  edge [
    source 11
    target 4
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
    target 7
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
]
