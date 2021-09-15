resource "aws_instance" "junaid-dev" {
  ami                         = var.instance_ami
  availability_zone           = "${var.aws_region}${var.aws_region_az}"
  instance_type               = var.instance_type
  associate_public_ip_address = true
  vpc_security_group_ids      = [aws_security_group.sg.id, aws_security_group.http.id, aws_security_group.egress.id]
  subnet_id                   = aws_subnet.subnet.id
  key_name                    = var.key_pair
  user_data                   = file("userdata/user-data.sh")
  iam_instance_profile        = aws_iam_instance_profile.nginx_profile.name

  root_block_device {
    delete_on_termination = true
    encrypted             = false
    volume_size           = var.root_device_size
    volume_type           = var.root_device_type
  }

  tags = {
    "Owner"               = var.owner
    "Name"                = "${var.owner}-dev"
    "KeepInstanceRunning" = "false"
  }
}
