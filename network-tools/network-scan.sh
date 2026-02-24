#!/bin/bash

echo "===== Network Health Check ====="

echo "1. Checking Internet Connectivity..."
ping -c 2 8.8.8.8 > /dev/null
if [ $? -eq 0 ]; then
    echo "Internet is reachable"
else
    echo "No internet connectivity"
fi

echo ""
echo "2. IP Address Information:"
hostname -I

echo ""
echo "3. Open Ports:"
ss -tuln

echo ""
echo "4. Active Connections:"
ss -tun

echo ""
echo "5. DNS Test:"
nslookup google.com | grep "Address"

echo ""
echo "6. Firewall Status:"
sudo iptables -L -v -n

echo "===== Check Complete ====="
