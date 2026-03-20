# Security group para a instância
resource "aws_security_group" "hop_sg" {
  name        = "${var.project_name}-sg"
  description = "Permite SSH e UI do Apache Hop"
  vpc_id      = var.vpc_id

  tags = merge(var.tags, {
    Name = "${var.project_name}-sg"
  })
}

# Regra de entrada para SSH (porta 22)
resource "aws_security_group_rule" "ssh_in" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  cidr_blocks       = var.cidr_blocks
  security_group_id = aws_security_group.hop_sg.id
}

# Regra de entrada para HTTP (porta 80) – onde o Nginx estará ouvindo
resource "aws_security_group_rule" "http_in" {
  type              = "ingress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  cidr_blocks       = var.cidr_blocks
  security_group_id = aws_security_group.hop_sg.id
}

# Regra de saída (todo tráfego)
resource "aws_security_group_rule" "all_out" {
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.hop_sg.id
}

# Instância EC2
resource "aws_instance" "hop" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  subnet_id              = var.public_subnet_id
  vpc_security_group_ids = [aws_security_group.hop_sg.id]
  key_name               = var.key_name
  region                 = var.region

  user_data = templatefile("${path.module}/user_data.sh.tftpl", {
    hop_version  = var.hop_version
    hop_user     = var.hop_user
    hop_password = var.hop_password
  })

  tags = merge(var.tags, {
    Name = "${var.project_name}-instance"
  })
}