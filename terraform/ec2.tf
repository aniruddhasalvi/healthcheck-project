resource "aws_instance" "lab" {
  ami                         = data.aws_ami.ubuntu.id
  instance_type               = "t3.micro"
  key_name                    = aws_key_pair.lab.key_name
  vpc_security_group_ids      = [aws_security_group.ssh_only.id]
  associate_public_ip_address = true

  metadata_options {
    http_tokens = "required"
  }

  root_block_device {
    volume_size = 8
    volume_type = "gp3"
  }

  tags = {
    Name = "lab-ubuntu"
  }
}
