terraform {
  backend "remote" {
    hostname     = "app.terraform.io"
    organization = "Suwoong-admin"

    workspaces {
      name = "manager_apne2"
    }
  }
}
