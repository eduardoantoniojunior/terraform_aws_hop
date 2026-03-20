variable "project_name" {
  description = "Nome do projeto (usado em nomes de recursos)"
  type        = string
}

variable "region" {
  description = "Região AWS onde os recursos serão criados"
  type        = string
  default     = "us-east-1"
}

variable "ami_id" {
  description = "ID da AMI do Rocky Linux (se null, pode ser usado um data source dinâmico)"
  type        = string
  default     = null
}

variable "instance_type" {
  description = "Tipo da instância EC2"
  type        = string
  default     = "t3.micro"
}

variable "key_name" {
  description = "Nome do par de chaves SSH para acesso à instância (opcional)"
  type        = string
  default     = null
}

variable "tags" {
  description = "Tags adicionais que serão mescladas com as tags locais"
  type        = map(string)
  default     = {}
}

variable "cidr_blocks" {
  description = "Lista de CIDRs para liberar acesso SSH e HTTP (ex: [\"0.0.0.0/0\"] ou IPs específicos)"
  type        = list(string)
}

variable "hop_version" {
  description = "Versão da imagem Docker do Apache Hop (ex: latest, 2.17.0)"
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