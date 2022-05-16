metadata {
  path = "nextcloud"
  name = "deploy"
}

step "terraform-init" {
  wkdir   = "nextcloud/terraform"
  target  = "nextcloud/terraform"
  command = "terraform"

  args = [
    "init",
    "-upgrade",
  ]

  sha     = "h1:EwFg2AzVzzgwvvyEGN3N1y/3isWtVhp6pHo1Es3TuZg="
  retries = 0
  verbose = false
}

step "terraform-apply" {
  wkdir   = "nextcloud/terraform"
  target  = "nextcloud/terraform"
  command = "terraform"

  args = [
    "apply",
    "-auto-approve",
  ]

  sha     = "h1:EwFg2AzVzzgwvvyEGN3N1y/3isWtVhp6pHo1Es3TuZg="
  retries = 1
  verbose = false
}

step "terraform-output" {
  wkdir   = "nextcloud"
  target  = "nextcloud/terraform"
  command = "plural"

  args = [
    "output",
    "terraform",
    "nextcloud",
  ]

  sha     = "h1:EwFg2AzVzzgwvvyEGN3N1y/3isWtVhp6pHo1Es3TuZg="
  retries = 0
  verbose = false
}

step "kube-init" {
  wkdir   = "nextcloud"
  target  = "nextcloud/.plural/NONCE"
  command = "plural"

  args = [
    "wkspace",
    "kube-init",
  ]

  sha     = "4ddafe9a2f502b6ff3befa3169c904ba4b93d90c46a206ce47acee7441c5f1e3"
  retries = 0
  verbose = false
}

step "crds" {
  wkdir   = "nextcloud"
  target  = "nextcloud/crds"
  command = "plural"

  args = [
    "wkspace",
    "crds",
    "nextcloud",
  ]

  sha     = "h1:47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU="
  retries = 0
  verbose = false
}

step "bounce" {
  wkdir   = "nextcloud"
  target  = "nextcloud/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm",
    "nextcloud",
  ]

  sha     = "h1:MKEA+WWEnxIoXuk1i1c9feZskA++AWrfAPbozXhmRMU="
  retries = 1
  verbose = false
}
