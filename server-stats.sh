#!/bin/bash

echo "Server Performance Stats"

# Total CPU Usage
echo -e "\nTotal CPU Usage:"
top -bn1 | grep "Cpu(s)" | \
sed "s/.*, *\([0-9.]*\)%* id.*/\1/" | \
awk '{print 100 - $1"%"}'

# Total Memory Usage
echo -e "\nTotal Memory Usage:"
free -h | awk '/Mem:/ {printf "Used: %s / Total: %s (%.2f%%)\n", $3, $2, $3/$2 * 100}'

# Total Disk Usage
echo -e "\nTotal Disk Usage:"
df -h --total | awk '/total/ {printf "Used: %s / Total: %s (%.2f%%)\n", $3, $2, $3/$2 * 100}'

# Top 5 Processes by CPU Usage
echo -e "\nTop 5 Processes by CPU Usage:"
ps -eo pid,ppid,cmd,%mem,%cpu --sort=-%cpu | head -n 6

# Top 5 Processes by Memory Usage
echo -e "\nTop 5 Processes by Memory Usage:"
ps -eo pid,ppid,cmd,%mem,%cpu --sort=-%mem | head -n 6

# Optional: Additional Stats
echo -e "\nAdditional Stats:"
# OS Version
echo "OS Version:"
cat /etc/os-release | grep PRETTY_NAME

# Uptime
echo -e "\nSystem Uptime:"
uptime -p

# Load Average
echo -e "\nLoad Average:"
cat /proc/loadavg

# Logged in Users
echo -e "\nLogged in Users:"
who

# Failed Login Attempts (requires root privileges)
echo -e "\nFailed SSH Login Attempts:"
grep "Failed password" /var/log/auth.log | wc -l