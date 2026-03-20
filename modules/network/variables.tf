variable "project_name" {
  description = "Nome do projeto"
  type        = string
}

variable "tags" {
  description = "Tags padrão"
  type        = map(string)
  default     = {}
}

variable "cidr_block" {
  description = "CIDR do VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "public_subnet_cidr" {
  description = "CIDR do subnet público"
  type        = string
  default     = "10.0.1.0/24"
}

variable "availability_zone" {
  description = "Zona de disponibilidade para a sub-rede pública"
  type        = string
  default     = "us-east-1a"
}