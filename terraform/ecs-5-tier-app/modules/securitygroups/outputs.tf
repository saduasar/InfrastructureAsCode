output "frontend-servers_sg_id" {
  value = aws_security_group.frontend-servers.id
}

output "backend-servers_sg_id" {
  value = aws_security_group.backend-servers.id
}