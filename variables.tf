variable "hcloud_token" {
}

variable "location" {
  default = "hel1"
}

variable "servers" {
  type = "map"
  default = {
    "test.1cbrbbb.com": "cpx41"
  }
}

variable "server_image" {
  description = "Predefined Image that will be used to spin up the machines (Currently supported: ubuntu-20.04, ubuntu-18.04)"
  default     = "ubuntu-20.04"
}

variable "ssh_private_key" {
  description = "Private Key to access the machines"
}

variable "ssh_public_key" {
  description = "Public Key to authorized the access for the machines"
}
