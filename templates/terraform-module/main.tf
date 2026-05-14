terraform {
  required_version = ">= 1.6"
}

resource "null_resource" "placeholder" {
  triggers = {
    name = var.name
  }
}
