#!/bin/bash

#store information in variables 
CURRENT_USER=$(whoami)
SERVER_NAME=$(hostname)
CURRENT_DIR=$(pwd)

#Display the information
echo "======== Server information ======="
echo "Current user is : $CURRENT_USER "
echo "Server name : $SERVER_NAME "
echo "Current Directory : $CURRENT_DIR "

echo "====== Disk usage ======"
df -h
