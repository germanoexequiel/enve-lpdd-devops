resource "aws_instance" "lpdd-ops-cicd-srvr1" {
  ami           = "ami-013f17f36f8b1fefb"
  instance_type = "t2.small"
  key_name = "${var.key-name}"
  vpc_security_group_ids = ["${aws_security_group.lpdd-ops-cicd-sg.id}"]
  subnet_id = "${aws_subnet.lpdd-ops-sn-a.id}"

  root_block_device {
    volume_size = "10"
  }

  ebs_block_device {
    device_name = "/dev/sdg"
    volume_size = 100
    volume_type = "gp2"
    delete_on_termination = false
  }

  provisioner "remote-exec" {
    inline = [
      "sudo hostname lpdd-ops-cicd-srvr1",
      "sudo bash -c 'echo lpdd-ops-cicd-srvr1 > /etc/hostname'",
      "sudo /usr/bin/perl -pi -ne 's/(^127.0.0.1 localhost)/$1 lpdd-ops-cicd-srvr1/' /etc/hosts",
      "sudo mkfs -t ext4 /dev/xvdg",
      "sudo mount /dev/xvdg /opt",
      "sudo bash -c 'echo /dev/xvdg /optext4 defaults,nofail 0 2 >> /etc/fstab'"
    ]

    connection {
      host = "${self.public_ip}"
      type     = "ssh"
      user     = "ubuntu"
      private_key = "${file(var.key)}"
    }
  }

  tags = {
    type = "lpdd-ops-cicd-srvr1"
    env  = "ops"
    Name = "lpdd-ops-cicd-srvr1"
  }

}

