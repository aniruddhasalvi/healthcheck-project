#!/bin/bash
LOG=~/lab/logs/health-$(date +%F).log
echo "=== Health check: $(date '+%F %T') ===" | tee -a "$LOG"
echo "Host: $(hostname)" | tee -a "$LOG"
echo "--- Disk usage ---" | tee -a "$LOG"
df -h / | tee -a "$LOG"
echo "--- Memory ---" | tee -a "$LOG"
free -h | tee -a "$LOG"
echo "--- Top 3 CPU processes ---" | tee -a "$LOG"
ps aux --sort=-%mem | head -4 | tee -a "$LOG"
echo "--- Service status ---" | tee -a "$LOG"
if systemctl is-active --quiet ssh; then
    echo "ssh: running" | tee -a "$LOG"
else
    echo "ssh: NOT running" | tee -a "$LOG"
fi
echo "=== Done ===" | tee -a "$LOG"
