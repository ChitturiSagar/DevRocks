# 🖥️ Server Performance Monitor

![License](https://img.shields.io/badge/license-MIT-blue.svg)
![Bash](https://img.shields.io/badge/bash-%23121011.svg?style=flat&logo=gnu-bash&logoColor=white)
![Platform](https://img.shields.io/badge/platform-Linux%20%7C%20macOS-lightgrey)

A powerful, lightweight server monitoring script that provides real-time insights into system performance metrics. Compatible with both Linux and macOS systems, including Apple Silicon (M1/M2) processors.

## 🌟 Features

### Core Metrics
- **CPU Usage** 📊
  - User processes
  - System processes
  - Idle percentage
  
- **Memory Statistics** 💾
  - Total available memory
  - Used memory
  - Usage percentage
  
- **Disk Usage** 💽
  - Space utilization
  - Available storage
  - Usage percentage

- **Process Monitoring** 📈
  - Top CPU-consuming processes
  - Memory usage per process
  - Process hierarchy (PID/PPID)

### Additional Information
- System uptime
- Load averages
- OS version details
- Active user sessions

## 🚀 Getting Started

### Prerequisites
- Bash shell (version 4.0+)
- Basic system utilities (`top`, `ps`, `awk`, `grep`, `df`)

### Installation

1. Clone the repository:
```bash
git clone https://github.com/ChitturiSagar/server-stats.git
cd server-stats
```

2. Make the script executable:
```bash
chmod +x server-stats.sh
```

### Usage

#### Basic Execution
```bash
./server-stats.sh
```

#### Advanced Options
```bash
./server-stats.sh -i 10 -n 8 -l stats.log
```

#### Available Arguments
| Option | Description | Default |
|--------|-------------|---------|
| `-i, --interval` | Refresh interval in seconds | 5 |
| `-n, --number` | Number of top processes to show | 5 |
| `-l, --log` | Log file path | None |
| `--no-color` | Disable colored output | False |
| `-h, --help` | Show help message | - |

## 📊 Sample Output

```plaintext
=== Server Performance Stats ===

CPU Usage:
User: 3.13% System: 11.11% Idle: 85.75%

Memory Usage:
Used: 10.98 GB / Total: 11.32 GB (96.00%)

Disk Usage:
Used: 9.9Gi / Total: 460Gi (3%)

Top 5 Processes by CPU Usage:
PID    PPID   COMMAND          %MEM   %CPU
373     1     /System/Library/   1.5   0.7
...

Additional Stats:
OS Version: macOS Sonoma 14.0
System Uptime: 49 mins
Load Average: 1.73 1.60 2.15
```

## 🛠️ Configuration

The script can be customized through command-line arguments or by modifying the default values in the script:

```bash
# Default configuration
REFRESH_INTERVAL=5
TOP_PROCESS_COUNT=5
ENABLE_COLOR=true
LOG_FILE=""
```

## 📝 Logging

Enable logging to keep track of historical data:

```bash
./server-stats.sh -l /path/to/server-stats.log
```

Log files contain timestamp-prefixed entries for all metrics, perfect for long-term analysis.

## 🔧 Troubleshooting

### Common Issues

1. **Permission Denied**
   ```bash
   chmod +x server-stats.sh
   ```

2. **Missing Dependencies**
   - The script will automatically check for required utilities
   - Install any missing dependencies using your system's package manager

3. **OS Compatibility**
   - For macOS-specific issues, ensure you're using the latest version of the OS
   - For Linux, ensure basic system utilities are installed

## 🤝 Contributing

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## 📃 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

#

---
Made with ❤️ by Sagar| [roadmap.sh/projects/server-stats](https://roadmap.sh/projects/server-stats)
