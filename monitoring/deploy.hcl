metadata {
  path = "monitoring"
  name = "deploy"
}

step "terraform-init" {
  wkdir   = "monitoring/terraform"
  target  = "monitoring/terraform"
  command = "terraform"

  args = [
    "init",
    "-upgrade",
  ]

  sha     = "h1:UhO8+pvAuocgDa/RkI1JWRodW0KvtXtvOLnUiCN7M3I="
  retries = 0
  verbose = false
}

step "terraform-apply" {
  wkdir   = "monitoring/terraform"
  target  = "monitoring/terraform"
  command = "terraform"

  args = [
    "apply",
    "-auto-approve",
  ]

  sha     = "h1:UhO8+pvAuocgDa/RkI1JWRodW0KvtXtvOLnUiCN7M3I="
  retries = 1
  verbose = false
}

step "terraform-output" {
  wkdir   = "monitoring"
  target  = "monitoring/terraform"
  command = "plural"

  args = [
    "output",
    "terraform",
    "monitoring",
  ]

  sha     = "h1:UhO8+pvAuocgDa/RkI1JWRodW0KvtXtvOLnUiCN7M3I="
  retries = 0
  verbose = false
}

step "kube-init" {
  wkdir   = "monitoring"
  target  = "monitoring/.plural/NONCE"
  command = "plural"

  args = [
    "wkspace",
    "kube-init",
  ]

  sha     = "5175c21233504e58b46f8336110284a2aaf4acc4d54752dd483b3bee351a784d"
  retries = 0
  verbose = false
}

step "crds" {
  wkdir   = "monitoring"
  target  = "monitoring/crds"
  command = "plural"

  args = [
    "wkspace",
    "crds",
    "monitoring",
  ]

  sha     = "h1:2uZZjww2jPGQCg0m3pDOu9HOuIbNZUe8Ll8m3n1J2Zs="
  retries = 0
  verbose = false
}

step "bounce" {
  wkdir   = "monitoring"
  target  = "monitoring/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm",
    "monitoring",
  ]

  sha     = "h1:x+zWFxrdvVvJaLgD4DzmyghoA2oD5uNX4p4jwyx432U="
  retries = 1
  verbose = false
}
