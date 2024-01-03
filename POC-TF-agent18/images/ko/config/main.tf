variable "extra_packages" {
  description = "Additional packages to install."
  type        = list(string)
  default     = ["kubectl-default"]
}

module "accts" { source = "../../../tflib/accts" }

output "config" {
  value = jsonencode({
    contents = {
      packages = concat(["busybox", "kustomize", "docker", "python-3", "py3-pip","openjdk-11", "glibc-locale-en",  "libstdc++", "gradle-8", "openjdk-17-default-jvm", "maven", "jq", "git", "ca-certificates-bundle"], var.extra_packages)
    }
    accounts = module.accts.block
    entrypoint = {
      command = "/bin/sh"
    }
  })
}

