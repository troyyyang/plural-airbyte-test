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

  sha     = "h1:exc3TNveRbNWEK/AldiZixpbQFGb/XweCobNjYYping="
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

  sha     = "h1:exc3TNveRbNWEK/AldiZixpbQFGb/XweCobNjYYping="
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

  sha     = "h1:exc3TNveRbNWEK/AldiZixpbQFGb/XweCobNjYYping="
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

  sha     = "14c34ae2cf1a3ea1f2393789e889ad6339062b07416e5e9b0862ea2e92576fd6"
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

  sha     = "h1:2B4nSJkfN20lkEXXyuLyr+NZPhyncFvoL5fReVzgFeI="
  retries = 1
  verbose = false
}