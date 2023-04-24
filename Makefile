
init:
	terraform init

format:
	terraform fmt

validate:
	terraform validate

apply:
	terraform apply -var-file="global.tfvars"
