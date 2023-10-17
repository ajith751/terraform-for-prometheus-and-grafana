module "ec2_instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"

  name = "prometheus-Server"
  ami = "ami-01df4a8e4112a56a3"
  instance_type          = "t2.micro"
  key_name               = "jenkins"
  monitoring             = true
  vpc_security_group_ids = ["sg-076bbf8a4ce79b6aa"]
  user_data = file("prometheus.sh")

}
