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

  sha     = "h1:4Yi1QYGtz7WUD0/KF7MxBTeVTYg/R2HrGpC2Fdb2XVc="
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

  sha     = "h1:4Yi1QYGtz7WUD0/KF7MxBTeVTYg/R2HrGpC2Fdb2XVc="
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

  sha     = "h1:4Yi1QYGtz7WUD0/KF7MxBTeVTYg/R2HrGpC2Fdb2XVc="
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

  sha     = "372b1ab8e5810aaf63868295234ad6120fa04d0bc647021a93006281e3b648f2"
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

  sha     = "h1:XmDrUXIOIjjAiuWvHsSBOra4z+3S7GF0l5z3VsqzCY0="
  retries = 1
  verbose = false
}
