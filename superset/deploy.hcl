metadata {
  path = "superset"
  name = "deploy"
}

step "terraform-init" {
  wkdir   = "superset/terraform"
  target  = "superset/terraform"
  command = "terraform"

  args = [
    "init",
    "-upgrade",
  ]

  sha     = "h1:6B3rNNUM31qgozMJRsbS21NhhlZqjHt24Lr3rPUW248="
  retries = 0
  verbose = false
}

step "terraform-apply" {
  wkdir   = "superset/terraform"
  target  = "superset/terraform"
  command = "terraform"

  args = [
    "apply",
    "-auto-approve",
  ]

  sha     = "h1:6B3rNNUM31qgozMJRsbS21NhhlZqjHt24Lr3rPUW248="
  retries = 1
  verbose = false
}

step "terraform-output" {
  wkdir   = "superset"
  target  = "superset/terraform"
  command = "plural"

  args = [
    "output",
    "terraform",
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
  ]

  sha     = "bf79c21811f4ff92b28a91426ce38f925a8ba00ac6dd112a652c861b93a75fd9"
  retries = 0
  verbose = false
}

step "crds" {
  wkdir   = "superset"
  target  = "superset/crds"
  command = "plural"

  args = [
    "wkspace",
    "crds",
    "superset",
  ]

  sha     = "h1:47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU="
  retries = 0
  verbose = false
}

step "bounce" {
  wkdir   = "superset"
  target  = "superset/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm",
    "superset",
  ]

  sha     = "h1:cT42S2SGN3Wh0yZFvVDNNyk7YD22c3R+47JL0MapsHI="
  retries = 1
  verbose = false
}
