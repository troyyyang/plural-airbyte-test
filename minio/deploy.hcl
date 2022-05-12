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

  sha     = "h1:o7atsjTNFN5er7Mm7U4b5MxsCJ/oQOPWgk/BoCL1EXM="
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

  sha     = "h1:o7atsjTNFN5er7Mm7U4b5MxsCJ/oQOPWgk/BoCL1EXM="
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

  sha     = "h1:o7atsjTNFN5er7Mm7U4b5MxsCJ/oQOPWgk/BoCL1EXM="
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

  sha     = "7a26a4ee994765f24fb2ee5c469085a07e0462ada36d6654ce3c0efc2ea4849a"
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

  sha     = "h1:rHkkhAt4fb5MmyMCrQ7uHjxg2Why7BbZ5lkVHwlbnlQ="
  retries = 1
  verbose = false
}
