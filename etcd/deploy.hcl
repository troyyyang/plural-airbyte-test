metadata {
  path = "etcd"
  name = "deploy"
}

step "terraform-init" {
  wkdir   = "etcd/terraform"
  target  = "etcd/terraform"
  command = "terraform"

  args = [
    "init",
    "-upgrade",
  ]

  sha     = "h1:tqZynLHk2u7PKIPPRcsGsPauQaAypueUe19Cr3w61Hw="
  retries = 0
  verbose = false
}

step "terraform-apply" {
  wkdir   = "etcd/terraform"
  target  = "etcd/terraform"
  command = "terraform"

  args = [
    "apply",
    "-auto-approve",
  ]

  sha     = "h1:tqZynLHk2u7PKIPPRcsGsPauQaAypueUe19Cr3w61Hw="
  retries = 1
  verbose = false
}

step "terraform-output" {
  wkdir   = "etcd"
  target  = "etcd/terraform"
  command = "plural"

  args = [
    "output",
    "terraform",
    "etcd",
  ]

  sha     = "h1:tqZynLHk2u7PKIPPRcsGsPauQaAypueUe19Cr3w61Hw="
  retries = 0
  verbose = false
}

step "kube-init" {
  wkdir   = "etcd"
  target  = "etcd/.plural/NONCE"
  command = "plural"

  args = [
    "wkspace",
    "kube-init",
  ]

  sha     = "eb563f919835586d2cfd11ce8199d8423c4fd2dba0b324647b74509d3b4a0f7f"
  retries = 0
  verbose = false
}

step "crds" {
  wkdir   = "etcd"
  target  = "etcd/crds"
  command = "plural"

  args = [
    "wkspace",
    "crds",
    "etcd",
  ]

  sha     = "h1:47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU="
  retries = 0
  verbose = false
}

step "bounce" {
  wkdir   = "etcd"
  target  = "etcd/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm",
    "etcd",
  ]

  sha     = "h1:cqbfZnACsTiNyjehZaoiCX1YI6rNWgWGAzy8MQMylBI="
  retries = 1
  verbose = false
}
