metadata {
  path = "airbyte"
  name = "diff"
}

step "terraform-init" {
  wkdir   = "airbyte/terraform"
  target  = "airbyte/terraform"
  command = "terraform"
  args    = ["init"]
  sha     = "h1:Jgx7euYcp3KBNyaawaO4K5BmDL4eqIg6nv6b0PKGFwo="
  retries = 0
  verbose = false
}

step "terraform" {
  wkdir   = "airbyte/terraform"
  target  = "airbyte/terraform"
  command = "plural"

  args = [
    "wkspace",
    "terraform-diff",
    "airbyte",
  ]

  sha     = "h1:Jgx7euYcp3KBNyaawaO4K5BmDL4eqIg6nv6b0PKGFwo="
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
    "airbyte",
  ]

  sha     = "135c4a710890d6645892d15ef6af8aa2d95b1211237a0cc156bfd44b0381c28e"
  retries = 0
  verbose = false
}

step "helm" {
  wkdir   = "airbyte/helm"
  target  = "airbyte/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm-diff",
    "airbyte",
  ]

  sha     = "h1:o+GWFzw1UB28qHqL1t2JpumA27vj7MbCcvLuLwofxZE="
  retries = 0
  verbose = false
}
