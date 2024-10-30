Server Performance Stats Script
This script provides a quick snapshot of the server’s performance statistics, including CPU usage, memory usage, disk usage, and the top processes by CPU and memory consumption. It also displays additional system information like OS version, uptime, load average, and logged-in users.

Prerequisites
This script is designed to work on both macOS and Linux systems, with specific adjustments for macOS compatibility.

Script Features
CPU Usage: Shows percentage usage for user, system, and idle states.
Memory Usage: Displays used and total memory, along with the percentage used.
Disk Usage: Reports used and total disk space on the main drive.
Top Processes:
By CPU usage
By memory usage
Additional Stats:
OS version
System uptime
Load average
List of currently logged-in users
How to Run the Script
Download the script (server-stats.sh) and place it in a directory of your choice.

Make the script executable by running the following command in your terminal:

bash
Copy code
chmod +x server-stats.sh
Run the script using:

bash
Copy code
./server-stats.sh
Example Output
Here’s an example of what the output may look like:

yaml
Copy code
Server Performance Stats

Total CPU Usage:
User: 3.13% System: 11.11% Idle: 85.75%

Total Memory Usage:
Used: 10.98 GB / Total: 11.32 GB (96.00%)

Total Disk Usage:
Used: 9.9Gi / Total: 460Gi (3%)

Top 5 Processes by CPU Usage:
  PID   PPID COMMAND          %MEM  %CPU
   373     1 /System/Library/   1.5  0.7
   ...

Top 5 Processes by Memory Usage:
  PID   PPID COMMAND          %MEM  %CPU
   ...

Additional Stats:
OS Version: macOS Sequoia 15.0.1
System Uptime: 49 mins
Load Average: 1.73 1.60 2.15
Logged in Users: ...
Failed SSH Login Attempts: Not available on macOS.
Troubleshooting
If you encounter permissions errors, ensure the script is executable with chmod +x server-stats.sh.
Some Linux-specific commands may not be available on macOS. This script includes workarounds to ensure compatibility on macOS, especially for M1 chips running macOS Sequoia or later.
Notes
macOS Compatibility: The script is optimized for macOS 11+ and has specific adjustments for the macOS M1 environment.
Linux-Only Features: Certain features, like failed SSH login attempts, are only available on Linux systems.
