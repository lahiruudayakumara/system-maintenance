#!/bin/bash

source ./config/disk_usage.conf

mkdir -p ./logs

timestamp=$(date +"%Y%m%d_%H%M%S")

# Get disk usage percentage
usage=$(df -h "$MONITOR_DIR" | grep -v Filesystem | awk '{print $5}' | tr -d '%')

# Check if usage exceeds threshold
if [ "$usage" -gt "$THRESHOLD" ]; then
    message="[$timestamp] WARNING: Disk usage is at ${usage}% (exceeds threshold of ${THRESHOLD}%)"
else
    message="[$timestamp] INFO: Disk usage is at ${usage}%"
fi

echo "$message" >> "$LOG_FILE"
