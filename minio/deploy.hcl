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

  sha     = "h1:lHF2N1jaBuoa7wqPOIbnskwUVeUAgV99+2uv5Zn3Jw8="
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

  sha     = "h1:lHF2N1jaBuoa7wqPOIbnskwUVeUAgV99+2uv5Zn3Jw8="
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

  sha     = "h1:lHF2N1jaBuoa7wqPOIbnskwUVeUAgV99+2uv5Zn3Jw8="
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

  sha     = "77aac755e7caf534c4e4736809cb5d7027352cc27afbd26b54f0c817fd15e3bb"
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

  sha     = "h1:s70x2Gc5ZJKTy5tlnF6o940svL2YyMaanjcJBSuK9uA="
  retries = 1
  verbose = false
}
