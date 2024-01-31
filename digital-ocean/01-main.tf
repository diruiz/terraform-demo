resource "digitalocean_kubernetes_cluster" "diegocluster" {
    name = "diego"
    region = "nyc1"
    version = "1.29.0-do.0"
    
    node_pool {
        name = "diego-nodes"
        size = "s-1vcpu-2gb"
        node_count = 1
        tags = ["diego-nodes"]
    }  
}