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

  sha     = "h1:HGI9qbizAHOqgBQJMT5aJi714ef2sRUmdxswuYndYf8="
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

  sha     = "h1:HGI9qbizAHOqgBQJMT5aJi714ef2sRUmdxswuYndYf8="
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

  sha     = "h1:HGI9qbizAHOqgBQJMT5aJi714ef2sRUmdxswuYndYf8="
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

  sha     = "89ecda02c8ce9750e88a8ff81fe254d2328a78a189b4654dad34b24bc5b0cdc7"
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

  sha     = "h1:uwjD2T3FfsQ9QxipGulTtzGgjEh0auqnYybdsRg2w48="
  retries = 1
  verbose = false
}
