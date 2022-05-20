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

  sha     = "dbf5e0cf134bf68bb5746af7f0f760e12580eb3fc128b84120d662a7fba65a5c"
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
