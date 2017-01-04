# Connect to the Azure Provider
provider "azure" {
publish_settings = "${file("BizSpark-6-21-2016-credentials.publishsettings")}"
}
