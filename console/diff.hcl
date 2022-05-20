metadata {
  path = "console"
  name = "diff"
}

step "terraform-init" {
  wkdir   = "console/terraform"
  target  = "console/terraform"
  command = "terraform"
  args    = ["init"]
  sha     = "h1:5lg9nzjPaMfuVstrKF1/5mGLyvkBZO3s4AkTI4LZIKc="
  retries = 0
  verbose = false
}

step "terraform" {
  wkdir   = "console/terraform"
  target  = "console/terraform"
  command = "plural"

  args = [
    "wkspace",
    "terraform-diff",
    "console",
  ]

  sha     = "h1:5lg9nzjPaMfuVstrKF1/5mGLyvkBZO3s4AkTI4LZIKc="
  retries = 0
  verbose = false
}

step "kube-init" {
  wkdir   = "console"
  target  = "console/.plural/NONCE"
  command = "plural"

  args = [
    "wkspace",
    "kube-init",
    "console",
  ]

  sha     = "ad11ccc10be71d3b81e1e164180bc22dd0d4fa34fcd6a5bc18413cb2a27703b5"
  retries = 0
  verbose = false
}

step "helm" {
  wkdir   = "console/helm"
  target  = "console/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm-diff",
    "console",
  ]

  sha     = "h1:qlUbTalBz+1oTfpDjKNaslnB0w0Ies2vkSXURVld6pA="
  retries = 0
  verbose = false
}
