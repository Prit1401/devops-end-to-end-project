
#!/bin/bash

THRESHOLD=80

# Get disk usage percentage for the root filesystem
USAGE=$(df -P / | awk 'NR==2 {gsub(/%/, "", $5); print $5}')

echo "===== Server Health Check ====="
echo "Hostname: $(hostname)"
echo "Warning threshold: ${THRESHOLD}%"

# Stop if disk usage could not be retrieved
if ! [[ "$USAGE" =~ ^[0-9]+$ ]]; then
    echo "ERROR: Could not retrieve disk usage."
    exit 1
fi

echo "Disk usage: ${USAGE}%"

if [ "$USAGE" -ge "$THRESHOLD" ]; then
    echo "WARNING: Disk usage is high!"
else
    echo "OK: Disk usage is within the limit."
fi

exit 0
