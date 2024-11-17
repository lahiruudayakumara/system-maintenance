#!/bin/bash

source ./config/backup.conf

timestamp=$(date +"%Y%m%d_%H%M%S")

# Create backup
echo "Starting backup from $SOURCE_DIR to $BACKUP_DIR"
mkdir -p "$BACKUP_DIR"
tar -czf "$BACKUP_DIR/backup_$timestamp.tar.gz" "$SOURCE_DIR"

mkdir -p ./logs
echo "[$timestamp] Backup completed: backup_$timestamp.tar.gz" >> ./logs/backup.log
