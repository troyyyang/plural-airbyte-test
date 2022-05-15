metadata {
  path = "console"
  name = "diff"
}

step "terraform-init" {
  wkdir   = "console/terraform"
  target  = "console/terraform"
  command = "terraform"
  args    = ["init"]
  sha     = "h1:jUOSCoUyhQnTAxJ7P0Dwyoyo/UantH/BtppfJVYHwRc="
  retries = 0
  verbose = false
}

step "terraform" {
  wkdir   = "console/terraform"
  target  = "console/terraform"
  command = "plural"

  args = [
    "wkspace",
    "terraform-diff",
    "console",
  ]

  sha     = "h1:jUOSCoUyhQnTAxJ7P0Dwyoyo/UantH/BtppfJVYHwRc="
  retries = 0
  verbose = false
}

step "kube-init" {
  wkdir   = "console"
  target  = "console/.plural/NONCE"
  command = "plural"

  args = [
    "wkspace",
    "kube-init",
    "console",
  ]

  sha     = "7c30d82d9af9c1702e25e9db8373ea628760ed7d4a11210d73392df32289ae1b"
  retries = 0
  verbose = false
}

step "helm" {
  wkdir   = "console/helm"
  target  = "console/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm-diff",
    "console",
  ]

  sha     = "h1:oU+tKTINXFLHhSzBR9LShgPCmCZBZEzvv0MBg/xhhD8="
  retries = 0
  verbose = false
}
