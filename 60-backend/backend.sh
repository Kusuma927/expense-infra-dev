#!/bin/bash
dnf install ansible -y
## This is for push
#ansible-playbook -i inventory mysql.yaml

## This is for pull
ansible-pull  -i localhost, -U https://github.com/DAWS-82S/expense-ansible-roles-tf.git main.yaml -e COMPONENT=backend -e ENVIRONMENT=$1
