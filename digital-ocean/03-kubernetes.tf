# from the previous resource created (local_file) we can obtain the kubernetes configfile path and use in the kubernetes provider 
provider "kubernetes" {
  config_path   = "${local_file.kubernetes_config.filename}"
}

#create a kubernetes namespace
resource "kubernetes_namespace" "example_namespace" {
  metadata {
    name = "application-namespace"
  }
}