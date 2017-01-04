resource "azure_virtual_network" "sc-virtual-network" {
    name = "sc-virtual-network"
    address_space = ["172.1.0.0/16"]
    location = "East US"
    subnet {
        name = "kubemasters"
        address_prefix = "172.1.1.0/24"
        security_group = "kubemaster"
    }
    subnet {
        name = "kubeminions"
        address_prefix = "172.1.2.0/24"
        security_group = "kubeminions"
    }
    subnet {
        name = "nat"
        address_prefix = "172.1.3.0/24"
        security_group = "nat"
    }
}