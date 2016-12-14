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
  - `opsworks-deploy [region] [stack-id] [application-id]`
  - `ecs-deploy usage`

### Docker
DinD to build your images and push them directly on your favorite registry

#### `docker-tools`

##### `docker-tools load [imagename.tar]`
Load a tar file containing a docker image created by `docker-tools store`
##### `docker-tools store IMAGE [imagename.tar]`
Save IMAGE to a tar file
##### `docker-tools build name:tag`
Build a image with name:tag format in the current directory
##### `docker-tools publish IMAGE`
Publish an image to a registry

Requires:
 - DOCKER_REG_USER
 - DOCKER_REG_PASSWORD
 - DOCKER_REG_SERVER (defaults to Docker Hub)

##### `docker-tools publish-aws IMAGE AWS-TAG`
Publish an image to AWS ECR with tag AWS-TAG

Requires:
 - AWS_ACCOUNT_ID (Account ID)
 - AWS_DEFAULT_REGION (Region name `eu-west-1`)
 - AWS_ECR_NAME (Repository name)
 - AWS_ACCESS_KEY_ID
 - AWS_SECRET_ACCESS_KEY

### Chef
Chef tools to compile and test cookbooks.
#### Tools
  - rubocop
  - foodcritic
