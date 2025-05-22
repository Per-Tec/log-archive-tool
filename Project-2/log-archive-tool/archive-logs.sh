#!/bin/bash

# === CONFIG ===
LOG_DIR="$1"
ARCHIVE_DIR="./archives"
LOG_FILE="./logs/archive.log"

# === VALIDATION ===
if [[ -z "$LOG_DIR" ]]; then
  echo "Usage: $0 <log-directory>"
  exit 1
fi

if [[ ! -d "$LOG_DIR" ]]; then
  echo "Error: Directory '$LOG_DIR' does not exist."
  exit 2
fi

# === TIMESTAMP ===
NOW=$(date +"%Y%m%d_%H%M%S")
ARCHIVE_NAME="logs_archive_${NOW}.tar.gz"

# === ARCHIVING ===
tar -czf "${ARCHIVE_DIR}/${ARCHIVE_NAME}" -C "$LOG_DIR" .

# === LOGGING ===
echo "[$(date +"%Y-%m-%d %H:%M:%S")] Archived $LOG_DIR as $ARCHIVE_NAME" >> "$LOG_FILE"

# === SUCCESS ===
echo "✅ Logs archived to: ${ARCHIVE_DIR}/${ARCHIVE_NAME}"

