resource "docker_network" "private_network" {
  name       = "my_network"
  attachable = true
  labels {
    label = "challenge"
    value = "second"
  }
}
