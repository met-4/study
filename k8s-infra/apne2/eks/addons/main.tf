resource "aws_eks_addon" "addons" {
  for_each = local.addon_list


  cluster_name = data.terraform_remote_state.eks.outputs.eks_id
  addon_name                  = each.key
  addon_version               = lookup(each.value, "addon_version", null)
  resolve_conflicts_on_update = lookup(each.value, "resolve_conflicts_on_update", null)
  service_account_role_arn    = lookup(each.value, "service_account_role_arn", null)
}
