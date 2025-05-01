module "microservice" {
  source = "./module/helm-chart"
  depends_on = [null_resource.helm_s3_init]
  description = "Microservices para apis do orbitspot"
  name = "microservices"
  versionament = "0.0.1"
  bucket = aws_s3_bucket.default.id
}

module "front-nginx" {
  source = "./module/helm-chart"
  depends_on = [null_resource.helm_s3_init]
  description = "Nginx Frontend do orbitspot"
  name = "front-nginx"
  versionament = "0.0.1"
  bucket = aws_s3_bucket.default.id
}
