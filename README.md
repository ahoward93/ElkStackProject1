## Automated ELK Stack Deployment

The files in this repository were used to configure the network depicted below.

[ELK Stack diagram from Azure Topology] <img width="913" alt="ELKStack_Diagram" src="https://user-images.githubusercontent.com/76796692/118374123-659e8780-b588-11eb-82a5-9a199170fb83.PNG">
>

These files have been tested and used to generate a live ELK deployment on Azure. They can be used to either recreate the entire deployment pictured above. Alternatively, select portions of the deployment file may be used to install only certain pieces of it, such as Filebeat.

  Playbooks used for the project are saved as .txt as .yml is not supported by git hub to deploy the files you will need to change the file extension back to .yml when saving onto the Linux box.  

Playbook one is used to install docker, apache, python, and docker container DVWA on the webserver VMs
  
[1_RedTeam-playbook.txt](https://github.com/ahoward93/ElkStackProject1/files/6488011/1_RedTeam-playbook.txt)
  
Playbook two is used to configure the ELKVM with docker, python, and docker container module sebp/elk:761
  
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

Load balancing ensures that the application will be highly available and restrict access to the network.
What aspect of security do load balancers protect? 
Load balancers allow traffic to be spread across multiple machines giving the users a highly available application, because of the load balancer working across multiple machines we have redundancy if a machine needs to be brought down for maintenance.   We also can accommodate increased traffic, which could be from a denial of service attack or an increase in customer traffic.  

What is the advantage of a jump box?

The jump box with docker and ansible installed provides us an administration machine.  This administration machine allows us to deploy new applications and container modules as well as update all of our machines simultaneously.  The jump box also allows for there to be limited interaction between the public internet and the virtual machines. 

Integrating an ELK server allows users to easily monitor the vulnerable VMs for changes to the applications and system logs.

What does Filebeat watch for?  Filebeat watches for log files, it collects the log events and forwards them for indexing. 

What does Metricbeat record? Metricbeat collects metrics from the operating system and the services running on the server. 

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

Machines within the network can only be accessed by the jump box via SSH port 22 from the whitelisted IP address 99.36.181.143. The jump box can also access the ELK VM.  The load balancer is also exposed to the public internet. 


A summary of the access policies in place can be found in the table below.


| Name         | Publicly Accessible | Allowed IP Addresses   |
|--------------|---------------------|------------------------|
| Jump Box     | No                  | 10.0.0.4/52.188.65.205 |
| Web 1        | No                  | 10.0.0.7               |
| Web 2        | No                  | 10.0.0.8               |
| Web 3        | No                  | 10.0.0.9               |
| ELK VM       | No                  | 10.2.0.4/104.214.68.93 |
|Load Balancer | Yes                 | 40.117.158.16          |

### Elk Configuration

Ansible was used to automate the configuration of the ELK machine. No configuration was performed manually, which is advantageous because it provides a one-step deployment for the ELK VM.  It also allows you to recreate the deployment as needed on other machines. 

The playbook implements the following tasks:
- Install docker.io
- Install python2-pip
- Increase memory 
- Run sebp/elk:761 container and specify published ports 

The following screenshot displays the result of running `docker ps` after successfully configuring the ELK instance.

<img width="546" alt="ELK docker install" src="https://user-images.githubusercontent.com/76796692/118411421-702d4f80-b662-11eb-9dfd-7fb7af727b5d.PNG">

### Target Machines & Beats
This ELK server is configured to monitor the following machines:

| Name         | Private IP Addresses|
|--------------|---------------------|
| Web 1        | 10.0.0.7            |
| Web 2        | 10.0.0.8            |
| Web 3        | 10.0.0.9            |

We have installed the following Beats on these machines:
Filebeat
Metricbeat

These Beats allow us to collect the following information from each machine:
-Filebeat
-Metricbeat`Winlogbeat` collects Windows logs, which we use to track user logon events, etc._

### Using the Playbook
To use the playbook, you will need to have an Ansible control node already configured. Assuming you have such a control node provisioned: 

SSH into the control node and follow the steps below:
- Copy the ELKInstall-playbook.yml file to the directory /etc/ansible/files on your jump box. (make a files directory if you do not already have one)
- Update the host file to include your Webserver VM private IP addresses and  ELK VM private IP address see the example below:
      [webservers] ##needed for the RedTeam, filebeat, and metricbeat playbooks
      10.0.0.7 ansible_python_interpreter=/usr/bin/python3 
      10.0.0.8 ansible_python_interpreter=/usr/bin/python3
      10.0.0.9 ansible_python_interpreter=/usr/bin/python3

       [elk] ##needed for the ElkInstall playbook
       10.2.0.4 ansible_python_interpreter=/usr/bin/python3

- Run the playbook by using the following code ansible-playbook ELKInstall-playbook.yml and navigate to your ELK VM through SSH to check that the installation worked as expected.
-Run sudo docker ps 
-Navigate to your ELK server public IP address followed by :5601/app.kibana#home to confirm the ELK Server is running http://104.214.68.93:5601/app/kibana#/home
### Useful commands
-Run from inside ansible container /etc/ansible/files
-pulls from github into /etc/ansible/files (make a files directory if you don't have one already

curl -LO https://github.com/ahoward93/ElkStackProject1/files/6488011/1_RedTeam-playbook.txt

-renames txt file to yml file

mv 1_RedTeam-playbook.txt RedTeam-playbook.yml

-pulls from github elk install playbook

curl -LO https://github.com/ahoward93/ElkStackProject1/files/6488013/2_ELKInstall-playbook.txt

-rename to yml file 

mv 2_ELKInstall-playbook.txt ELKInstall-playbook.yml

-pulls from github filebeat playbook

curl -LO https://github.com/ahoward93/ElkStackProject1/files/6488014/3_Filebeat-playbook.txt

-rename to yml file

mv 3_Filebeat-playbook.txt Filebeat-playbook.yml

-pulls freom github metricbeat playbook

curl -LO https://github.com/ahoward93/ElkStackProject1/files/6488015/4_Metricbeat-playbook.txt

-rename to yml file 

mv 4_Metricbeat-playbook.txt Metricbeat-playbook.yml

-To run the playbook you want by using the command ansible-playbook playbookname.yml
