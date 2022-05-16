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

  sha     = "d99a02bf22f8a9b878721143d132f88c3fe891d2b0f6cb2599a35eee2bff58e4"
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
