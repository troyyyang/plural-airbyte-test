metadata {
  path = "grafana"
  name = "deploy"
}

step "terraform-init" {
  wkdir   = "grafana/terraform"
  target  = "grafana/terraform"
  command = "terraform"

  args = [
    "init",
    "-upgrade",
  ]

  sha     = "h1:GUGQvFCdO7qSLeyYtD+g+baU22r3fKwgS7JKDYgCHc0="
  retries = 0
  verbose = false
}

step "terraform-apply" {
  wkdir   = "grafana/terraform"
  target  = "grafana/terraform"
  command = "terraform"

  args = [
    "apply",
    "-auto-approve",
  ]

  sha     = "h1:GUGQvFCdO7qSLeyYtD+g+baU22r3fKwgS7JKDYgCHc0="
  retries = 1
  verbose = false
}

step "terraform-output" {
  wkdir   = "grafana"
  target  = "grafana/terraform"
  command = "plural"

  args = [
    "output",
    "terraform",
    "grafana",
  ]

  sha     = "h1:GUGQvFCdO7qSLeyYtD+g+baU22r3fKwgS7JKDYgCHc0="
  retries = 0
  verbose = false
}

step "kube-init" {
  wkdir   = "grafana"
  target  = "grafana/.plural/NONCE"
  command = "plural"

  args = [
    "wkspace",
    "kube-init",
  ]

  sha     = "6209b6f2684aee996d81638259ab9a7fdadf7932f52600310f992c5862abfc3c"
  retries = 0
  verbose = false
}

step "crds" {
  wkdir   = "grafana"
  target  = "grafana/crds"
  command = "plural"

  args = [
    "wkspace",
    "crds",
    "grafana",
  ]

  sha     = "h1:47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU="
  retries = 0
  verbose = false
}

step "bounce" {
  wkdir   = "grafana"
  target  = "grafana/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm",
    "grafana",
  ]

  sha     = "h1:KGl2xy7uOx6QFAWyYljbr7yfJWOdqDXA4nskBofkjtY="
  retries = 1
  verbose = false
}
