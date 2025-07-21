output "instance_id" {
  value = aws_instance.this.id
}

output "ebs_volume_ids" {
  value = [for v in aws_ebs_volume.volumes : v.id]
}
