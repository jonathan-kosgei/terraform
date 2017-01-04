resource "azure_security_group" "nat" {
    name = "nat"
    location = "East US"
}

resource "azure_security_group" "kubemaster" {
    name = "kubemaster"
    location = "East US"
}

resource "azure_security_group" "kubeminions" {
    name = "kubeminions"
    location = "East US"
}

resource "azure_security_group_rule" "http" {
    name = "http-access-rule"
    security_group_names = ["${azure_security_group.nat.name}"]
    type = "Inbound"
    action = "Allow"
    priority = 200
    source_address_prefix = "*"
    source_port_range = "*"
    destination_address_prefix = "172.1.3.0/24"
    destination_port_range = "80"
    protocol = "TCP"
}

resource "azure_security_group_rule" "kube" {
    name = "kube-access-rule"
    security_group_names = ["${azure_security_group.kubemaster.name}"]
    type = "Inbound"
    action = "Allow"
    priority = 200
    source_address_prefix = "*"
    source_port_range = "*"
    destination_address_prefix = "172.1.1.0/24"
    destination_port_range = "8080"
    protocol = "TCP"
}

resource "azure_security_group_rule" "flask" {
    name = "flask-access-rule"
    security_group_names = ["${azure_security_group.nat.name}"]
    type = "Inbound"
    action = "Allow"
    priority = 301
    source_address_prefix = "*"
    source_port_range = "*"
    destination_address_prefix = "172.1.3.0/24"
    destination_port_range = "5000"
    protocol = "TCP"
}


resource "azure_security_group_rule" "nat_ssh" {
    name = "nat_ssh-access-rule"
    security_group_names = ["${azure_security_group.nat.name}"]
    type = "Inbound"
    action = "Allow"
    priority = 201
    source_address_prefix = "*"
    source_port_range = "*"
    destination_address_prefix = "172.1.3.0/24"
    destination_port_range = "22"
    protocol = "TCP"
}

resource "azure_security_group_rule" "kubemaster_ssh" {
    name = "masters_ssh-access-rule"
    security_group_names = ["${azure_security_group.kubemaster.name}"]
    type = "Inbound"
    action = "Allow"
    priority = 201
    source_address_prefix = "172.1.3.0/24"
    source_port_range = "*"
    destination_address_prefix = "172.1.1.0/24"
    destination_port_range = "22"
    protocol = "TCP"
}

resource "azure_security_group_rule" "kubeminions_ssh" {
    name = "minions_ssh-access-rule"
    security_group_names = ["${azure_security_group.kubeminions.name}"]
    type = "Inbound"
    action = "Allow"
    priority = 202
    source_address_prefix = "172.1.3.0/24"
    source_port_range = "*"
    destination_address_prefix = "172.1.2.0/24"
    destination_port_range = "22"
    protocol = "TCP"
}

resource "azure_security_group_rule" "kubemaster_inbound" {
    name = "kubemaster_inbound-cluster-access-rule"
    security_group_names = ["${azure_security_group.kubemaster.name}"]
    type = "Inbound"
    action = "Allow"
    priority = 203
    source_address_prefix = "172.1.2.0/24"
    source_port_range = "*"
    destination_address_prefix = "172.1.1.0/24"
    destination_port_range = "*"
    protocol = "*"
}

resource "azure_security_group_rule" "kubemaster_outbound" {
    name = "kubemaster_outbound-cluster-access-rule"
    security_group_names = ["${azure_security_group.kubemaster.name}"]
    type = "Outbound"
    action = "Allow"
    priority = 204
    source_address_prefix = "172.1.2.0/24"
    source_port_range = "*"
    destination_address_prefix = "172.1.1.0/24"
    destination_port_range = "*"
    protocol = "*"
}

resource "azure_security_group_rule" "kubeminions_inbound" {
    name = "kubeminions_cluster-access-rule"
    security_group_names = ["${azure_security_group.kubeminions.name}"]
    type = "Inbound"
    action = "Allow"
    priority = 207
    source_address_prefix = "172.1.1.0/24"
    source_port_range = "*"
    destination_address_prefix = "172.1.2.0/24"
    destination_port_range = "*"
    protocol = "*"
}

resource "azure_security_group_rule" "kubeminions_outbound" {
    name = "kubeminions_cluster-access-rule"
    security_group_names = ["${azure_security_group.kubeminions.name}"]
    type = "Outbound"
    action = "Allow"
    priority = 208
    source_address_prefix = "172.1.1.0/24"
    source_port_range = "*"
    destination_address_prefix = "172.1.2.0/24"
    destination_port_range = "*"
    protocol = "*"
}