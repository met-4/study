locals {
  node = [
    {
      rolearn  = "arn:aws:iam::144149479695:role/Jeewoong-k8s-infra-node-role"
      username = "system:node:{{EC2PrivateDNSName}}"
      groups = [
        "system:bootstrappers",
        "system:nodes"
      ]
    }
  ]

  adminrole = [
    {
      rolearn  = "arn:aws:iam::144149479695:role/Jeewoong-k8s-infra-admin-role"
      username = "Jeewoong-k8s-infra-admin-role"
      groups   = ["system:masters"]
    }
  ]

  aws-auth-data = {
    mapRoles = yamlencode(concat(local.node, local.adminrole))
  }
}
