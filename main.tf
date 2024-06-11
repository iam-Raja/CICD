module "jenkins" {
  source  = "terraform-aws-modules/ec2-instance/aws"

  name = "jenkins"

  instance_type          = "t2.micro"
  vpc_security_group_ids = ["sg-03ec942beb955be40"]
  subnet_id              = "subnet-0c35fdd17ccc49343"
  user_data = file("jenkins.sh")
  ami = data.aws_ami.ami_info.id

  tags = {
    Name = "jenkins"
    Terraform   = "true"
    Environment = "dev"
  }
}

module "jenkins-agent" {
  source  = "terraform-aws-modules/ec2-instance/aws"

  name = "jenkins-agent"

  instance_type          = "t2.micro"
  vpc_security_group_ids = ["sg-03ec942beb955be40"]
  subnet_id              = "subnet-0c35fdd17ccc49343"
  user_data = file("jenkins-agent.sh")
  ami = data.aws_ami.ami_info.id

  tags = {
    Name = "jenkins-agent"
    Terraform   = "true"
    Environment = "dev"
  }
}
module "records" {
  source  = "terraform-aws-modules/route53/aws//modules/records"
  version = "~> 3.0"

  zone_name = var.zone_name

  records = [
    {
      name    = "jenkins"
      type    = "A"
      ttl     = 1
      records = [
        module.jenkins.public_ip
      ]
    },
    {
      name    = "jenkins-agent"
      type    = "A"
      ttl     = 1
      records = [
        module.jenkins-agent.public_ip
      ]
    },
  ]
}