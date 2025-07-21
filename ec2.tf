locals {
  instances = {
    "ec2-a" = {
      ami_id               = "ami-xxxxx"
      instance_type        = "t3.micro"
      subnet_id            = "subnet-aaaa"
      availability_zone    = "us-east-1a"
      key_name             = "my-keypair"
      security_groups      = ["sg-xxxxxx"]
    }
    "ec2-b" = {
      ami_id               = "ami-yyyyy"
      instance_type        = "t3.micro"
      subnet_id            = "subnet-bbbb"
      availability_zone    = "us-east-1b"
      key_name             = "my-keypair"
      security_groups      = ["sg-yyyyyy"]
    }
  }
}

module "ec2_instances" {
  source = "./modules/ec2-with-ebs"
  for_each = local.instances

  instance_name         = each.key
  ami_id                = each.value.ami_id
  instance_type         = each.value.instance_type
  subnet_id             = each.value.subnet_id
  availability_zone     = each.value.availability_zone
  key_name              = each.value.key_name
  security_groups       = each.value.security_groups
  iam_instance_profile  = "ec2-s3-access-profile" # Optional
  volume_size           = 20
  device_names          = ["/dev/sdf", "/dev/sdg", "/dev/sdh", "/dev/sdi"]
  tags = {
    Environment = "dev"
    CreatedBy   = "terraform"
  }
}
