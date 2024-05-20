resource "aws_instance" "adminhost" {
  ami                         = var.ami
  iam_instance_profile        = aws_iam_instance_profile.instance_profile.id
  instance_type               = var.instance_type
  key_name                    = var.key_name
  subnet_id                   = var.subnet_id
  vpc_security_group_ids      = var.vpc_security_group_ids
  associate_public_ip_address = var.associate_public_ip_address
  user_data_base64            = var.user_data_base64

  root_block_device {
    volume_size = var.root_volume_size
    volume_type = var.root_volume_type
    encrypted   = var.volume_encrypted
    kms_key_id  = var.kms_key_id
  }

  tags = {
    Name = format("${var.name}-%s-%s", "admin", "server")
  }
}
