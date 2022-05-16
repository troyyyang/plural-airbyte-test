metadata {
  name = "hasura"
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
  path = "helm/hasura"
  type = "helm"

  preflight "update-deps" {
    wkdir   = ""
    target  = "Chart.yaml"
    command = "plural"

    args = [
      "wkspace",
      "helm-deps",
    ]

    sha     = "ee1e0c9242ffa873d5f79e7ad2750767fa70ce0125ad292d57727acee4fbc141"
    retries = 0
    verbose = false
  }
}
