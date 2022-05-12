metadata {
  path = "superset"
  name = "diff"
}

step "terraform-init" {
  wkdir   = "superset/terraform"
  target  = "superset/terraform"
  command = "terraform"
  args    = ["init"]
  sha     = "h1:6B3rNNUM31qgozMJRsbS21NhhlZqjHt24Lr3rPUW248="
  retries = 0
  verbose = false
}

step "terraform" {
  wkdir   = "superset/terraform"
  target  = "superset/terraform"
  command = "plural"

  args = [
    "wkspace",
    "terraform-diff",
    "superset",
  ]

  sha     = "h1:6B3rNNUM31qgozMJRsbS21NhhlZqjHt24Lr3rPUW248="
  retries = 0
  verbose = false
}

step "kube-init" {
  wkdir   = "superset"
  target  = "superset/.plural/NONCE"
  command = "plural"

  args = [
    "wkspace",
    "kube-init",
    "superset",
  ]

  sha     = "bf79c21811f4ff92b28a91426ce38f925a8ba00ac6dd112a652c861b93a75fd9"
  retries = 0
  verbose = false
}

step "helm" {
  wkdir   = "superset/helm"
  target  = "superset/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm-diff",
    "superset",
  ]

  sha     = "h1:cT42S2SGN3Wh0yZFvVDNNyk7YD22c3R+47JL0MapsHI="
  retries = 0
  verbose = false
}
