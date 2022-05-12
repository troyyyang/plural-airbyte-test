metadata {
  path = "kubecost"
  name = "diff"
}

step "terraform-init" {
  wkdir   = "kubecost/terraform"
  target  = "kubecost/terraform"
  command = "terraform"
  args    = ["init"]
  sha     = "h1:DDCqAm/S7E20QBq+F4AKStDLjUk0La+eAth4Xfn9ya8="
  retries = 0
  verbose = false
}

step "terraform" {
  wkdir   = "kubecost/terraform"
  target  = "kubecost/terraform"
  command = "plural"

  args = [
    "wkspace",
    "terraform-diff",
    "kubecost",
  ]

  sha     = "h1:DDCqAm/S7E20QBq+F4AKStDLjUk0La+eAth4Xfn9ya8="
  retries = 0
  verbose = false
}

step "kube-init" {
  wkdir   = "kubecost"
  target  = "kubecost/.plural/NONCE"
  command = "plural"

  args = [
    "wkspace",
    "kube-init",
    "kubecost",
  ]

  sha     = "bbd98bb1585c6c2572b8b33e9d6284844183d43113c00925e3f7df5cd430fd12"
  retries = 0
  verbose = false
}

step "helm" {
  wkdir   = "kubecost/helm"
  target  = "kubecost/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm-diff",
    "kubecost",
  ]

  sha     = "h1:qQyWF3+bXo48x+pX40ekgejWxG4UuUl/oC7y++aSMjE="
  retries = 0
  verbose = false
}
