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

  sha     = "833c2ecb8bf6453f4a73f2407435b9a86fae13cc9e4f4a87d8c9f17056bab50d"
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

  sha     = "h1:XmDrUXIOIjjAiuWvHsSBOra4z+3S7GF0l5z3VsqzCY0="
  retries = 0
  verbose = false
}
