output "IP address" {
 value = "${module.container.ip}"
}

output "container_name" {
  value = "${module.container.name}"
}
