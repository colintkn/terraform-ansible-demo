resource "aws_security_group" "web_sg" {
  name        = "simple-web-sg"
  description = "Allow HTTP from anywhere"
  vpc_id      = data.aws_vpc.default.id

  ingress {
    description = "HTTP"
    # from_port   = 80
    # to_port     = 80
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# -------------------------------
# GET DEFAULT VPC + SUBNET
# -------------------------------
data "aws_vpc" "default" {
  default = true
}

data "aws_subnets" "default" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.default.id]
  }
}

# -------------------------------
# EC2 INSTANCE
# -------------------------------
resource "aws_instance" "web" {
  ami           = data.aws_ami.amazon_linux.id
  instance_type = "t3.micro" # smallest general-purpose x86 instance
  subnet_id     = element(data.aws_subnets.default.ids, 0)
  security_groups = [aws_security_group.web_sg.id]

  metadata_options {
  http_endpoint               = "enabled"
  http_tokens                 = "required"   # <– Enforce IMDSv2
  http_put_response_hop_limit = 1
  }

  key_name = aws_key_pair.web_key.key_name

  tags = {
    Name = "simple-web-server"
  }
}

# -------------------------------
# AMI – Amazon Linux 2023
# -------------------------------
data "aws_ami" "amazon_linux" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["al2023-ami-*-kernel-6.1-x86_64"]
  }
}

resource "aws_key_pair" "web_key" {
  key_name   = "web-server-key"
  public_key = var.ssh_public_key
}


output "public_ip" {
  value = aws_instance.web.public_ip
}

output "web_url" {
  value = "http://${aws_instance.web.public_ip}"
}
