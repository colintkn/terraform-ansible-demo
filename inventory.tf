resource "aap_inventory" "inventory" {
  name         = "EC2"
  description  = "Inventory created via Terraform"
  variables = jsonencode(
    {
      "foo" : "bar"
    }
  )
}

resource "aap_host" "host" {
  name       = "webserver"
  inventory_id  = aap_inventory.inventory.id
  variables  = jsonencode({
    ansible_host = aws_instance.web.public_ip
  })
}

data "aap_job_template" "job_template" {
  name              = "Install Webserver"
  organization_name = "Default"
}

resource "aap_job" "job" {
  job_template_id = data.aap_job_template.job_template.id
  inventory_id    = aap_inventory.inventory.id

  # Force creation of this resource to wait for the aap_host.host resource to be created
  depends_on = [
    aap_host.host
  ]
}
