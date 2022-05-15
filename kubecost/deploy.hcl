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

  sha     = "b7a29dd0ccf5b634613a2786a045573ed0e3fd9ef2c5c472adddc1dfbfc60c00"
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

  sha     = "h1:gydmDnVVCnO/MzsaG9I5OGsCaLpde2j1vap4CcMXeRY="
  retries = 1
  verbose = false
}
