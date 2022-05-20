metadata {
  path = "monitoring"
  name = "deploy"
}

step "terraform-init" {
  wkdir   = "monitoring/terraform"
  target  = "monitoring/terraform"
  command = "terraform"

  args = [
    "init",
    "-upgrade",
  ]

  sha     = "h1:G9+dpbh21yaupCOrVntHdg1VIc3nBr5bf63sjqVU17s="
  retries = 0
  verbose = false
}

step "terraform-apply" {
  wkdir   = "monitoring/terraform"
  target  = "monitoring/terraform"
  command = "terraform"

  args = [
    "apply",
    "-auto-approve",
  ]

  sha     = "h1:G9+dpbh21yaupCOrVntHdg1VIc3nBr5bf63sjqVU17s="
  retries = 1
  verbose = false
}

step "terraform-output" {
  wkdir   = "monitoring"
  target  = "monitoring/terraform"
  command = "plural"

  args = [
    "output",
    "terraform",
    "monitoring",
  ]

  sha     = "h1:G9+dpbh21yaupCOrVntHdg1VIc3nBr5bf63sjqVU17s="
  retries = 0
  verbose = false
}

step "kube-init" {
  wkdir   = "monitoring"
  target  = "monitoring/.plural/NONCE"
  command = "plural"

  args = [
    "wkspace",
    "kube-init",
  ]

  sha     = "4e82de1b2c555cc0b174b76f09a0e223468e7f42b0d3fec78460f6e67caadba1"
  retries = 0
  verbose = false
}

step "crds" {
  wkdir   = "monitoring"
  target  = "monitoring/crds"
  command = "plural"

  args = [
    "wkspace",
    "crds",
    "monitoring",
  ]

  sha     = "h1:2uZZjww2jPGQCg0m3pDOu9HOuIbNZUe8Ll8m3n1J2Zs="
  retries = 0
  verbose = false
}

step "bounce" {
  wkdir   = "monitoring"
  target  = "monitoring/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm",
    "monitoring",
  ]

  sha     = "h1:uYDBBVHweVcqHqGlwHvof0DEdSoP0FARoPkg0CEXTQg="
  retries = 1
  verbose = false
}
