metadata {
  path = "kafka"
  name = "deploy"
}

step "terraform-init" {
  wkdir   = "kafka/terraform"
  target  = "kafka/terraform"
  command = "terraform"

  args = [
    "init",
    "-upgrade",
  ]

  sha     = "h1:CrVd9ChTIu9sz0V8rGInxXWKD+OsvNpw9+tXt0anuuQ="
  retries = 0
  verbose = false
}

step "terraform-apply" {
  wkdir   = "kafka/terraform"
  target  = "kafka/terraform"
  command = "terraform"

  args = [
    "apply",
    "-auto-approve",
  ]

  sha     = "h1:CrVd9ChTIu9sz0V8rGInxXWKD+OsvNpw9+tXt0anuuQ="
  retries = 1
  verbose = false
}

step "terraform-output" {
  wkdir   = "kafka"
  target  = "kafka/terraform"
  command = "plural"

  args = [
    "output",
    "terraform",
    "kafka",
  ]

  sha     = "h1:CrVd9ChTIu9sz0V8rGInxXWKD+OsvNpw9+tXt0anuuQ="
  retries = 0
  verbose = false
}

step "kube-init" {
  wkdir   = "kafka"
  target  = "kafka/.plural/NONCE"
  command = "plural"

  args = [
    "wkspace",
    "kube-init",
  ]

  sha     = "fdefe6590a45771d38cd4345c746f4b7b6bf935c9206a80e2092f586a053a469"
  retries = 0
  verbose = false
}

step "crds" {
  wkdir   = "kafka"
  target  = "kafka/crds"
  command = "plural"

  args = [
    "wkspace",
    "crds",
    "kafka",
  ]

  sha     = "h1:R5aMMRvui09Sy/V4GIuS0McmqqdahbO1k7U/XsD6Zng="
  retries = 0
  verbose = false
}

step "bounce" {
  wkdir   = "kafka"
  target  = "kafka/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm",
    "kafka",
  ]

  sha     = "h1:3nXqKOc42z9HoPD9uaOg96pr60BBFZ4MrZX0AFCvhJk="
  retries = 1
  verbose = false
}
