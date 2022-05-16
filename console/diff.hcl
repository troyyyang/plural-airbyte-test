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

  sha     = "2c589435fb103122646ebfadcedb8c74310c28b6204f7ecc36719cf183f4058b"
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

  sha     = "h1:8SO+qNr2SJrYCGZmMmS225fAga1GKfqE0R8v/1NP+E0="
  retries = 0
  verbose = false
}
