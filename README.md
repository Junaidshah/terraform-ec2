# terraform-ec2

## Dependencies:
This project is tested to work on ubuntu 18.04 with terraform 0.13.7

## Pre-requisites
An aws account is required to run this project. You will need the following configured prior to running the project:
- An aws account
- A ssh key-pair setup on the aws account
- Aws user credentials with AWS_ACCESS_KEY_ID, AWS_SECRET_ACCESS_KEY

## Usage
Run the following commands from the root of the repository:
- `export AWS_ACCESS_KEY_ID=<your_access_key>`
- `export AWS_SECRET_ACCESS_KEY=<your_secret_key>`
- `terraform init`
- `terraform apply` (At this step you will be prompted for your ssh-keypair name and account username).

If you are happy with the terraform plan, go ahead and hit `yes`.

## How does the project work?
The project will setup all the basic underlying components to get an ec2 instance running with the minimum required permissions.

Once the ec2 instance has been setup, terraform will apply the user-data script. This will run through aws cloud init and bootstrap the instance.

Under the hood the user-data is cloning another repository `https://github.com/Junaidshah/config.git` and using ansible to further configure the instance.

ansible will configure all required things to get the docker image running.

## Testing
Once the instance is completely configured. You should be able to ssh using the `ubuntu` user and your ssh-key.

on the ec2 host, you can check docker status by running:
- `docker ps`

to test the nginx default page
- curl http://localhost

you can also access the default nginx page through `http://<elastic-ip>`

the health of the docker container is displayed when you run `docker ps`

To check the words on the website and thier count run the following script:
- `python3 /usr/local/dev/config/word_crawler.py`

To check the resource usage of the docker container every 10 seconds run script:
- `/bin/bash /usr/local/dev/config/usage.sh`







