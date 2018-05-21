#Download the latest ghost image
module "image" {
  source = "./image"
  image  = "${lookup(var.image, var.env)}"
}

# start the container
module "container" {
  source   = "./container"
  image    = "${module.image.image_out}"
  name     = "${lookup(var.container_name, var.env)}"
  int_port = "${lookup(var.int_port, var.env)}"
  ext_port = "${lookup(var.ext_port, var.env)}"
}

resource "null_resource" "null_id" {
  provisioner "local-exec" {
    command = "echo ${module.container.name}:${module.container.ip} >> container.txt"
  }
}
