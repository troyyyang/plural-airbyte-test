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

  sha     = "h1:mlFaSez2eSwIuf1t8F2jh1WHrpo5+9LWzYuN47FcrxA="
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

  sha     = "h1:mlFaSez2eSwIuf1t8F2jh1WHrpo5+9LWzYuN47FcrxA="
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

  sha     = "h1:mlFaSez2eSwIuf1t8F2jh1WHrpo5+9LWzYuN47FcrxA="
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

  sha     = "725bd2b0b97e17cbe9f45d0471400787fd8e7bd6df4f7e11f23084b4d9594275"
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

  sha     = "h1:+dMRGeynz81NMPmD6PbXrqH+hck6GuEVMXDTe+WFe7M="
  retries = 1
  verbose = false
}
