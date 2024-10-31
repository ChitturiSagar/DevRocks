# 📊 Server Performance Stats Script

This script provides a quick snapshot of the server’s performance, including **CPU usage**, **memory usage**, **disk usage**, and **top processes** by CPU and memory consumption. Additional information includes **OS version**, **uptime**, **load average**, and **logged-in users**.

## 🚀 Prerequisites
This script is compatible with both **macOS** and **Linux**. Specific adjustments have been made to ensure smooth functionality on macOS, particularly for M1/M2 chip users.

## ⚙️ Features
- **CPU Usage**: Reports usage for user, system, and idle states.
- **Memory Usage**: Displays used and total memory, and percentage utilization.
- **Disk Usage**: Shows used and total disk space.
- **Top Processes**:
  - By CPU usage
  - By memory usage
- **Additional Stats**:
  - OS version
  - System uptime
  - Load average
  - Logged-in users

---

## 📝 How to Run

1. **Download** `server-stats.sh` and place it in a directory of your choice.

2. **Make the script executable** by running:
   ```bash
   chmod +x server-stats.sh

<details> <summary>Click to expand</summary>
```plaintext
Server Performance Stats

Total CPU Usage:
User: 3.13% System: 11.11% Idle: 85.75%

Total Memory Usage:
Used: 10.98 GB / Total: 11.32 GB (96.00%)

Total Disk Usage:
Used: 9.9Gi / Total: 460Gi (3%)

Top 5 Processes by CPU Usage:
PID    PPID   COMMAND          %MEM   %CPU
373     1     /System/Library/   1.5   0.7
...

Additional Stats:
OS Version: macOS Sequoia 15.0.1
System Uptime: 49 mins
Load Average: 1.73 1.60 2.15


</details>