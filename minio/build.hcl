metadata {
  name = "minio"
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
  path = "helm/minio"
  type = "helm"

  preflight "update-deps" {
    wkdir   = ""
    target  = "Chart.yaml"
    command = "plural"

    args = [
      "wkspace",
      "helm-deps",
    ]

    sha     = "5e6d446ef8a63d0197261d9c8e90d0b6ad715d9f57f2cd8f1f9da9362cb949cc"
    retries = 0
    verbose = false
  }
}
