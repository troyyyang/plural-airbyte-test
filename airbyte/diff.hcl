metadata {
  path = "airbyte"
  name = "diff"
}

step "terraform-init" {
  wkdir   = "airbyte/terraform"
  target  = "airbyte/terraform"
  command = "terraform"
  args    = ["init"]
  sha     = "h1:7ocgkN1n2VeFIgLpnHiIWqyshCA+CIlSfiOcjBZpIpE="
  retries = 0
  verbose = false
}

step "terraform" {
  wkdir   = "airbyte/terraform"
  target  = "airbyte/terraform"
  command = "plural"

  args = [
    "wkspace",
    "terraform-diff",
    "airbyte",
  ]

  sha     = "h1:7ocgkN1n2VeFIgLpnHiIWqyshCA+CIlSfiOcjBZpIpE="
  retries = 0
  verbose = false
}

step "kube-init" {
  wkdir   = "airbyte"
  target  = "airbyte/.plural/NONCE"
  command = "plural"

  args = [
    "wkspace",
    "kube-init",
    "airbyte",
  ]

  sha     = "dd4f54c33c47eb73c05b67298d19137afca260f5157ba6a653aa084fd168c940"
  retries = 0
  verbose = false
}

step "helm" {
  wkdir   = "airbyte/helm"
  target  = "airbyte/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm-diff",
    "airbyte",
  ]

  sha     = "h1:tkOdd+tI1V/rHp3zqsdBCFD99q/tDzaXdbc4QpXBb7g="
  retries = 0
  verbose = false
}
