data "template_file" "chart" {
  template = file("${path.module}/template/chart.tpl")
  vars = {
    description = var.description
    name        = var.name
    version     = var.versionament
  }
}

resource "local_file" "chart-yaml" {
  content  = data.template_file.chart.rendered
  filename = "${path.module}/charts/${var.name}/Chart.yaml"
}
