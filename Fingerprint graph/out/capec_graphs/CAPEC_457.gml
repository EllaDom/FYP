graph [
  directed 1
  capec_id "457"
  name "USB Memory Attacks"
  abstraction "Detailed"
  status "Draft"
  description "An adversary loads malicious code onto a USB memory stick in order to infect any system which the device is plugged in to. USB drives present a significant security risk for business and government agencies. Given the ability to integrate wireless functionality into a USB stick, it is possible to design malware that not only steals confidential data, but sniffs the network, or monitor keystrokes, and then exfiltrates the stolen data off-site via a Wireless connection. Also, viruses can be transmitted via the USB interface without the specific use of a memory stick. The attacks from USB devices are often of such sophistication that experts conclude they are not the work of single individuals, but suggest state sponsorship. These attacks can be performed by an adversary with direct access to a target system or can be executed via means such as USB Drop Attacks."
  likelihood "Low"
  severity "High"
  related_attack_patterns [
    capec_id "456"
    nature "ChildOf"
  ]
  related_attack_patterns [
    capec_id "529"
    nature "CanPrecede"
  ]
  prerequisites "Some level of physical access to the device being attacked."
  prerequisites "Information pertaining to the target organization on how to best execute a USB Drop Attack."
  skills_required "[]"
  resources_required "[]"
  consequences "[]"
  mitigations "Ensure that proper, physical system access is regulated to prevent an adversary from physically connecting a malicious USB device themself."
  mitigations "Use anti-virus and anti-malware tools which can prevent malware from executing if it finds its way onto a target system. Additionally, make sure these tools are regularly updated to contain up-to-date virus and malware signatures."
  mitigations "Do not connect untrusted USB devices to systems connected on an organizational network. Additionally, use an isolated testing machine to validate untrusted devices and confirm malware does not exist."
  example_instances "[]"
  related_weaknesses "_networkx_list_start"
  related_weaknesses "1299"
  matched_cwes "_networkx_list_start"
  matched_cwes "1299"
  taxonomy_mappings [
    taxonomy_name "ATTACK"
    entry_id "1091"
    entry_name "Replication Through Removable Media"
  ]
  taxonomy_mappings [
    taxonomy_name "ATTACK"
    entry_id "1092"
    entry_name "Communication Through Removable Media"
  ]
  execution_flow [
    step "1"
    phase "Explore"
    description "[Determine Target System] In certain cases, the adversary will explore an organization's network to determine a specific target machine to exploit based on the information it contains or privileges the main user may possess."
    techniques "_networkx_list_start"
    techniques "If needed, the adversary explores an organization's network to determine if any specific systems of interest exist."
  ]
  execution_flow [
    step "2"
    phase "Experiment"
    description "[Develop or Obtain malware and install on a USB device] The adversary develops or obtains the malicious software necessary to exploit the target system, which they then install on an external USB device such as a USB flash drive."
    techniques "_networkx_list_start"
    techniques "The adversary can develop or obtain malware for to perform a variety of tasks such as sniffing network traffic or monitoring keystrokes."
  ]
  execution_flow [
    step "3"
    phase "Exploit"
    description "[Connect or deceive a user into connecting the infected USB device] Once the malware has been placed on an external USB device, the adversary connects the device to the target system or deceives a user into connecting the device to the target system such as in a USB Drop Attack."
    techniques "_networkx_list_start"
    techniques "The adversary connects the USB device to a specified target system or performs a USB Drop Attack, hoping a user will find and connect the USB device on their own. Once the device is connected, the malware executes giving the adversary access to network traffic, credentials, etc."
  ]
  node [
    id 0
    label "explore_an_organization_s_network"
  ]
  node [
    id 1
    label "connect_the_usb_device"
  ]
  edge [
    source 0
    target 1
  ]
  edge [
    source 1
    target 1
  ]
]
