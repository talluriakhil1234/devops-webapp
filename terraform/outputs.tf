output "jenkins_instance_id" {
  value = aws_instance.jenkins.id
}

output "jenkins_private_ip" {
  value = aws_instance.jenkins.private_ip
}

output "ansible_instance_id" {
  value = aws_instance.ansible.id
}

output "ansible_private_ip" {
  value = aws_instance.ansible.private_ip
}

output "k8s_instance_id" {
  value = aws_instance.k8s.id
}

output "k8s_private_ip" {
  value = aws_instance.k8s.private_ip
}