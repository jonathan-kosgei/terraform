resource "azure_instance" "kubeminions" {
    name = "sc-minion-${count.index}"
    hosted_service_name = "sc-minion-${count.index}"
    image = "Ubuntu Server 16.04 LTS"
    size = "Basic_A1"
    storage_service_name = "${azure_storage_service.sc-storage.name}"
    location = "East US"
    virtual_network = "${azure_virtual_network.sc-virtual-network.id}"
    subnet = "kubeminions"
    username = "jonathan"
    ssh_key_thumbprint = "${var.ssh_key_thumbprint}"
    security_group = "${azure_security_group.kubeminions.name}"
    count = "2"
    endpoint {
        name = "SSH"
        protocol = "tcp"
        public_port = 22
        private_port = 22
    }
    endpoint {
        name = "Kubelet"
        protocol = "tcp"
        public_port = 10250
        private_port = 10250
    }
}