module "sg" {
  source = "../../../module/network/sg"
  name     = "Jeewoong-k8s-infra"
  vpc_id   = data.terraform_remote_state.vpc.outputs.vpc_id
  ssh_port = var.ssh_port
  my_ip    = var.my_ip
}
