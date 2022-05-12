metadata {
  path = "etcd"
  name = "diff"
}

step "terraform-init" {
  wkdir   = "etcd/terraform"
  target  = "etcd/terraform"
  command = "terraform"
  args    = ["init"]
  sha     = ""
  retries = 0
  verbose = false
}

step "terraform" {
  wkdir   = "etcd/terraform"
  target  = "etcd/terraform"
  command = "plural"

  args = [
    "wkspace",
    "terraform-diff",
    "etcd",
  ]

  sha     = ""
  retries = 0
  verbose = false
}

step "kube-init" {
  wkdir   = "etcd"
  target  = "etcd/.plural/NONCE"
  command = "plural"

  args = [
    "wkspace",
    "kube-init",
    "etcd",
  ]

  sha     = ""
  retries = 0
  verbose = false
}

step "helm" {
  wkdir   = "etcd/helm"
  target  = "etcd/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm-diff",
    "etcd",
  ]

  sha     = ""
  retries = 0
  verbose = false
}
