login:
	gcloud auth application-default login

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
	
output:
	terraform output

all: validate plan apply
