#!/bin/bash

echo "Server Performance Stats"

# Total CPU Usage
echo -e "\nTotal CPU Usage:"
if [[ "$OSTYPE" == "darwin"* ]]; then
    # macOS command for CPU usage
    top -l 1 | awk '/CPU usage/ {print "User:", $3, "System:", $5, "Idle:", $7}'
else
    # Linux command for CPU usage
    top -bn1 | grep "Cpu(s)" | sed "s/.*, *\([0-9.]*\)%* id.*/\1/" | awk '{print 100 - $1"%"}'
fi

# Total Memory Usage
echo -e "\nTotal Memory Usage:"
if [[ "$OSTYPE" == "darwin"* ]]; then
    # macOS command for memory usage on M1
    memory_data=$(vm_stat)
    page_size=$(vm_stat | grep "page size of" | awk '{print $8}' | sed 's/\.//')
    free_pages=$(echo "$memory_data" | grep "Pages free" | awk '{print $3}' | sed 's/\.//')
    active_pages=$(echo "$memory_data" | grep "Pages active" | awk '{print $3}' | sed 's/\.//')
    inactive_pages=$(echo "$memory_data" | grep "Pages inactive" | awk '{print $3}' | sed 's/\.//')
    speculative_pages=$(echo "$memory_data" | grep "Pages speculative" | awk '{print $3}' | sed 's/\.//')
    used=$(echo "scale=2; ($active_pages + $inactive_pages + $speculative_pages) * $page_size / 1024 / 1024 / 1024" | bc)
    free=$(echo "scale=2; $free_pages * $page_size / 1024 / 1024 / 1024" | bc)
    total=$(echo "scale=2; $used + $free" | bc)
    usage_percentage=$(echo "scale=2; ($used/$total)*100" | bc)
    printf "Used: %.2f GB / Total: %.2f GB (%.2f%%)\n" "$used" "$total" "$usage_percentage"
else
    # Linux command for memory usage
    free -h | awk '/Mem:/ {printf "Used: %s / Total: %s (%.2f%%)\n", $3, $2, $3/$2 * 100}'
fi

# Total Disk Usage
echo -e "\nTotal Disk Usage:"
if [[ "$OSTYPE" == "darwin"* ]]; then
    # macOS command for disk usage
    df -h / | awk 'NR==2 {printf "Used: %s / Total: %s (%s)\n", $3, $2, $5}'
else
    # Linux command for disk usage
    df -h --total | awk '/total/ {printf "Used: %s / Total: %s (%.2f%%)\n", $3, $2, $3/$2 * 100}'
fi

# Top 5 Processes by CPU Usage
echo -e "\nTop 5 Processes by CPU Usage:"
if [[ "$OSTYPE" == "darwin"* ]]; then
    ps -Ao pid,ppid,comm,%cpu,%mem | sort -k4 -nr | head -n 5
else
    ps -eo pid,ppid,cmd,%mem,%cpu --sort=-%cpu | head -n 6
fi

# Top 5 Processes by Memory Usage
echo -e "\nTop 5 Processes by Memory Usage:"
if [[ "$OSTYPE" == "darwin"* ]]; then
    ps -Ao pid,ppid,comm,%cpu,%mem | sort -k5 -nr | head -n 5
else
    ps -eo pid,ppid,cmd,%mem,%cpu --sort=-%mem | head -n 6
fi

# Optional Additional Stats
echo -e "\nAdditional Stats:"

# OS Version
echo -e "\nOS Version:"
sw_vers

# Uptime
echo -e "\nSystem Uptime:"
uptime

# Load Average
echo -e "\nLoad Average:"
sysctl -n vm.loadavg

# Logged in Users
echo -e "\nLogged in Users:"
who

# Failed Login Attempts (Linux only)
if [[ "$OSTYPE" == "darwin"* ]]; then
    echo -e "\nFailed SSH Login Attempts (Linux-only feature):"
    echo "Not available on macOS."
else
    echo -e "\nFailed SSH Login Attempts:"
    grep "Failed password" /var/log/auth.log | wc -l
fi
