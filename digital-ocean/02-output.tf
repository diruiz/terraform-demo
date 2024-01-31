# save the kubernetes config in the file kubeconfig.yaml from the resource created in the previous step
resource "local_file" "kubernetes_config" {
  content = "${digitalocean_kubernetes_cluster.diegocluster.kube_config.0.raw_config}"
  filename = "kubeconfig.yaml"
}