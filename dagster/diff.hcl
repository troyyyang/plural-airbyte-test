metadata {
  path = "dagster"
  name = "diff"
}

step "terraform-init" {
  wkdir   = "dagster/terraform"
  target  = "dagster/terraform"
  command = "terraform"
  args    = ["init"]
  sha     = ""
  retries = 0
  verbose = false
}

step "terraform" {
  wkdir   = "dagster/terraform"
  target  = "dagster/terraform"
  command = "plural"

  args = [
    "wkspace",
    "terraform-diff",
    "dagster",
  ]

  sha     = ""
  retries = 0
  verbose = false
}

step "kube-init" {
  wkdir   = "dagster"
  target  = "dagster/.plural/NONCE"
  command = "plural"

  args = [
    "wkspace",
    "kube-init",
    "dagster",
  ]

  sha     = ""
  retries = 0
  verbose = false
}

step "helm" {
  wkdir   = "dagster/helm"
  target  = "dagster/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm-diff",
    "dagster",
  ]

  sha     = ""
  retries = 0
  verbose = false
}
