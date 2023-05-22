
## Installing Jenkins on AL2 EC2
```
sudo yum update –y

sudo wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat-stable/jenkins.repo

sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io-2023.key

sudo yum upgrade

sudo amazon-linux-extras install java-openjdk11 -y

sudo yum install jenkins -y

sudo systemctl enable jenkins

sudo systemctl start jenkins

sudo systemctl status jenkins


sudo cat /var/lib/jenkins/secrets/initialAdminPassword
```

## Installing Ansible on AL2 EC2
```
sudo yum update

sudo amazon-linux-extras install ansible2

ansible --version
```

## Installing AWS EC2 Dynamic Inventory
```
python3 --version

sudo yum install python3 -y
sudo yum -y install python-pip

sudo pip install boto3

sudo mkdir -p /opt/ansible/inventory
cd /opt/ansible/inventory
```
> sudo vi aws_ec2.yaml
```
---
plugin: aws_ec2


regions:
  - ap-south-1
filters:

  tag:Environment: prod
  ```
  
>Add following in /etc/ansible/ansible.cfg
```
[inventory]
enable_plugins = aws_ec2

[default]
inventory = /opt/ansible/inventory/aws_ec2.yml
host_key_checking = False
```
ansible-inventory -i /opt/ansible/inventory/aws_ec2.yaml --list
  
