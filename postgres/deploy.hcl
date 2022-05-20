metadata {
  path = "postgres"
  name = "deploy"
}

step "terraform-init" {
  wkdir   = "postgres/terraform"
  target  = "postgres/terraform"
  command = "terraform"

  args = [
    "init",
    "-upgrade",
  ]

  sha     = "h1:ZQ4+rXZRNmLdryI9khL1TSTLVJrgwiSIpTiEOIk1HHI="
  retries = 0
  verbose = false
}

step "terraform-apply" {
  wkdir   = "postgres/terraform"
  target  = "postgres/terraform"
  command = "terraform"

  args = [
    "apply",
    "-auto-approve",
  ]

  sha     = "h1:ZQ4+rXZRNmLdryI9khL1TSTLVJrgwiSIpTiEOIk1HHI="
  retries = 1
  verbose = false
}

step "terraform-output" {
  wkdir   = "postgres"
  target  = "postgres/terraform"
  command = "plural"

  args = [
    "output",
    "terraform",
    "postgres",
  ]

  sha     = "h1:ZQ4+rXZRNmLdryI9khL1TSTLVJrgwiSIpTiEOIk1HHI="
  retries = 0
  verbose = false
}

step "kube-init" {
  wkdir   = "postgres"
  target  = "postgres/.plural/NONCE"
  command = "plural"

  args = [
    "wkspace",
    "kube-init",
  ]

  sha     = "af90abf2de4aedded242e3db02f3885b4919a771dcbff65fc0db41a49dc0682c"
  retries = 0
  verbose = false
}

step "crds" {
  wkdir   = "postgres"
  target  = "postgres/crds"
  command = "plural"

  args = [
    "wkspace",
    "crds",
    "postgres",
  ]

  sha     = "h1:+KtpiGhaAg9Db5EdGawKjfUTQqpyrQFC87h9Gj2L/zQ="
  retries = 0
  verbose = false
}

step "bounce" {
  wkdir   = "postgres"
  target  = "postgres/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm",
    "postgres",
  ]

  sha     = "h1:87eSvpNB7ieEiPkwGaMDSrhx8lRMENBs8k7BoOuWlkc="
  retries = 1
  verbose = false
}
