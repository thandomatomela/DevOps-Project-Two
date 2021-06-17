## This File Will Be Used To Provion The Environment Required For this Task(Build CI CD Pipeline)

provider "aws" {
    region  = "us-east-1"
    access_key = "AKIAT4XEGLISC4TO3ECY"
    secret_key = "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"
    
}

resource "aws_instance" "jenkins_server" {
  ami           = "ami-09e67e426f25ce0d7"
  instance_type = "t2.micro"
  key_name = "connect"
  user_data = "${file("install_jenkins_ansible.sh")}"
 
  tags = {
    Name = "Jenkins"
 }
}

resource "aws_instance" "webserver" {
  ami           = "ami-09e67e426f25ce0d7"
  instance_type = "t2.micro"
  key_name = "connect"
  user_data = "${file("install_nginx_mysql.sh")}"
  
 
  tags = {
    Name = "webserver"
 }
}

