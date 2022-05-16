metadata {
  name = "redis"
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
  path = "helm/redis"
  type = "helm"

  preflight "update-deps" {
    wkdir   = ""
    target  = "Chart.yaml"
    command = "plural"

    args = [
      "wkspace",
      "helm-deps",
    ]

    sha     = "f704151011bc58e11bd4a4a4864fd607a41bf940512ac33b2d26ad5d93e42561"
    retries = 0
    verbose = false
  }
}
