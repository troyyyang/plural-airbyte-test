metadata {
  path = "airbyte"
  name = "deploy"
}

step "terraform-init" {
  wkdir   = "airbyte/terraform"
  target  = "airbyte/terraform"
  command = "terraform"

  args = [
    "init",
    "-upgrade",
  ]

  sha     = "h1:7ocgkN1n2VeFIgLpnHiIWqyshCA+CIlSfiOcjBZpIpE="
  retries = 0
  verbose = false
}

step "terraform-apply" {
  wkdir   = "airbyte/terraform"
  target  = "airbyte/terraform"
  command = "terraform"

  args = [
    "apply",
    "-auto-approve",
  ]

  sha     = "h1:7ocgkN1n2VeFIgLpnHiIWqyshCA+CIlSfiOcjBZpIpE="
  retries = 1
  verbose = false
}

step "terraform-output" {
  wkdir   = "airbyte"
  target  = "airbyte/terraform"
  command = "plural"

  args = [
    "output",
    "terraform",
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
  ]

  sha     = "a3e0f3d601d99e3025659226343802857f9b18fa5264ed6f6fb0eeadb2344af6"
  retries = 0
  verbose = false
}

step "crds" {
  wkdir   = "airbyte"
  target  = "airbyte/crds"
  command = "plural"

  args = [
    "wkspace",
    "crds",
    "airbyte",
  ]

  sha     = "h1:47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU="
  retries = 0
  verbose = false
}

step "bounce" {
  wkdir   = "airbyte"
  target  = "airbyte/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm",
    "airbyte",
  ]

  sha     = "h1:c2LFGQFioN9PPiA+rSzPv0s6l3X3+cmF6ew1C3MmOMQ="
  retries = 1
  verbose = false
}
