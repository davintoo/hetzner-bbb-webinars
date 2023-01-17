provider "hcloud" {
  token = var.hcloud_token
}

resource "hcloud_ssh_key" "admin" {
  name = "admin"
  public_key = file(var.ssh_public_key)
}

resource "hcloud_server" "webinar_cpx51" {
  count = var.servers_cpx51_count
  name = "${var.domain_prefix}${count.index}-t2"
  location = var.location
  server_type = "cpx51"
  image = var.server_image
  ssh_keys = [
    hcloud_ssh_key.admin.id]
  firewall_ids = [
    hcloud_firewall.firewall.id]
}
