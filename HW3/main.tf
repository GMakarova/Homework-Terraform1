
# key pair

resource "aws_key_pair" "deployer" {
  key_name   = "bastion"
  public_key = file("~/.ssh/id_rsa.pub")
}

# creating new instance

resource "aws_instance" "web" {
  ami           = "ami-0604d81f2fd264c7b"
  instance_type = "t2.micro"
user_data = file ("apache.sh")
subnet_id = "subnet-03a886c2c29f2938e"
key_name = aws_key_pair.deployer.key_name
vpc_security_group_ids = [aws_security_group.allow_tls.id]

  tags = {
    Name = "Web1"
  }
}

resource "aws_instance" "web2" {
  ami  = "ami-0604d81f2fd264c7b"
  instance_type = "t2.micro"
  user_data = file ("apache.sh")
subnet_id = "subnet-03a886c2c29f2938e"
key_name = aws_key_pair.deployer.key_name
  vpc_security_group_ids = [aws_security_group.allow_tls.id]
 
  tags = {
    Name = "Web2"
  }
}

resource "aws_instance" "web3" {
  ami  = "ami-0604d81f2fd264c7b"
  instance_type = "t2.micro"
   user_data = file("apache.sh")
  subnet_id = "subnet-03a886c2c29f2938e"
  key_name = aws_key_pair.deployer.key_name
    vpc_security_group_ids = [aws_security_group.allow_tls.id]
    
  tags = {
    Name = "Web3"
  }
}

output ec1 {
    value = aws_instance.web.public_ip
    # sensitive = true
}
output ec2 {
    value = aws_instance.web2.public_ip
    # sensitive = true
}
output ec3 {
    value = aws_instance.web3.public_ip
    # sensitive = true
}
