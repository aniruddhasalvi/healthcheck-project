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
