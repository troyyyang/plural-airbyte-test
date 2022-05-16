metadata {
  path = "airbyte"
  name = "diff"
}

step "terraform-init" {
  wkdir   = "airbyte/terraform"
  target  = "airbyte/terraform"
  command = "terraform"
  args    = ["init"]
  sha     = "h1:7ocgkN1n2VeFIgLpnHiIWqyshCA+CIlSfiOcjBZpIpE="
  retries = 0
  verbose = false
}

step "terraform" {
  wkdir   = "airbyte/terraform"
  target  = "airbyte/terraform"
  command = "plural"

  args = [
    "wkspace",
    "terraform-diff",
    "airbyte",
  ]

  sha     = "h1:7ocgkN1n2VeFIgLpnHiIWqyshCA+CIlSfiOcjBZpIpE="
  retries = 0
  verbose = false
}

step "kube-init" {
  wkdir   = "airbyte"
  target  = "airbyte/.plural/NONCE"
  command = "plural"

  args = [
    "wkspace",
    "kube-init",
    "airbyte",
  ]

  sha     = "190af2fa6606ad65c5000ab537f91cc08135025d434d48b1545c4fd5b5da505b"
  retries = 0
  verbose = false
}

step "helm" {
  wkdir   = "airbyte/helm"
  target  = "airbyte/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm-diff",
    "airbyte",
  ]

  sha     = "h1:vllauM+Mlul5ST/loC06HbJQz77WRlL3gCgwXavWdyA="
  retries = 0
  verbose = false
}
