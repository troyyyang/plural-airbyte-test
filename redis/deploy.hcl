metadata {
  path = "redis"
  name = "deploy"
}

step "terraform-init" {
  wkdir   = "redis/terraform"
  target  = "redis/terraform"
  command = "terraform"

  args = [
    "init",
    "-upgrade",
  ]

  sha     = "h1:oNaRzo+phNyZaQIFXPzYyaLXZfoOagqyswfYrf6dvfo="
  retries = 0
  verbose = false
}

step "terraform-apply" {
  wkdir   = "redis/terraform"
  target  = "redis/terraform"
  command = "terraform"

  args = [
    "apply",
    "-auto-approve",
  ]

  sha     = "h1:oNaRzo+phNyZaQIFXPzYyaLXZfoOagqyswfYrf6dvfo="
  retries = 1
  verbose = false
}

step "terraform-output" {
  wkdir   = "redis"
  target  = "redis/terraform"
  command = "plural"

  args = [
    "output",
    "terraform",
    "redis",
  ]

  sha     = "h1:oNaRzo+phNyZaQIFXPzYyaLXZfoOagqyswfYrf6dvfo="
  retries = 0
  verbose = false
}

step "kube-init" {
  wkdir   = "redis"
  target  = "redis/.plural/NONCE"
  command = "plural"

  args = [
    "wkspace",
    "kube-init",
  ]

  sha     = "71ce1da4c694f4182e5aa290a28c404e32f3b09deeeaf0bad03f76cff785cbec"
  retries = 0
  verbose = false
}

step "crds" {
  wkdir   = "redis"
  target  = "redis/crds"
  command = "plural"

  args = [
    "wkspace",
    "crds",
    "redis",
  ]

  sha     = "h1:47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU="
  retries = 0
  verbose = false
}

step "bounce" {
  wkdir   = "redis"
  target  = "redis/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm",
    "redis",
  ]

  sha     = "h1:Mil7ZK9K2WvvQTKcZB5n2LRDqyEiGJbkTMo5VOQBdXs="
  retries = 1
  verbose = false
}
