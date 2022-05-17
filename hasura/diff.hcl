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

  sha     = "5edd29af1be1b361872875760754cfbd81c81797f27246b2b3bc0ee663817f7b"
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

  sha     = "h1:7gsVErJT3WLBE4sz3TaraDRfAZ0ArPymuTrscKn6hds="
  retries = 0
  verbose = false
}
