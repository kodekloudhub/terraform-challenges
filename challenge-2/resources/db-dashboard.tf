resource "docker_container" "phpmyadmin" {
  name     = "db_dashboard"
  image    = "phpmyadmin/phpmyadmin"
  hostname = "phpmyadmin"
  networks_advanced {
    name = docker_network.private_network.id
  }
  depends_on = [
    docker_container.mariadb
  ]
  links = [
    docker_container.mariadb.name
  ]
  labels {
    label = "challenge"
    value = "second"
  }
  ports {
    internal = "80"
    external = "8081"
    ip       = "0.0.0.0"
  }
}
