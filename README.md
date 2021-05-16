

## Automated ELK Stack Deployment

The files in this repository were used to configure the network depicted below.

[ELK Stack diagram] <img width="913" alt="ELKStack_Diagram" src="https://user-images.githubusercontent.com/76796692/118374123-659e8780-b588-11eb-82a5-9a199170fb83.PNG">
>

These files have been tested and used to generate a live ELK deployment on Azure. They can be used to either recreate the entire deployment pictured above. Alternatively, select portions of the deployment file may be used to install only certain pieces of it, such as Filebeat.

  Playbooks used for project (files are saved as .txt as .yml is not supported by git hub)
  Playbook one is used to install docker, apache, python and docker container DVWA on the webserver VMs
  
[1_RedTeam-playbook.txt](https://github.com/ahoward93/ElkStackProject1/files/6488011/1_RedTeam-playbook.txt)
  
  Playbook two is used to configure the ELKVM with docker, python and docker container module sebp/elk:761
  
[2_ELKInstall-playbook.txt](https://github.com/ahoward93/ElkStackProject1/files/6488013/2_ELKInstall-playbook.txt)
  
  Playbook 3 is used to download, install, configure and start filebeat on the webserver VMs 

[3_Filebeat-playbook.txt](https://github.com/ahoward93/ElkStackProject1/files/6488014/3_Filebeat-playbook.txt)
  
  Playbook 4 is used to download, install, configure and start meticbeat on the webserver VMs 

[4_Metricbeat-playbook.txt](https://github.com/ahoward93/ElkStackProject1/files/6488015/4_Metricbeat-playbook.txt)
 
  

This document contains the following details:
- Description of the Topology
- Access Policies
- ELK Configuration
  - Beats in Use
  - Machines Being Monitored
- How to Use the Ansible Build


### Description of the Topology

The main purpose of this network is to expose a load-balanced and monitored instance of DVWA, the D*mn Vulnerable Web Application.

Load balancing ensures that the application will be highly available, in addition to restricting access to the network.
What aspect of security do load balancers protect? 
Load balancers allow traffic to be spread accross multiple machines giving the users a highly available application, because of the load balancer working accross multiple machines we have redundency if a machine needs to be brought down for maintenance.   We also have the ability to accomidated increased traffic which could be from a denial of service attack or an increase in customer traffic.  

What is the advantage of a jump box?

The jump box with docker and ansible installed provide us an administration machine.  This administration machine allows us to deploy new applications and container modules as well as update all of our machines simultaniously.  The jump box also alows for there to be limited interaction between the public internet and the virtual machines. 

Integrating an ELK server allows users to easily monitor the vulnerable VMs for changes to the applications and system logs.

What does Filebeat watch for?  Filebeat watches for log files, it collects the log events and forwards them for indexing. 

What does Metricbeat record? Metricbeat collects metrics from the operating system and from servies running on the server. 

The configuration details of each machine may be found below.

| Name      | Function       | IP Address | Operating System |
|---------- |--------------- |------------|------------------|
| Jump Box  | Gateway        | 10.0.0.4   | Linux            |
| Web 1     | VM             | 10.0.0.7   | Linux            |
| Web 2     | VM             | 10.0.0.8   | Linux            |
| Web 3     | VM             | 10.0.0.9   | Linux            |
| ELK Stack | System Monitor | 10.2.0.4   | Linux            |

### Access Policies

The machines on the internal network are not exposed to the public Internet. 

Only the jump box machine can accept connections from the Internet. Access to this machine is only allowed from the following IP addresses:
99.36.181.143.  

Machines within the network can only be accessed by the jumpbox via SSH port 22 from the whitelisted IP address 99.36.181.143. The jumpbox can also access the ELK VM.  The load balancer is also exposed to the public internet. 


A summary of the access policies in place can be found in the table below.

| Name         | Publicly Accessible | Allowed IP Addresses   |
|--------------|---------------------|------------------------|
| Jump Box     | NO                  | 10.0.0.4/52.188.65.205 |
| Web 1        | No                  | 10.0.0.7               |
| Web 2        | No                  | 10.0.0.8               |
| Web 3        | No                  | 10.0.0.9               |
| ELK VM       | No                  | 10.2.0.4/104.214.68.93 |
|Load Balancer | Yes                 | 40.117.158.16          |

### Elk Configuration

Ansible was used to automate configuration of the ELK machine. No configuration was performed manually, which is advantageous because...
- _TODO: What is the main advantage of automating configuration with Ansible?_

The playbook implements the following tasks:
- _TODO: In 3-5 bullets, explain the steps of the ELK installation play. E.g., install Docker; download image; etc._
- ...
- ...

The following screenshot displays the result of running `docker ps` after successfully configuring the ELK instance.

![TODO: Update the path with the name of your screenshot of docker ps output](Images/docker_ps_output.png)

### Target Machines & Beats
This ELK server is configured to monitor the following machines:
- _TODO: List the IP addresses of the machines you are monitoring_

We have installed the following Beats on these machines:
- _TODO: Specify which Beats you successfully installed_

These Beats allow us to collect the following information from each machine:
- _TODO: In 1-2 sentences, explain what kind of data each beat collects, and provide 1 example of what you expect to see. E.g., `Winlogbeat` collects Windows logs, which we use to track user logon events, etc._

### Using the Playbook
In order to use the playbook, you will need to have an Ansible control node already configured. Assuming you have such a control node provisioned: 

SSH into the control node and follow the steps below:
- Copy the _____ file to _____.
- Update the _____ file to include...
- Run the playbook, and navigate to ____ to check that the installation worked as expected.

_TODO: Answer the following questions to fill in the blanks:_
- _Which file is the playbook? Where do you copy it?_
- _Which file do you update to make Ansible run the playbook on a specific machine? How do I specify which machine to install the ELK server on versus which to install Filebeat on?_
- _Which URL do you navigate to in order to check that the ELK server is running?

_As a **Bonus**, provide the specific commands the user will need to run to download the playbook, update the files, etc._
