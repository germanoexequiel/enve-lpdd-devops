resource "aws_instance" "lpdd-dev-srvr1" {
  ami           = "ami-013f17f36f8b1fefb"
  instance_type = "t2.micro"
  key_name = "${var.key-name}"
  vpc_security_group_ids = ["${aws_security_group.lpdd-dev-sg.id}"]
  subnet_id = "${aws_subnet.lpdd-dev-sn-a.id}"

  root_block_device {
    volume_size = "20"
  }

  provisioner "remote-exec" {
    inline = [
      "sudo hostname lpdd-dev-srvr1",
      "sudo bash -c 'echo lpdd-dev-srvr1 > /etc/hostname'",
      "sudo /usr/bin/perl -pi -ne 's/(^127.0.0.1 localhost)/$1 lpdd-dev-srvr1/' /etc/hosts",
    ]

    connection {
      host = "${self.public_ip}"
      type     = "ssh"
      user     = "ubuntu"
      private_key = "${file(var.key)}"
    }
  }

  tags = {
    type = "lpdd-dev-srvr"
    env  = "dev"
    Name = "lpdd-dev-srvr1"
  }

}

