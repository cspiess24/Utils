Run terraform to spin up an AWS instance. 

Then run Ansible to configure the AWS instance. 

`ansible-playbook -i <AWS_IP_FROM_TF>, main.yaml -u centos -v -e "gituser=<GIT_USER> gitpassword=<GIT_PASSWORD>"`
