.PHONY: init format validate apply apply-safe plan clone-vars destroy

clone-vars:
	@./clone-variables.sh

init:
	terraform init

format:
	terraform fmt

validate: clone-vars
	terraform validate

apply: clone-vars
	terraform apply -auto-approve

apply-safe: clone-vars
	terraform apply

plan: clone-vars
	terraform plan

destroy:
	terraform destroy

