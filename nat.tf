resource "azure_instance" "nat" {
    name = "sc-nat"
    hosted_service_name = "sc-nat"
    image = "Ubuntu Server 16.04 LTS"
    size = "Basic_A0"
    storage_service_name = "${azure_storage_service.sc-storage.name}"
    location = "East US"
    virtual_network = "${azure_virtual_network.sc-virtual-network.id}"
    subnet = "nat"
    username = "jonathan"
    ssh_key_thumbprint = "${var.ssh_key_thumbprint}"
    security_group = "${azure_security_group.nat.name}"
    endpoint {
        name = "SSH"
        protocol = "tcp"
        public_port = 22
        private_port = 22
    }
    endpoint {
        name = "HTTP"
        protocol = "tcp"
        public_port = 80
        private_port = 80
    }
    provisioner "remote-exec" {
      inline = [
        "sudo iptables -t nat -A POSTROUTING -j MASQUERADE",
        "echo 1 | sudo tee /proc/sys/net/ipv4/ip_forward > /dev/null",
      ]
    }
}