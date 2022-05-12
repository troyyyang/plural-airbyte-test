metadata {
  name = "bootstrap"
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
  path = "helm/bootstrap"
  type = "helm"

  preflight "update-deps" {
    wkdir   = ""
    target  = "Chart.yaml"
    command = "plural"

    args = [
      "wkspace",
      "helm-deps",
    ]

    sha     = "e374c99bb0c4095b7dd36882615bdfa5fb61c86e3cd613b0d9c7c963f1874f1f"
    retries = 0
    verbose = false
  }
}
