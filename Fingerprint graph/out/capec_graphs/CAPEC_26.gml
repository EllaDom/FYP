graph [
  directed 1
  capec_id "26"
  name "Leveraging Race Conditions"
  abstraction "Meta"
  status "Stable"
  description "The adversary targets a race condition occurring when multiple processes access and manipulate the same resource concurrently, and the outcome of the execution depends on the particular order in which the access takes place. The adversary can leverage a race condition by &#34;running the race&#34;, modifying the resource and modifying the normal execution flow. For instance, a race condition can occur while accessing a file: the adversary can trick the system by replacing the original file with their version and cause the system to read the malicious file."
  likelihood "High"
  severity "High"
  related_attack_patterns "[]"
  prerequisites "A resource is accessed/modified concurrently by multiple processes such that a race condition exists."
  prerequisites "The adversary has the ability to modify the resource."
  skills_required "_networkx_list_start"
  skills_required [
    level "Medium"
    description "Being able to &#34;run the race&#34; requires basic knowledge of concurrent processing including synchonization techniques."
  ]
  resources_required "[]"
  consequences [
    scope "Confidentiality"
    scope "Access Control"
    scope "Authorization"
    impact "Gain Privileges"
  ]
  consequences [
    scope "_networkx_list_start"
    scope "Integrity"
    impact "Modify Data"
  ]
  mitigations "Use safe libraries to access resources such as files."
  mitigations "Be aware that improper use of access function calls such as chown(), tempfile(), chmod(), etc. can cause a race condition."
  mitigations "Use synchronization to control the flow of execution."
  mitigations "Use static analysis tools to find race conditions."
  mitigations "Pay attention to concurrency problems related to the access of resources."
  example_instances "The Net Direct client for Linux before 6.0.5 in Nortel Application Switch 2424, VPN 3050 and 3070, and SSL VPN Module 1000 extracts and executes files with insecure permissions, which allows local users to exploit a race condition to replace a world-writable file in /tmp/NetClient and cause another user to execute arbitrary code when attempting to execute this client, as demonstrated by replacing /tmp/NetClient/client. See also: CVE-2007-1057"
  example_instances "The following code illustrates a file that is accessed multiple times by name in a publicly accessible directory. A race condition exists between the accesses where an attacker can replace the file referenced by the name (see [REF-107]). include <sys/types.h>  include <fcntl.h>  include <unistd.h>   define FILE &#34;/tmp/myfile&#34;  define UID 100   void test(char *str)  { int fd;  fd = creat(FILE, 0644);  if(fd == -1) return;  chown(FILE, UID, -1); /* BAD */  close(fd);  }   int main(int argc, char **argv)  { char *userstr;  if(argc > 1) { userstr = argv[1];  test(userstr);  }  return 0;  }"
  related_weaknesses "368"
  related_weaknesses "363"
  related_weaknesses "366"
  related_weaknesses "370"
  related_weaknesses "362"
  related_weaknesses "662"
  related_weaknesses "689"
  related_weaknesses "667"
  related_weaknesses "665"
  related_weaknesses "1223"
  related_weaknesses "1254"
  related_weaknesses "1298"
  matched_cwes "368"
  matched_cwes "662"
  taxonomy_mappings "[]"
  execution_flow [
    step "1"
    phase "Explore"
    description "The adversary explores to gauge what level of access they have."
    techniques "[]"
  ]
  execution_flow [
    step "2"
    phase "Experiment"
    description "The adversary gains access to a resource on the target host. The adversary modifies the targeted resource. The resource's value is used to determine the next normal execution action."
    techniques "[]"
  ]
  execution_flow [
    step "3"
    phase "Exploit"
    description "The resource is modified/checked concurrently by multiple processes. By using one of the processes, the adversary is able to modify the value just before it is consumed by a different process. A race condition occurs and is exploited by the adversary to abuse the target host."
    techniques "[]"
  ]
  node [
    id 0
    label "explore_to_gauge_what_level_of_access_they_have"
  ]
  node [
    id 1
    label "gain_access_to_a_resource_on_the_target_host"
  ]
  node [
    id 2
    label "modify_the_resource"
  ]
  node [
    id 3
    label "determine_the_next_normal_execution_action"
  ]
  node [
    id 4
    label "modify_the_value"
  ]
  node [
    id 5
    label "execute_files_with_insecure_permissions_which_allows_local_users_to_exploit_a_race_condition_to_replace_a_world_writable_file_in_tmp_netclient_and_cause_another_user_to_execute_arbitrary_code_when_attempting_to_execute_this_client"
  ]
  node [
    id 6
    label "include_sys_types_h"
  ]
  node [
    id 7
    label "access_a_resource"
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
    source 2
    target 4
  ]
  edge [
    source 3
    target 2
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
    target 2
  ]
]
