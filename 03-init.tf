resource "null_resource" "setup_cpx41" {
  depends_on = [
    null_resource.ssh_port_cpx41]
  count = var.servers_cpx41_count
  connection {
    host = hcloud_server.webinar_cpx41[count.index].ipv4_address
    type = "ssh"
    port = var.ssh_port
    private_key = file(var.ssh_private_key)
  }

  provisioner "file" {
    source = "scripts/bootstrap.sh"
    destination = "/root/bootstrap.sh"
  }

  provisioner "file" {
    source = "scripts/bbb-install.sh"
    destination = "/root/bbb-install.sh"
  }

  provisioner "remote-exec" {
#     inline = [
#       "BBB_DOMAIN=${var.domain_prefix}${count.index}-t1.${var.domain} bash /root/bootstrap.sh"]
#   }
}
