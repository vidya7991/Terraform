mkdir learn-terraform-aws-instance
cd learn-terraform-aws-instance
touch main.tf
terraform init
terraform fmt
terraform validate
terraform apply
terraform show
terraform state list
terraform apply -var "instance_name=YetAnotherName"