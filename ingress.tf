resource "azure_instance" "ingresscontroller" {
    name = "sc-ingress-${count.index}"
    hosted_service_name = "sc-ingress-${count.index}"
    image = "Ubuntu Server 16.04 LTS"
    size = "Basic_A1"
    storage_service_name = "${azure_storage_service.sc-storage.name}"
    location = "East US"
    virtual_network = "${azure_virtual_network.sc-virtual-network.id}"
    subnet = "nat"
    username = "jonathan"
    ssh_key_thumbprint = "${var.ssh_key_thumbprint}"

    count = "1"
    endpoint {
        name = "HTTP"
        protocol = "tcp"
        public_port = 80
        private_port = 80
    }
    endpoint {
        name = "FLASK"
        protocol = "tcp"
        public_port = 5000
        private_port = 5000
    }
    endpoint {
        name = "SSH"
        protocol = "tcp"
        public_port = 22
        private_port = 22
    }

    provisioner "remote-exec" {
      inline = [
        "sudo apt-get update",
        "sudo apt-get install nginx -y",
        "sudo systemctl enable nginx"
      ]
    }
    #provisioner "file" {
    #    source = "files/nginx.conf"
    #    destination = "/etc/nginx/nginx.conf"
    #}
    #provisioner "remote-exec" {
    #  inline = [
    #    "sudo service nginx restart"
    #  ]
    #}    
}