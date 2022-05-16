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

  sha     = "e7f5f99a018ba7bb4075702a3db80a192d30cb6de34697698f65c0ebfe3407d3"
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
