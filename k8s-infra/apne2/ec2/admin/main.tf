module "adminhost" {
  source = "../../../module/ec2/admin"

  name                   = "Jeewoong-k8s-infra"
  ami                    = var.ami
  instance_type          = var.instance_type
  key_name               = "jeewong-eks-studykey"
  subnet_id              = data.terraform_remote_state.vpc.outputs.subnet_ids[0]
  vpc_security_group_ids = [data.terraform_remote_state.sg.outputs.admin_sg_id]
  user_data_base64       = base64encode(local.user_data)

  root_volume_size = "8"
  root_volume_type = "gp3"
}
