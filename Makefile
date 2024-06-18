

NAME=jupyter-k8s.zip
AUTO=--auto-approve

init:
	terraform init

plan: init
	terraform plan -out ${NAME} 

apply: plan
	terraform apply "${NAME}"

destroy:
	terraform destroy  ${AUTO}