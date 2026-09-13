provider "aws" {
  region = "ap-southeast-2"
}

resource "aws_security_group" "devops_sg" {
  name        = "devops-terraform-sg"
  description = "Security group managed by Terraform"

  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Jenkins"
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "devops-terraform-sg"
  }
}
resource "aws_instance" "jenkins" {
  ami                    = "ami-0453a43f384c588e1"
  instance_type          = "t3.small"
  subnet_id              = "subnet-069eda527bd6672e5"
  vpc_security_group_ids = ["sg-0787f2d0a41990821"]
  key_name               = "AKHI"

  iam_instance_profile = "devops-jenkins-ecr-role"

  tags = {
    Name = "devops-jenkins"
  }
}
resource "aws_instance" "k8s" {
  ami                    = "ami-0453a43f384c588e1"
  instance_type          = "t3.small"
  subnet_id              = "subnet-069eda527bd6672e5"
  vpc_security_group_ids = ["sg-0f3dfc77334d2b176"]
  key_name               = "AKHI"

  iam_instance_profile = "devops-k8s-ecr-role"

  tags = {
    Name = "devops-k8s"
  }
}
resource "aws_instance" "ansible" {
  ami                    = "ami-0453a43f384c588e1"
  instance_type          = "t3.small"
  subnet_id              = "subnet-069eda527bd6672e5"
  vpc_security_group_ids = ["sg-01f1ee7bfaaf4ddf3"]
  key_name               = "AKHI"

  tags = {
    Name = "devops-ansible"
  }
}