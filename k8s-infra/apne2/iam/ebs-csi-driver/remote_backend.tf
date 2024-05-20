terraform {
  backend "remote" {
    hostname     = "app.terraform.io"
    organization = "Suwoong-admin"

    workspaces {
      name = "k8s-infra_apne2_iam_ebs-csi-driver"
    }
  }
}
