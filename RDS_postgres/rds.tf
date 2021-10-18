provider "aws" {
  region = "eu-central-1"
}

resource "aws_db_instance" "postgres_for_INFR" {
  allocated_storage      = 20
  subnet_ids             = ["subnet-0dc1304a700922b8e"]
  vpc_security_group_ids = ["sg-000136bfcb6fe5df6"]
  engine                 = "postgresql"
  engine_version         = "12.8"
  instance_class         = "db.t2.micro"
  name                   = "mydb-postgres"
  username               = "Andrey"
  password               = "4741"
  parameter_group_name   = "default.mysql12.8"
  skip_final_snapshot    = true
}
