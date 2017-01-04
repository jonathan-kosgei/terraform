resource "azure_instance" "kubemasters" {
    name = "sc-master-${count.index}"
    hosted_service_name = "sc-master-${count.index}"
    image = "Ubuntu Server 16.04 LTS"
    size = "Basic_A1"
    storage_service_name = "${azure_storage_service.sc-storage.name}"
    location = "East US"
    virtual_network = "${azure_virtual_network.sc-virtual-network.id}"
    subnet = "kubemasters"
    username = "jonathan" 
    ssh_key_thumbprint = "${var.ssh_key_thumbprint}"
    security_group = "${azure_security_group.kubemaster.name}"
    count = "1"
    endpoint {
        name = "SSH"
        protocol = "tcp"
        public_port = 22
        private_port = 22
    }
    endpoint {
        name = "Kube Apiserver"
        protocol = "tcp"
        public_port = 8080
        private_port = 8080
    }
}