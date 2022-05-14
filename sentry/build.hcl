metadata {
  name = "sentry"
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
  path = "helm/sentry"
  type = "helm"

  preflight "update-deps" {
    wkdir   = ""
    target  = "Chart.yaml"
    command = "plural"

    args = [
      "wkspace",
      "helm-deps",
    ]

    sha     = "8aca8ee8bcfd8c36cc312442e8a55bfda6188be66848b22372df1eb3340003ec"
    retries = 0
    verbose = false
  }
}
