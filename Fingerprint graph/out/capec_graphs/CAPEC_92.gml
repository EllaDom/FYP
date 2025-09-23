graph [
  directed 1
  capec_id "92"
  name "Forced Integer Overflow"
  abstraction "Detailed"
  status "Draft"
  description "This attack forces an integer variable to go out of range. The integer variable is often used as an offset such as size of memory allocation or similarly. The attacker would typically control the value of such variable and try to get it out of range. For instance the integer in question is incremented past the maximum possible value, it may wrap to become a very small, or negative number, therefore providing a very incorrect value which can lead to unexpected behavior. At worst the attacker can execute arbitrary code."
  likelihood "High"
  severity "High"
  related_attack_patterns "_networkx_list_start"
  related_attack_patterns [
    capec_id "128"
    nature "ChildOf"
  ]
  prerequisites "The attacker can manipulate the value of an integer variable utilized by the target host."
  prerequisites "The target host does not do proper range checking on the variable before utilizing it."
  prerequisites "When the integer variable is incremented or decremented to an out of range value, it gets a very different value (e.g. very small or negative number)"
  skills_required [
    level "Low"
    description "An attacker can simply overflow an integer by inserting an out of range value."
  ]
  skills_required [
    level "High"
    description "Exploiting a buffer overflow by injecting malicious code into the stack of a software system or even the heap can require a higher skill level."
  ]
  resources_required "[]"
  consequences [
    scope "_networkx_list_start"
    scope "Integrity"
    impact "Modify Data"
  ]
  consequences [
    scope "Confidentiality"
    scope "Access Control"
    scope "Authorization"
    impact "Gain Privileges"
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
    scope "_networkx_list_start"
    scope "Availability"
    impact "Unreliable Execution"
  ]
  mitigations "Use a language or compiler that performs automatic bounds checking."
  mitigations "Carefully review the service's implementation before making it available to user. For instance you can use manual or automated code review to uncover vulnerabilities such as integer overflow."
  mitigations "Use an abstraction library to abstract away risky APIs. Not a complete solution."
  mitigations "Always do bound checking before consuming user input data."
  example_instances "Integer overflow in the ProcAuWriteElement function in server/dia/audispatch.c in Network Audio System (NAS) before 1.8a SVN 237 allows remote attackers to cause a denial of service (crash) and possibly execute arbitrary code via a large max_samples value. See also: CVE-2007-1544"
  example_instances "The following code illustrates an integer overflow. The declaration of total integer as &#34;unsigned short int&#34; assumes that the length of the first and second arguments fits in such an integer [REF-547], [REF-548]. include <stdlib.h>  include <string.h>  include <stdio.h>   int main (int argc, char *const *argv)  { if (argc !=3){ printf(&#34;Usage: prog_name <string1> <string2>\n&#34;);  exit(-1);  }  unsigned short int total;  total = strlen(argv[1])+strlen(argv[2])+1;  char * buff = (char *)malloc(total);  strcpy(buff, argv[1]);  strcpy(buff, argv[2]);  }"
  related_weaknesses "190"
  related_weaknesses "128"
  related_weaknesses "120"
  related_weaknesses "122"
  related_weaknesses "196"
  related_weaknesses "680"
  related_weaknesses "697"
  matched_cwes "122"
  matched_cwes "190"
  matched_cwes "120"
  taxonomy_mappings "_networkx_list_start"
  taxonomy_mappings [
    taxonomy_name "WASC"
    entry_id "03"
    entry_name "Integer Overflows"
  ]
  execution_flow [
    step "1"
    phase "Explore"
    description "The first step is exploratory meaning the attacker looks for an integer variable that they can control."
    techniques "[]"
  ]
  execution_flow [
    step "2"
    phase "Experiment"
    description "The attacker finds an integer variable that they can write into or manipulate and try to get the value of the integer out of the possible range."
    techniques "[]"
  ]
  execution_flow [
    step "3"
    phase "Exploit"
    description "The integer variable is forced to have a value out of range which set its final value to an unexpected value."
    techniques "[]"
  ]
  execution_flow [
    step "4"
    phase "Exploit"
    description "The target host acts on the data and unexpected behavior may happen."
    techniques "[]"
  ]
  node [
    id 0
    label "find_an_integer_variable_that_they_can_write_into_or_manipulate_and_try_to_get_the_value_of_the_integer_out_of_the_possible_range"
  ]
  node [
    id 1
    label "force_the_integer_variable"
  ]
  node [
    id 2
    label "assume_ref_547"
  ]
  node [
    id 3
    label "manipulate_the_value_of_an_integer_variable_utilized_by_the_target_host"
  ]
  node [
    id 4
    label "incremente_the_integer_variable"
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
