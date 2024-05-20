locals {
  apne2_ws = {
    for k, v in data.tfe_workspace_ids.apne2.ids : k => v
  }
}