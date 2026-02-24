#!/bin/bash

# Function to get CPU usage percentage
get_cpu_usage() {
    # top command gives real-time info, -bn1 gets one batch, no interaction
    # grep "Cpu(s)" finds the CPU line
    # awk '{print $2}' gets the second column (user usage)
    # cut -d'%' -f1 removes the '%' sign
    cpu_usage=$(top -bn1 | grep "Cpu(s)" | awk '{print $2}' | cut -d'%' -f1)
    echo "${cpu_usage}%"
}

# Function to get Memory usage percentage
get_mem_usage() {
    # free command displays memory info, -m shows output in MB
    # grep Mem finds the memory line
    # awk calculates the percentage of used memory
    mem_usage=$(free -m | grep Mem | awk '{printf("%.0f", $3/$2 * 100)}')
    echo "${mem_usage}%"
}

# Function to get Disk usage percentage for the root partition
get_disk_usage() {
    # df -h command shows disk free space in human-readable format
    # awk 'NR==2 {print $5}' gets the fifth column (usage %) from the second line (root fs)
    # sed 's/%//' removes the '%' sign
    disk_usage=$(df -h / | awk 'NR==2 {print $5}' | sed 's/%//')
    echo "${disk_usage}%"
}

# Main monitoring function to display metrics
monitor_system() {
    clear # Clears the screen for a real-time feel
    echo "-------------------------------------"
    echo "  Linux System Monitor"
    echo "-------------------------------------"
    echo "Uptime: $(uptime -p)"
    echo "CPU Usage:    $(get_cpu_usage)"
    echo "Memory Usage: $(get_mem_usage)"
    echo "Disk Usage (/): $(get_disk_usage)"
    echo "-------------------------------------"
}

# Continuous monitoring loop (press Ctrl+C to exit)
while true; do
    monitor_system
    echo "Refreshing in 3 seconds... (Press Ctrl+C to exit)"
    sleep 3 # Pauses for 3 seconds before refreshing
done
