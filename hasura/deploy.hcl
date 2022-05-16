metadata {
  path = "hasura"
  name = "deploy"
}

step "terraform-init" {
  wkdir   = "hasura/terraform"
  target  = "hasura/terraform"
  command = "terraform"

  args = [
    "init",
    "-upgrade",
  ]

  sha     = "h1:kDvqlRfuy4nC6RnzuufI+MxI4mZxdir/igpP5yuAWhQ="
  retries = 0
  verbose = false
}

step "terraform-apply" {
  wkdir   = "hasura/terraform"
  target  = "hasura/terraform"
  command = "terraform"

  args = [
    "apply",
    "-auto-approve",
  ]

  sha     = "h1:kDvqlRfuy4nC6RnzuufI+MxI4mZxdir/igpP5yuAWhQ="
  retries = 1
  verbose = false
}

step "terraform-output" {
  wkdir   = "hasura"
  target  = "hasura/terraform"
  command = "plural"

  args = [
    "output",
    "terraform",
    "hasura",
  ]

  sha     = "h1:kDvqlRfuy4nC6RnzuufI+MxI4mZxdir/igpP5yuAWhQ="
  retries = 0
  verbose = false
}

step "kube-init" {
  wkdir   = "hasura"
  target  = "hasura/.plural/NONCE"
  command = "plural"

  args = [
    "wkspace",
    "kube-init",
  ]

  sha     = "1d2decae80f6f4665c60ee505c506e29636207b856f12aeea71d8e31879cb1dd"
  retries = 0
  verbose = false
}

step "crds" {
  wkdir   = "hasura"
  target  = "hasura/crds"
  command = "plural"

  args = [
    "wkspace",
    "crds",
    "hasura",
  ]

  sha     = "h1:47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU="
  retries = 0
  verbose = false
}

step "bounce" {
  wkdir   = "hasura"
  target  = "hasura/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm",
    "hasura",
  ]

  sha     = "h1:rGWNLgBo3dYdSx6xAzEQgP6lbHmeRBML9p94yRFfc6k="
  retries = 1
  verbose = false
}
