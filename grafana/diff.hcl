metadata {
  path = "grafana"
  name = "diff"
}

step "terraform-init" {
  wkdir   = "grafana/terraform"
  target  = "grafana/terraform"
  command = "terraform"
  args    = ["init"]
  sha     = "h1:4Yi1QYGtz7WUD0/KF7MxBTeVTYg/R2HrGpC2Fdb2XVc="
  retries = 0
  verbose = false
}

step "terraform" {
  wkdir   = "grafana/terraform"
  target  = "grafana/terraform"
  command = "plural"

  args = [
    "wkspace",
    "terraform-diff",
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
    "grafana",
  ]

  sha     = "3a143c9350c3c661405feb170e9148ba16cae1a40f17ee8ab129b25d0e622c4d"
  retries = 0
  verbose = false
}

step "helm" {
  wkdir   = "grafana/helm"
  target  = "grafana/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm-diff",
    "grafana",
  ]

  sha     = "h1:SbyWK3o/PloYL4AO8QIIUKTcI6GOmHUInqz63fC9ukM="
  retries = 0
  verbose = false
}
