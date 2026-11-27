# Health Check Script

A Bash script that checks the state of a Linux server and saves the result to a dated log file.

## What it checks
- Date and hostname
- Disk usage ('df -h /')
- Memory usage ('free -h')
- Top 3 processes by CPU
- Whether the 'ssh' service is running

## Usage
chmod +x healthcheck.sh
./healthcheck.sh

The log is saved to '~/lab/logs/health-YYYY-MM-DD.log'.

## Tested on
Ubuntu 26.04 (Hyper-V VM)

## Terraform: launch a test EC2

Creates a t3.micro Ubuntu EC2 in ap-southeast-2. SSH (port 22) is allowed only from your own IP.

Needs: Terraform, AWS CLI logged in, and an SSH public key at `~/.ssh/id_ed25519.pub`.

Run:

    cd terraform
    echo 'my_ip = "YOUR_PUBLIC_IP/32"' > terraform.tfvars
    terraform init
    terraform plan
    terraform apply
    ssh ubuntu@$(terraform output -raw public_ip)
    terraform destroy

`terraform.tfvars` is git-ignored (personal value). Run `terraform destroy` when done to avoid AWS cost.
