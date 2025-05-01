resource "null_resource" "helm_s3_init" {
  depends_on = [aws_s3_bucket.default]

  provisioner "local-exec" {
    command = "mkdir -p /root/.config/helm && touch /root/.config/helm/repositories.yaml && helm s3 init s3://${var.bucket_name}/charts"
  }

  triggers = {
    bucket_id = aws_s3_bucket.default.id
  }
}
