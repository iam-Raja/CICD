data "aws_ami" "ami_info" {
  most_recent = true
  owners = ["973714476881"]

    filter {
     name   = "name"
     values = ["RHEL-9-DevOps-Practice"]
  }
}

data "aws_ami" "nexus_ami_info" {
  most_recent = true
  owners = ["679593333241"]

    filter {
     name   = "name"
     values = ["SolveDevOps-Nexus-Server-Ubuntu20.04-20240511-af3afa48-*"]
  }
}