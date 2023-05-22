#!/bin/bash
set -xe

cd docker-project/Terraform

sed -i "s/server_name/${SERVER_NAME}/g" backend.tf
export TF_VAR_name=${SERVER_NAME}

terraform init
terraform plan
terraform $TERRAFORM_ACTION -auto-approve

sleep 120

if [ $TERRAFORM_ACTION = "destroy" ]; then
  exit 0
else
  cd ../Ansible
  ansible-playbook -i /opt/ansible/inventory/aws_ec2.yaml apache.yaml 
fi
