

## Automated ELK Stack Deployment

The files in this repository were used to configure the network depicted below.

ELK Stack diagram from Azure Topology showing all components of the cloud setup
<img width="913" alt="ELKStack_Diagram" src="https://user-images.githubusercontent.com/76796692/118374123-659e8780-b588-11eb-82a5-9a199170fb83.PNG">
>

 ELK Network Diagram
 ![](https://user-images.githubusercontent.com/76796692/119214854-ed5c2880-ba97-11eb-902a-b33996353481.png)




These files have been tested and used to generate a live ELK deployment on Azure. They can be used to either recreate the entire deployment pictured above. Alternatively, select portions of the deployment file may be used to install only certain pieces of it, such as Filebeat.

Playbooks used for the project are saved in the Ansbile Folder in this repository.  

Playbook one is used to install docker, apache, python, and docker container DVWA on the webserver VMs
  
[1_RedTeam-playbook.yml](https://github.com/ahoward93/ElkStackProject1/blob/main/Ansible%20Files/1_RedTeam-playbook.yml)
  
Playbook two is used to configure the ELKVM with docker, python, and docker container module sebp/elk:761

[2_ELKInstall-playbook.yml](https://github.com/ahoward93/ElkStackProject1/blob/main/Ansible%20Files2_ELKInstall-playbook.yml)
    
Playbook 3 is used to download, install, configure and start filebeat on the webserver VMs 

[3_Filebeat-playbook.yml](https://github.com/ahoward93/ElkStackProject1/blob/main/Ansible%20Files/3_Filebeat-playbook.yml)
  
Playbook 4 is used to download, install, configure and start meticbeat on the webserver VMs 

[4_Metricbeat-playbook.yml](https://github.com/ahoward93/ElkStackProject1/blob/main/Ansible%20Files/4_Metricbeat-playbook.yml)

Filebeat-Config is used in Filebeat playbook. Make changes to line number 1105 & 1805 save in container on jump box /etc/ansible/files/filebeat-config.yml
 
[5_filebeat-config.yml](https://github.com/ahoward93/ElkStackProject1/blob/main/Ansible%20Files/5_filebeat-config.yml)
 
Metricbeat-config is used in Metricbeat playbook.  Make changes to line 62 & 94 save in container on jump box /etc/ansible/files/metircbeat-config.yml
 
[6_metricbeat_config.yml](https://github.com/ahoward93/ElkStackProject1/blob/main/Ansible%20Files/6_metricbeat_config.yml)
 

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
Load balancers allow traffic to be spread across multiple machines giving the users a highly available application, because of the load balancer working across multiple machines we have redundancy if a machine needs to be brought down for maintenance.  We also can accommodate increased traffic, which could be from a denial of service attack or an increase in customer traffic.  In this example there are 3 vm machines, you can create as many vm machines as needed for your enviorment or budget.     

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

Only the jump box machine can accept connections from the internet. Access to this machine is only allowed from the following IP addresses:
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
- Filebeat is a log shipper that forwards and centralizes log data
- Metricbeat is a log shipper installed on your servers to periodically collect metrics from the operating system and from services running on the server

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

- Run the playbook by using the following code  

ansible-playbook ELKInstall-playbook.yml 

- Navigate to your ELK VM through SSH 

- Run sudo docker ps to check that the installation worked as expected

- Navigate to your ELK server <http://ELKPublicIP:5601/app.kibana#home> to confirm the ELK Server is running 
### Useful commands
- Run from inside ansible container /etc/ansible/files

- Pulls from github into /etc/ansible/files (make a files directory if you don't have one already

  ```curl -LO https://github.com/ahoward93/ElkStackProject1/blob/main/Ansible%20Files/1_RedTeam-playbook.yml ```

- Pulls from github elk install playbook

  ```curl -LO https://github.com/ahoward93/ElkStackProject1/blob/main/Ansible%20Files/2_ELKInstall-playbook.yml```

- Pulls from github filebeat playbook

  ```curl -LO https://github.com/ahoward93/ElkStackProject1/blob/main/Ansible%20Files/3_Filebeat-playbook.yml```

- Pulls freom github metricbeat playbook

  ```curl -LO https://github.com/ahoward93/ElkStackProject1/blob/main/Ansible%20Files/4_Metricbeat-playbook.yml```

- Pulls filebeat-config file needed before you can run 3_Filebeat-playbook (Remember to change to your ip address)

  ```curl -LO https://github.com/ahoward93/ElkStackProject1/blob/main/Ansible%20Files/5_filebeat-config.yml```

- Pulls metricbeat-config file needed before you can run 4_Metricbeat-playbook (Remember to changes to your ip address)

  ```curl -LO https://github.com/ahoward93/ElkStackProject1/blob/main/Ansible%20Files/6_metricbeat_config.yml```
 
- Helpful Container code
  -  list container
  
     ```sudo docker container list -a```
    
  -  start container
  
    ```sudo docker container start (container name or container id)```
  
  -  attach container    (container name or container id)
  
     ```sudo docker container attach (container name or container id)```
  
- To run the playbook you want by using the ansible command
    ```ansible-playbook playbookname.yml```

