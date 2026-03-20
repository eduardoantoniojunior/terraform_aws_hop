output "hop_instance_public_ip" {
  value = module.hop_app.instance_public_ip
}

output "hop_ui" {
  value = module.hop_app.hop_web_url
}
