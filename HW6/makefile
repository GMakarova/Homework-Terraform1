virginia:
	terraform init -migrate-state
	terraform workspace new virginia || terraform workspace select virginia
	terraform apply -var-file virginia.tfvars --auto-approve
ohio:
	terraform init -migrate-state
	terraform workspace new ohio || terraform workspace select ohio
	terraform apply -var-file ohio.tfvars --auto-approve
california:
	terraform init -migrate-state
	terraform workspace new california || terraform workspace select california	
	terraform apply -var-file california.tfvars --auto-approve
oregon:
	terraform init -migrate-state
	terraform workspace new oregon || terraform workspace select oregon
	terraform apply -var-file oregon.tfvars --auto-approve
	
apply-all: virginia ohio california oregon

virginia-destroy:
	terraform workspace new virginia || terraform workspace select virginia
	terraform init
	terraform destroy -var-file virginia.tfvars --auto-approve
ohio-destroy:
	terraform workspace new ohio || terraform workspace select ohio
	terraform init
	terraform destroy -var-file ohio.tfvars --auto-approve
california-destroy:
	terraform workspace new california || terraform workspace select california
	terraform init
	terraform destroy -var-file california.tfvars --auto-approve
oregon-destroy:
	terraform workspace new oregon || terraform workspace select oregon
	terraform init
	terraform destroy -var-file oregon.tfvars --auto-approve

destroy-all: virginia-destroy ohio-destroy california-destroy oregon-destroy	