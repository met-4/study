data "terraform_remote_state" "eks" {
  backend = "remote"

  config = {
    organization = "Suwoong-admin"

    workspaces = {
      name = "k8s-infra_apne2_eks"
    }
  }
}
