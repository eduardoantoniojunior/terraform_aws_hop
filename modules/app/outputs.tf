output "instance_public_ip" {
  description = "IP público da instância EC2"
  value       = aws_instance.hop.public_ip
}

output "instance_private_ip" {
  description = "IP privado da instância EC2"
  value       = aws_instance.hop.private_ip
}

output "hop_web_url" {
  description = "URL para acessar a interface web do Apache Hop (Hop Gui)"
  value       = "http://${aws_instance.hop.public_ip}/ui"
}

output "ssh_command" {
  description = "Comando SSH para conectar à instância (se uma chave foi fornecida)"
  value       = var.key_name != null ? "ssh -i ${var.key_name}.pem rocky@${aws_instance.hop.public_ip}" : null
}

output "access_summary" {
  description = "Resumo completo das informações de acesso"
  value       = <<-EOT
    ==================================================
    Apache Hop Web está disponível!
    URL: http://${aws_instance.hop.public_ip}/ui
    Usuário: ${var.hop_user}
    Senha: (definida, não exibida por segurança)
    
    Acesso SSH:
    ${var.key_name != null ? "ssh -i ${var.key_name}.pem rocky@${aws_instance.hop.public_ip}" : "Nenhuma chave SSH configurada."}
    
    Certifique-se de que a porta 80 (HTTP) está liberada no security group.
    ==================================================
  EOT
}