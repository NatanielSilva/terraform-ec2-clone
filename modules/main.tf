terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      #version = "~> 3.0"
    }
  }
}



//Get aws instance details
data "aws_instance" "source_instance" {
  instance_id = var.source_instance_id
}

resource "aws_ami_from_instance" "sourceami" {
  name               = "source-instance"
  source_instance_id = var.source_instance_id
}

resource "aws_instance" "newinstance" {
  ami                    = aws_ami_from_instance.sourceami.id
  instance_type          = data.aws_instance.source_instance.instance_type
  vpc_security_group_ids = [
    "", #TECHNE-VPN-FORGATE
    "", #Lyceum-Admin-SG
    
  ]
  
  subnet_id              = data.aws_instance.source_instance.subnet_id
  key_name = ".pem"
   tags = merge(

    {
   Name = "name"
      Contrato           = "true"
      FG_VPN_GRU_AM = "true"
      FG_VPN_GR_CONSULTORIA = "true"
      FG_VPN_GR_SERVICO = "true"
      FG_VPN_GR_SERVICO = "true"
      Equipe             = "techne"
      LN = "techne"
      Apps = "App"
    },
  )

}
