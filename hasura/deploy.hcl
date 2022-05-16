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

  sha     = "9e1a01c586e0a34cc2a877674d7f5064c0f7798e680424942010ee5ceb07c11f"
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

  sha     = "h1:Ov/SZ7D5vi8FICHcoqQN9Ww7UTWxj06g9MLPn/WlMOc="
  retries = 1
  verbose = false
}
