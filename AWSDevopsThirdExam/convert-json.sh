#!/bin/bash

LOG_FILE="/var/log/secure"
JSON_FILE="log-ssh.json"

# Retrieve SSH log entries
LOG_ENTRIES=$(grep sshd "$LOG_FILE")

# Convert log entries to JSON format
echo "[" > "$JSON_FILE"
while IFS= read -r line; do
    timestamp=$(echo "$line" | awk '{print $1, $2, $3}')
    message=$(echo "$line" | awk '{$1=$2=$3=""; print $0}' | sed 's/^[[:space:]]*//')
    entry="{ \"timestamp\": \"$timestamp\", \"message\": \"$message\" }"

    if [[ $line != $(tail -n 1 <<< "$LOG_ENTRIES") ]]; then
        entry+=","
    fi

    echo "$entry" >> "$JSON_FILE"
done <<< "$LOG_ENTRIES"
echo "]" >> "$JSON_FILE"

