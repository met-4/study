locals {

  user_data = <<-EOF
  #!/bin/bash -xe

  sed -i 's/#Port 22/Port 2024/' /etc/ssh/sshd_config
  systemctl restart sshd

  user=k8s-admin
  usermod  -l $user ec2-user
  groupmod -n $user ec2-user
  usermod  -d /home/$user -m $user
  sed -i "s/ec2-user/$user/g;" /etc/sudoers.d/90-cloud-init-users

  yum update -y 
  yum install git -y

  curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
  unzip awscliv2.zip
  ./aws/install

  curl -O https://s3.us-west-2.amazonaws.com/amazon-eks/1.25.13/2023-09-14/bin/linux/amd64/kubectl
  chmod +x ./kubectl
  mv ./kubectl /usr/local/bin/kubectl
  echo "source <(kubectl completion bash)" >> /home/$user/.bashrc

  curl https://raw.githubusercontent.com/helm/helm/master/scripts/get-helm-3 > get_helm.sh
  chmod 700 get_helm.sh
  ./get_helm.sh
  echo "source <(helm completion bash)" >> /home/$user/.bashrc

  echo 'export PS1="\u\[\e[01;34m\]($(kubectl config current-context | grep -o "[^/]*$"))\[\e[00m\]:\w/$ "' >> /home/$user/.bashrc
  EOF
}