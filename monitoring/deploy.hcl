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

  sha     = "h1:kZe4xu4U0gbJbFykVado2kC+GuhOlQXvbRfKRxgEa1Y="
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

  sha     = "h1:kZe4xu4U0gbJbFykVado2kC+GuhOlQXvbRfKRxgEa1Y="
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

  sha     = "h1:kZe4xu4U0gbJbFykVado2kC+GuhOlQXvbRfKRxgEa1Y="
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

  sha     = "d0a2f766c647659a9c3ed41b652536d2fbbab6c1c4672211d1df90059b6dd9aa"
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

  sha     = "h1:ARw94IQOJZZoE5fTrxq/jwfn1xRxt/qsjiuUOpGcau8="
  retries = 1
  verbose = false
}
