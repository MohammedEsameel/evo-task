# evo-task
First: You must execute the prepare.sh file by using "./prepare.sh" , this scripts will install and prepare Host with this items:
        - Epel-Release Repo installation
        - VirtualBox Required Packages installation
        - VirtualBox Installation
        - Vagrant Installation 
        - Ansible Installation
        
Second: Find Bash Script “project.sh” 
  - Execute the script with arguments [all | kafka | kub | app]
  - You must execute the script with argument that you need to install
  - Ex: ./project.sh all
  - The example above will starting creating vm and their provisioning and staring with 
    Kafka then K8S cluster and finally will create the monitor servers by deploying 
    producer and consumer first then will deploy Prometheus and Grafana
    
Third: Find Bash Script "remove.sh"
   - It's the same work of project.sh but it will remove the args that will take instead of installing it. 
    
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
Commands:
git clone https://github.com/MohammedEsameel/evo-task
