This repo consists terraform scripts, Helm Chart and Github Action Workflow. It is a simple "welcome message" flask web application.

Pre-requisite:
- Create a S3 bucket file to store terraform state file
- Create IAM user with access_key and secret_key that should have  permission to create EKS cluster, EC2, VPC, ECR, IAMPolicyAttachement 


Before creating infratructure export AWS authentication variables

$ export AWS_ACCESS_KEY_ID="anaccesskey"
$ export AWS_SECRET_ACCESS_KEY="asecretkey"
$ export AWS_DEFAULT_REGION="us-west-2"

Variables:
    Terraform variables has been defined in config.tfvars file. Modify the file with appropiate parameters

Terraform Backend:
  Using S3 as backend to store terraform state file. Make sure to modify bucket name and key file name in backend.tf file.

Create infrastructure:
$ cd infrastructure
$ terraform init -var-file=config.tfvars
$ terraform plan -var-file=config.tfvars
$ terraform apply -var-file=config.tfvars --auto-approve (auto approve the command)

Get the kubeconfig file:
$ terraform output -raw kubeconfig > filename.txt

Application Deployment:
Helm Chart is being use to deploy flask application in kubernetes cluster

$ docker build -t $ecr_repo_url:$version
$ helm upgrade --install release_name helm_chart --set image.repository=$ecr_repo_url --set image.tag=$version

Testing application:
As kubernetes ingress has not been deployed along with application container so application can be access via port-forward to pod

$ kubectl port-forward service/release_name host_port:5000

CI/CD:
Github action workflow will act as automated pipeline to create infrastructure and deploy application using helm

Note: Github workflow CI/CD not tested as it require certain variables to be stored in repository environment variables.

