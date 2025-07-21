resource "aws_instance" "this" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  subnet_id              = var.subnet_id
  key_name               = var.key_name
  security_groups        = var.security_groups
  iam_instance_profile   = var.iam_instance_profile

  metadata_options {
    http_endpoint               = "enabled"
    http_tokens                 = "optional"
    http_put_response_hop_limit = 1
  }

  tags = var.tags
}

resource "aws_ebs_volume" "volumes" {
  count             = 4
  availability_zone = var.availability_zone
  size              = var.volume_size
  type              = var.volume_type
  tags = merge(var.tags, {
    Name = "${var.instance_name}-ebs-${count.index + 1}"
  })
}

resource "aws_volume_attachment" "attachments" {
  count       = 4
  device_name = var.device_names[count.index]
  volume_id   = aws_ebs_volume.volumes[count.index].id
  instance_id = aws_instance.this.id
  force_detach = true
}
