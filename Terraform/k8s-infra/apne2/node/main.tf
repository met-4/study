module "node" {
  source = "../../module/node"

  name               = "Jeewoong-k8s-infra"
  eks_name           = data.terraform_remote_state.eks.outputs.eks_id
  security_group_ids = [data.terraform_remote_state.sg.outputs.node_sg_id]
  key_name           = "jeewong-eks-studykey"
  ami_id             = var.ami_id
  instance_type      = var.instance_type

  eks_ca             = data.terraform_remote_state.eks.outputs.eks_ca_certificate
  apiserver_endpoint = data.terraform_remote_state.eks.outputs.eks_endpoint

  volume_encrypted = true
  volume_size      = var.volume_size
  volume_type      = var.volume_type

  min_size          = 1
  max_size          = 5
  desired_capacity  = 1
  subnet_ids        = [data.terraform_remote_state.vpc.outputs.subnet_ids[0], data.terraform_remote_state.vpc.outputs.subnet_ids[1]]
  health_check_type = var.health_check_type
}
