terraform {
  required_version = "0.11.14"
}

provider "aws" {
  profile    = "solutions-architects"
  region     = "us-east-1"
}

module "consul" {
  source      = "hashicorp/consul/aws"
  num_servers = "3"
}

output "consul_server_asg_name" {
  value = "${module.consul.asg_name_servers}"
}