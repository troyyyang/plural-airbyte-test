metadata {
  path = "minio"
  name = "deploy"
}

step "terraform-init" {
  wkdir   = "minio/terraform"
  target  = "minio/terraform"
  command = "terraform"

  args = [
    "init",
    "-upgrade",
  ]

  sha     = "h1:RyUz8pYB/lKI50Nu1MV4DaGMLX/n0OFLsoxarEtAZqE="
  retries = 0
  verbose = false
}

step "terraform-apply" {
  wkdir   = "minio/terraform"
  target  = "minio/terraform"
  command = "terraform"

  args = [
    "apply",
    "-auto-approve",
  ]

  sha     = "h1:RyUz8pYB/lKI50Nu1MV4DaGMLX/n0OFLsoxarEtAZqE="
  retries = 1
  verbose = false
}

step "terraform-output" {
  wkdir   = "minio"
  target  = "minio/terraform"
  command = "plural"

  args = [
    "output",
    "terraform",
    "minio",
  ]

  sha     = "h1:RyUz8pYB/lKI50Nu1MV4DaGMLX/n0OFLsoxarEtAZqE="
  retries = 0
  verbose = false
}

step "kube-init" {
  wkdir   = "minio"
  target  = "minio/.plural/NONCE"
  command = "plural"

  args = [
    "wkspace",
    "kube-init",
  ]

  sha     = "a943cbaccd91ccc67d98ec450cf95f5f7044be3a14b30aee65b5d7cf367d184e"
  retries = 0
  verbose = false
}

step "crds" {
  wkdir   = "minio"
  target  = "minio/crds"
  command = "plural"

  args = [
    "wkspace",
    "crds",
    "minio",
  ]

  sha     = "h1:47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU="
  retries = 0
  verbose = false
}

step "bounce" {
  wkdir   = "minio"
  target  = "minio/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm",
    "minio",
  ]

  sha     = "h1:oR12ENOkNWOTP4lq0sHMydnbyV3mUxjw2tMQJCB+xUU="
  retries = 1
  verbose = false
}
