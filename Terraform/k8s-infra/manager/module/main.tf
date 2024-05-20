data "tfe_workspace_ids" "apne2" {
  tag_names    = ["apne2"]
  organization = "Suwoong-admin"
}

resource "tfe_variable" "apne2_access_key" {
  for_each     = local.apne2_ws
  key          = "AWS_ACCESS_KEY_ID"
  value        = var.access_key
  category     = "env"
  workspace_id = each.value
  sensitive    = true
}

resource "tfe_variable" "apne2_secret_key" {
  for_each     = local.apne2_ws
  key          = "AWS_SECRET_ACCESS_KEY"
  value        = var.secret_key
  category     = "env"
  workspace_id = each.value
  sensitive    = true
}

