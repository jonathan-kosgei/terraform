resource "azure_hosted_service" "sc-nat" {
    name = "sc-nat"
    location = "East US"
    ephemeral_contents = false
    description = "Hosted service created by Terraform."
    label = "tf-hs-01"
    provisioner "local-exec" {
        command = "azure service cert create ${self.name} ${var.ssh_key_path}"
  }
}

resource "azure_hosted_service" "sc-masters" {
    name = "sc-master-0"
    location = "East US"
    ephemeral_contents = false
    description = "Hosted service created by Terraform."
    label = "tf-hs-01"
    count = 1
    provisioner "local-exec" {
        command = "azure service cert create ${self.name} ${var.ssh_key_path}"
  }
}

resource "azure_hosted_service" "sc-minions" {
    name = "sc-minion-${count.index}"
    location = "East US"
    ephemeral_contents = false
    description = "Hosted service created by Terraform."
    label = "tf-hs-01"
    count = 2
    provisioner "local-exec" {
        command = "azure service cert create ${self.name} ${var.ssh_key_path}"
  }
}

resource "azure_hosted_service" "sc-ingress" {
    name = "sc-ingress-${count.index}"
    location = "East US"
    ephemeral_contents = false
    description = "Hosted service created by Terraform."
    label = "tf-hs-01"
    count = 1
    provisioner "local-exec" {
        command = "azure service cert create ${self.name} ${var.ssh_key_path}"
  }
}
resource "azure_hosted_service" "sc-nfs" {
    name = "sc-nfs-${count.index}"
    location = "East US"
    ephemeral_contents = false
    description = "Hosted service created by Terraform."
    label = "tf-hs-01"
    count = 1
    provisioner "local-exec" {
        command = "azure service cert create ${self.name} ${var.ssh_key_path}"
  }
}

#resource "azure_hosted_service" "sc-glusterfs" {
#    name = "sc-glusterfs-${count.index}"
#    location = "East US"
#    ephemeral_contents = false
#    description = "Hosted service created by Terraform."
#    label = "tf-hs-01"
#    count = 2
#    provisioner "local-exec" {
#        command = "azure service cert create ${self.name} ${var.ssh_key_path}"
#  }
#}