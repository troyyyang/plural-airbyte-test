metadata {
  path = "hasura"
  name = "diff"
}

step "terraform-init" {
  wkdir   = "hasura/terraform"
  target  = "hasura/terraform"
  command = "terraform"
  args    = ["init"]
  sha     = ""
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

  sha     = ""
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

  sha     = ""
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

  sha     = ""
  retries = 0
  verbose = false
}
