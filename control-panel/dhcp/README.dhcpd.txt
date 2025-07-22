
sre@k8s-controller-01:~$ sudo apt-get install -y isc-dhcp-server
[sudo] password for sre: 
Reading package lists... Done
Building dependency tree... Done
Reading state information... Done
The following additional packages will be installed:
  isc-dhcp-common
Suggested packages:
  isc-dhcp-server-ldap policycoreutils
The following NEW packages will be installed:
  isc-dhcp-common isc-dhcp-server
0 upgraded, 2 newly installed, 0 to remove and 7 not upgraded.
Need to get 1,281 kB of archives.
After this operation, 4,281 kB of additional disk space will be used.
Get:1 http://us.archive.ubuntu.com/ubuntu noble/universe amd64 isc-dhcp-server amd64 4.4.3-P1-4ubuntu2 [1,236 kB]
Get:2 http://us.archive.ubuntu.com/ubuntu noble/universe amd64 isc-dhcp-common amd64 4.4.3-P1-4ubuntu2 [45.8 kB]
Fetched 1,281 kB in 1s (968 kB/s)          
Preconfiguring packages ...
Selecting previously unselected package isc-dhcp-server.
(Reading database ... 99853 files and directories currently installed.)
Preparing to unpack .../isc-dhcp-server_4.4.3-P1-4ubuntu2_amd64.deb ...
Unpacking isc-dhcp-server (4.4.3-P1-4ubuntu2) ...
Selecting previously unselected package isc-dhcp-common.
Preparing to unpack .../isc-dhcp-common_4.4.3-P1-4ubuntu2_amd64.deb ...
Unpacking isc-dhcp-common (4.4.3-P1-4ubuntu2) ...
Setting up isc-dhcp-server (4.4.3-P1-4ubuntu2) ...
Generating /etc/default/isc-dhcp-server...
Created symlink /etc/systemd/system/multi-user.target.wants/isc-dhcp-server.service → /usr/lib/systemd/system/isc-dhcp-server.service.
Created symlink /etc/systemd/system/multi-user.target.wants/isc-dhcp-server6.service → /usr/lib/systemd/system/isc-dhcp-server6.service.
Setting up isc-dhcp-common (4.4.3-P1-4ubuntu2) ...
Processing triggers for man-db (2.12.0-4build2) ...
Scanning processes...                                                                                                                                
Scanning linux images...                                                                                                                             

Running kernel seems to be up-to-date.

No services need to be restarted.

No containers need to be restarted.

No user sessions are running outdated binaries.

No VM guests are running outdated hypervisor (qemu) binaries on this host.
sre@k8s-controller-01:~$ 

sre@k8s-controller-01:~$ systemctl status isc-dhcp-server
× isc-dhcp-server.service - ISC DHCP IPv4 server
     Loaded: loaded (/usr/lib/systemd/system/isc-dhcp-server.service; enabled; preset: enabled)
     Active: failed (Result: exit-code) since Tue 2024-10-29 21:54:45 UTC; 3min 42s ago
   Duration: 70ms
       Docs: man:dhcpd(8)
   Main PID: 2077 (code=exited, status=1/FAILURE)
        CPU: 22ms

Oct 29 21:54:45 k8s-controller-01 dhcpd[2077]: 
Oct 29 21:54:45 k8s-controller-01 dhcpd[2077]: Not configured to listen on any interfaces!
Oct 29 21:54:45 k8s-controller-01 dhcpd[2077]: 
Oct 29 21:54:45 k8s-controller-01 dhcpd[2077]: If you think you have received this message due to a bug rather
Oct 29 21:54:45 k8s-controller-01 dhcpd[2077]: than a configuration issue please read the section on submitting
Oct 29 21:54:45 k8s-controller-01 dhcpd[2077]: bugs on either our web page at www.isc.org or in the README file
Oct 29 21:54:45 k8s-controller-01 dhcpd[2077]: before submitting a bug.  These pages explain the proper
Oct 29 21:54:45 k8s-controller-01 dhcpd[2077]: process and the information we find helpful for debugging.
Oct 29 21:54:45 k8s-controller-01 dhcpd[2077]: 
Oct 29 21:54:45 k8s-controller-01 dhcpd[2077]: exiting.


