variable "ami_id" {
  description = "AMI ID for the EC2 instance"
  type        = string
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t3.micro"
}

variable "subnet_id" {
  description = "Subnet ID where EC2 instance will be deployed"
  type        = string
}

variable "availability_zone" {
  description = "Availability Zone for EBS volumes"
  type        = string
}

variable "key_name" {
  description = "SSH Key Pair name"
  type        = string
}

variable "security_groups" {
  description = "List of security group IDs"
  type        = list(string)
}

variable "volume_size" {
  description = "Size of each EBS volume in GB"
  type        = number
  default     = 10
}

variable "volume_type" {
  description = "EBS volume type"
  type        = string
  default     = "gp3"
}

variable "device_names" {
  description = "List of device names for volume attachment"
  type        = list(string)
  default     = ["/dev/sdf", "/dev/sdg", "/dev/sdh", "/dev/sdi"]
}

variable "tags" {
  description = "Tags to apply to EC2 and EBS resources"
  type        = map(string)
  default     = {}
}
