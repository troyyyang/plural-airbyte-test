metadata {
  path = "dagster"
  name = "deploy"
}

step "terraform-init" {
  wkdir   = "dagster/terraform"
  target  = "dagster/terraform"
  command = "terraform"

  args = [
    "init",
    "-upgrade",
  ]

  sha     = "h1:ax0j++hqQ5wK8cpIxF18G5xbGtE434DHGl6lcsFAvQw="
  retries = 0
  verbose = false
}

step "terraform-apply" {
  wkdir   = "dagster/terraform"
  target  = "dagster/terraform"
  command = "terraform"

  args = [
    "apply",
    "-auto-approve",
  ]

  sha     = "h1:ax0j++hqQ5wK8cpIxF18G5xbGtE434DHGl6lcsFAvQw="
  retries = 1
  verbose = false
}

step "terraform-output" {
  wkdir   = "dagster"
  target  = "dagster/terraform"
  command = "plural"

  args = [
    "output",
    "terraform",
    "dagster",
  ]

  sha     = "h1:ax0j++hqQ5wK8cpIxF18G5xbGtE434DHGl6lcsFAvQw="
  retries = 0
  verbose = false
}

step "kube-init" {
  wkdir   = "dagster"
  target  = "dagster/.plural/NONCE"
  command = "plural"

  args = [
    "wkspace",
    "kube-init",
  ]

  sha     = "1ab068c62f27c34dd4e0e1e78d316ca92fa662bf62520059375d53b2ac438c86"
  retries = 0
  verbose = false
}

step "crds" {
  wkdir   = "dagster"
  target  = "dagster/crds"
  command = "plural"

  args = [
    "wkspace",
    "crds",
    "dagster",
  ]

  sha     = "h1:47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU="
  retries = 0
  verbose = false
}

step "bounce" {
  wkdir   = "dagster"
  target  = "dagster/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm",
    "dagster",
  ]

  sha     = "h1:5mqq1+AdYFdgAKKzA3ECwI28s5g1+HwL/ghezvZ2jb8="
  retries = 1
  verbose = false
}
