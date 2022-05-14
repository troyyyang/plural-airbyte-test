metadata {
  path = "rabbitmq"
  name = "deploy"
}

step "terraform-init" {
  wkdir   = "rabbitmq/terraform"
  target  = "rabbitmq/terraform"
  command = "terraform"

  args = [
    "init",
    "-upgrade",
  ]

  sha     = "h1:thh34p7v+xb7Nu2EpGZ/YeXUqJAYPNRfHg5MuGadaOE="
  retries = 0
  verbose = false
}

step "terraform-apply" {
  wkdir   = "rabbitmq/terraform"
  target  = "rabbitmq/terraform"
  command = "terraform"

  args = [
    "apply",
    "-auto-approve",
  ]

  sha     = "h1:thh34p7v+xb7Nu2EpGZ/YeXUqJAYPNRfHg5MuGadaOE="
  retries = 1
  verbose = false
}

step "terraform-output" {
  wkdir   = "rabbitmq"
  target  = "rabbitmq/terraform"
  command = "plural"

  args = [
    "output",
    "terraform",
    "rabbitmq",
  ]

  sha     = "h1:thh34p7v+xb7Nu2EpGZ/YeXUqJAYPNRfHg5MuGadaOE="
  retries = 0
  verbose = false
}

step "kube-init" {
  wkdir   = "rabbitmq"
  target  = "rabbitmq/.plural/NONCE"
  command = "plural"

  args = [
    "wkspace",
    "kube-init",
  ]

  sha     = "2cb3aec92173fbc85b3e1356cd1823370489990b8f6952b3d484b6175f9173c7"
  retries = 0
  verbose = false
}

step "crds" {
  wkdir   = "rabbitmq"
  target  = "rabbitmq/crds"
  command = "plural"

  args = [
    "wkspace",
    "crds",
    "rabbitmq",
  ]

  sha     = "h1:f4Cb0NOWBtMWNFjY+kSmO2DoPMYzZBoowo0fCVE1hwo="
  retries = 0
  verbose = false
}

step "bounce" {
  wkdir   = "rabbitmq"
  target  = "rabbitmq/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm",
    "rabbitmq",
  ]

  sha     = "h1:MJs8a92vzen5tF27J3AuSAppkqFpl4cKuo+yMOFzRgY="
  retries = 1
  verbose = false
}
