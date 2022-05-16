metadata {
  path = "kafka"
  name = "diff"
}

step "terraform-init" {
  wkdir   = "kafka/terraform"
  target  = "kafka/terraform"
  command = "terraform"
  args    = ["init"]
  sha     = ""
  retries = 0
  verbose = false
}

step "terraform" {
  wkdir   = "kafka/terraform"
  target  = "kafka/terraform"
  command = "plural"

  args = [
    "wkspace",
    "terraform-diff",
    "kafka",
  ]

  sha     = ""
  retries = 0
  verbose = false
}

step "kube-init" {
  wkdir   = "kafka"
  target  = "kafka/.plural/NONCE"
  command = "plural"

  args = [
    "wkspace",
    "kube-init",
    "kafka",
  ]

  sha     = ""
  retries = 0
  verbose = false
}

step "helm" {
  wkdir   = "kafka/helm"
  target  = "kafka/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm-diff",
    "kafka",
  ]

  sha     = ""
  retries = 0
  verbose = false
}
