resource "azure_storage_service" "sc-storage" {
    name = "scazurestorage02"
    location = "East US"
    description = "Made by Terraform."
    account_type = "Standard_LRS"
}