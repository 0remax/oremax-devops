#!/bin/bash

# 1. Define Variables
TIME=$(date +%Y-%m-%d_%H%M)
DEST="/home/chloe/backups"
SOURCE="/var/www/html"

# 2. Create destination folder if it does not exist

mkdir -p "$DEST"

# 3. Run Backup
echo "Starting backup of web files..."

# 4. Wrap Variables
tar -czf "$DEST/web_backup_$TIME.tar.gz" "$SOURCE"

echo "Backup completed successfully at $DEST"

# 5. Updated for Git Lab
