resource "null_resource" "push_chart" {
  depends_on = [local_file.chart-yaml]
  triggers = {
    always_run = var.versionament
  }

  provisioner "local-exec" {
    command = <<-EOT
      helm plugin install https://github.com/hypnoglow/helm-s3.git && \
      helm package ${path.module}/charts/${var.name} -d packages/${var.name} && \
      helm repo add orbitspot s3://${var.bucket}/charts && \
      helm s3 push packages/${var.name}/orbitspot-${var.name}-${var.versionament}.tgz orbitspot
    EOT
  }

}

