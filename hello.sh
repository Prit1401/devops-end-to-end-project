
#!/bin/bash

# Store information in variables
CURRENT_USER=$(whoami)
SERVER_NAME=$(hostname)
CURRENT_DIR=$(pwd)

# Display the information
echo "===== Server Information ====="
echo "Current user: $CURRENT_USER"
echo "Server name: $SERVER_NAME"
echo "Working directory: $CURRENT_DIR"

echo "===== Disk Usage ====="
df -h /

