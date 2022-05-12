metadata {
  name = "superset"
}

scaffold "terraform" {
  path = "terraform"
  type = "terraform"
}

scaffold "crds" {
  path = "crds"
  type = "crd"
}

scaffold "helm" {
  path = "helm/superset"
  type = "helm"

  preflight "update-deps" {
    wkdir   = ""
    target  = "Chart.yaml"
    command = "plural"

    args = [
      "wkspace",
      "helm-deps",
    ]

    sha     = "1626fae5fe96c5641218c4b2cd922700f2d02dd537f85822f9eae28f2a3ede1e"
    retries = 0
    verbose = false
  }
}
