output "public_ip" {
  value = aws_instance.lab.public_ip
}

output "ami_id" {
  value = data.aws_ami.ubuntu.id
}
