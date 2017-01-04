# Configure the CloudFlare provider
provider "cloudflare" {
    email = "jonathankosgei1000@gmail.com"
    token = "21848ca59b158bbc5f01febf6de8ab3520295"
}

resource "cloudflare_record" "wildcard" {
    domain = "saharacluster.com"
    name = "*"
    value = "${azure_instance.ingresscontroller.vip_address}"
    type = "A"
    ttl = 0
    priority = 100
}