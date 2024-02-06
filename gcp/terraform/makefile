init:
	terraform init -reconfigure -backend-config=backend.config

validate:
	terraform fmt -recursive
	terraform validate

plan:
	terraform validate
	terraform plan

apply:
	terraform apply --auto-approve

destroy:
	terraform destroy

all: validate plan apply
