# CI Toolbox (AWS, Chef, Docker) Docker image

This container comes with everything needed to:
- package a cookbook and load it on AWS S3
- launch app deploy on AWS OpsWorks
- build and push Docker images on DockerHub or AWS ECR

## What's included
 - AWS CLI
 - Docker
 - Chef

### AWS CLI
AWS CLI to deploy on AWS (OpsWorks, ECR, ECS)
#### Required
  - AWS_ACCESS_KEY_ID
  - AWS_SECRET_ACCESS_KEY

#### Custom Scripts
  - `deploy-app [region] [stack-id] [application-id]`

### Docker
DinD to build your images and push them directly on your favorite registry

#### Custom Scripts
  - `docker-tools [load|store|build|publish|publish-aws]`

### Chef
Chef tools to compile and test cookbooks.
#### Tools
  - rubocop
  - foodcritic
