module "ec2_with_ebs" {
  source            = "./ec2-ebs-module"
  ami_id            = "ami-12345678"
  instance_type     = "t3.medium"
  subnet_id         = "subnet-xxxxxxx"
  availability_zone = "us-east-1a"
  key_name          = "my-keypair"
  security_groups   = ["sg-xxxxxxxx"]
  volume_size       = 20
  tags = {
    Environment = "dev"
    CreatedBy   = "terraform"
  }
}
