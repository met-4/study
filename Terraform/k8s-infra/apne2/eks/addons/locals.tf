locals {
  addon_list = {
    aws-ebs-csi-driver = {
      addon_version               = "v1.27.0-eksbuild.1"
      resolve_conflicts_on_update = "PRESERVE"
      service_account_role_arn    = data.terraform_remote_state.csi-driver.outputs.csi_role_arn
    }
  }
}
