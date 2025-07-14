resource "aws_launch_template" "mylt" {
  name          = "terraform-lt"
  description   = "It is created with Terraform"
  image_id      = "ami-000ec6c25978d5999"
  instance_type = "t2.micro"
  key_name      = "helm"

  vpc_security_group_ids = [aws_security_group.public_sg.id]

  user_data = base64encode(<<EOF
#!/bin/bash
sudo yum update -y
sudo yum install httpd -y
sudo systemctl start httpd
sudo systemctl enable httpd
echo "<html><body><h1>Welcome to Auto Scaling Group Class</h1></body></html>" | sudo tee /var/www/html/index.html
sudo chmod 766 /var/www/html/index.html
EOF
  )
}
