metadata {
  path = "hasura"
  name = "diff"
}

step "terraform-init" {
  wkdir   = "hasura/terraform"
  target  = "hasura/terraform"
  command = "terraform"
  args    = ["init"]
  sha     = "h1:kDvqlRfuy4nC6RnzuufI+MxI4mZxdir/igpP5yuAWhQ="
  retries = 0
  verbose = false
}

step "terraform" {
  wkdir   = "hasura/terraform"
  target  = "hasura/terraform"
  command = "plural"

  args = [
    "wkspace",
    "terraform-diff",
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
    "hasura",
  ]

  sha     = "ce0a0782b854fa66f6a69e8924ba84f103d4e2b917e0f2376b91f48a5b2db73e"
  retries = 0
  verbose = false
}

step "helm" {
  wkdir   = "hasura/helm"
  target  = "hasura/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm-diff",
    "hasura",
  ]

  sha     = "h1:Ov/SZ7D5vi8FICHcoqQN9Ww7UTWxj06g9MLPn/WlMOc="
  retries = 0
  verbose = false
}
