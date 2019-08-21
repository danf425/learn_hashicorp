provider "aws" {
  profile    = "solutions-architects"
  region     = "${var.region}"
}

resource "aws_instance" "example" {
  ami           = "${var.amis[var.region]}"
  instance_type = "t2.micro"

  provisioner "local-exec" {
    command = "echo ${aws_instance.example.public_ip} > ip_address.txt"
  }
}

resource "aws_instance" "another" {
  ami           = "ami-b374d5a5"
  instance_type = "t2.micro"
}
resource "aws_eip" "ip" {
    vpc = true
    instance = "${aws_instance.example.id}"
}