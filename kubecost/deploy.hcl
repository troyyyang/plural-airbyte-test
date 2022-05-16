metadata {
  path = "kubecost"
  name = "deploy"
}

step "terraform-init" {
  wkdir   = "kubecost/terraform"
  target  = "kubecost/terraform"
  command = "terraform"

  args = [
    "init",
    "-upgrade",
  ]

  sha     = "h1:/RADjaw5QXIvoe4xUNYoYQxYB8V8FzFKF4GtkdDqVlY="
  retries = 0
  verbose = false
}

step "terraform-apply" {
  wkdir   = "kubecost/terraform"
  target  = "kubecost/terraform"
  command = "terraform"

  args = [
    "apply",
    "-auto-approve",
  ]

  sha     = "h1:/RADjaw5QXIvoe4xUNYoYQxYB8V8FzFKF4GtkdDqVlY="
  retries = 1
  verbose = false
}

step "terraform-output" {
  wkdir   = "kubecost"
  target  = "kubecost/terraform"
  command = "plural"

  args = [
    "output",
    "terraform",
    "kubecost",
  ]

  sha     = "h1:/RADjaw5QXIvoe4xUNYoYQxYB8V8FzFKF4GtkdDqVlY="
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
  ]

  sha     = "ae0362ea8534952887d379ca583c5c899d9e62cc6585e5c8cf505e3bdb88cd14"
  retries = 0
  verbose = false
}

step "crds" {
  wkdir   = "kubecost"
  target  = "kubecost/crds"
  command = "plural"

  args = [
    "wkspace",
    "crds",
    "kubecost",
  ]

  sha     = "h1:47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU="
  retries = 0
  verbose = false
}

step "bounce" {
  wkdir   = "kubecost"
  target  = "kubecost/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm",
    "kubecost",
  ]

  sha     = "h1:H8MoSAXo1XDPLBHcrqK+xUHGRnC/3zXyBYQ1mAWNiNc="
  retries = 1
  verbose = false
}
