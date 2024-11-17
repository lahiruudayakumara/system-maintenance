#!/bin/bash

# Create reports directory if it doesn't exist
mkdir -p ./reports

# Get current timestamp
timestamp=$(date +"%Y%m%d_%H%M%S")
report_file="./reports/daily_report_${timestamp}.txt"

echo "Generating daily system report..." | tee "$report_file"

# System date and time
echo -e "\n=== System Date and Time ===" >> "$report_file"
date >> "$report_file"

# Disk usage information
echo -e "\n=== Disk Usage Information ===" >> "$report_file"
df -h >> "$report_file"

# Last backup status
echo -e "\n=== Latest Backup Status ===" >> "$report_file"
if [ -f "./logs/backup.log" ]; then
    tail -n 1 "./logs/backup.log" >> "$report_file"
else
    echo "No backup logs found" >> "$report_file"
fi

# Latest disk usage status
echo -e "\n=== Latest Disk Usage Status ===" >> "$report_file"
if [ -f "./logs/disk_usage.log" ]; then
    tail -n 1 "./logs/disk_usage.log" >> "$report_file"
else
    echo "No disk usage logs found" >> "$report_file"
fi

echo "Report generated: $report_file"
