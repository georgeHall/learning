variable "prefix" {
  type = string
}

variable "region" {
  type = string
}

variable "zone" {
  type = string
}

variable "instance_user" {
  type    = string
  default = "ubuntu"
}

variable "ssh_pub_key_file_path" {
  type = string
}

variable "network_cidr" {
  type = string
  default = "10.10.0.0/24"
}