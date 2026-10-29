
#!/bin/bash

THRESHOLD=80

# Get disk usage percentage for the root filesystem
USAGE=$(df -P / | awk 'NR==2 {gsub(/%/, "", $5); print $5}')

echo "===== Server Health Check ====="
echo "Hostname: $(hostname)"
echo "Disk usage: ${USAGE}%"
echo "Warning threshold: ${THRESHOLD}%"

if [ "$USAGE" -ge "$THRESHOLD" ]; then
    echo "WARNING: Disk usage is high!"
else
    echo "OK: Disk usage is within the limit."
fi
