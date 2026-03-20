variable "project_name" {
  description = "Nome do projeto"
  type        = string
}

variable "tags" {
  description = "Tags padrão que serão aplicadas aos recursos"
  type        = map(string)
  default     = {}
}

variable "vpc_id" {
  description = "ID da VPC onde a instância será criada"
  type        = string
}

variable "public_subnet_id" {
  description = "ID da sub-rede pública para a instância"
  type        = string
}

variable "ami_id" {
  description = "AMI do Rocky Linux"
  type        = string
  default     = null
}

variable "instance_type" {
  description = "Tipo da instância EC2"
  type        = string
  default     = null
}

variable "key_name" {
  description = "Nome do par de chaves SSH (opcional)"
  type        = string
  default     = null
}

variable "cidr_blocks" {
  description = "Ips para liberação (SSH e HTTP)"
  type        = list(string)
}

variable "hop_version" {
  description = "Versão da imagem Docker do Apache Hop"
  type        = string
}

variable "hop_user" {
  description = "Usuário para autenticação no Hop Web"
  type        = string
  sensitive   = true
}

variable "hop_password" {
  description = "Senha para autenticação"
  type        = string
  sensitive   = true
}

variable "region" {
  description = "Região AWS onde os recursos serão criados"
  type        = string
}