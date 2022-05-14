metadata {
  path = "vault"
  name = "diff"
}

step "terraform-init" {
  wkdir   = "vault/terraform"
  target  = "vault/terraform"
  command = "terraform"
  args    = ["init"]
  sha     = ""
  retries = 0
  verbose = false
}

step "terraform" {
  wkdir   = "vault/terraform"
  target  = "vault/terraform"
  command = "plural"

  args = [
    "wkspace",
    "terraform-diff",
    "vault",
  ]

  sha     = ""
  retries = 0
  verbose = false
}

step "kube-init" {
  wkdir   = "vault"
  target  = "vault/.plural/NONCE"
  command = "plural"

  args = [
    "wkspace",
    "kube-init",
    "vault",
  ]

  sha     = ""
  retries = 0
  verbose = false
}

step "helm" {
  wkdir   = "vault/helm"
  target  = "vault/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm-diff",
    "vault",
  ]

  sha     = ""
  retries = 0
  verbose = false
}
