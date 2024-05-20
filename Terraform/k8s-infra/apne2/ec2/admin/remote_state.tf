data "terraform_remote_state" "vpc" {
  backend = "remote"

  config = {
    organization = "Suwoong-admin"

    workspaces = {
      name = "k8s-infra_apne2_network_vpc"
    }
  }
}

data "terraform_remote_state" "sg" {
  backend = "remote"

  config = {
    organization = "Suwoong-admin"

    workspaces = {
      name = "k8s-infra_apne2_network_sg"
    }
  }
}