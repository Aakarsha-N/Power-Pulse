# Power-Pulse
Your battery was lying to you. Not anymore. ⚡Continuous monitoring. Smart alerts. Zero mercy for unexpected drops. 


PowerPulse is a lightweight PowerShell-based battery-monitoring tool that tracks battery performance, detects charging/discharging behavior, and logs system power activity over time. It can run silently in the background using Windows Task Scheduler.  


## 📌 Features

- 📊 Monitors battery charge percentage over time
- 🔌 Detects charging, discharging, and stable states
- ⚠️ Alerts for fast charging or fast battery drain
- 📝 Logs all activity to a local file
- 🕒 Runs automatically at system login (background mode)
- 🔐 Requires admin privileges for scheduled execution


## 🧠 How It Works

PowerPulse samples battery data every 10 minutes and compares changes in charge percentage.

It calculates:

- Battery change over time
- Charging/discharging rate (% per minute)
- System battery state (charging, draining, stable)

If abnormal behavior is detected (fast drain or fast charge), it records alerts in the log file.

---

## 📁 Project Structure
Power-Pulse/
│
├── Power-pulse.ps1            # Main monitoring script
├── PowerPulseStart.ps1        # Installs scheduled task (run as admin)
├── PowerPulseStop.ps1         # Removes scheduled task (run as admin)
└── PPlog.txt # Log file          (auto-generated every 10 min )

**Technical Summary**
Uses Get-CimInstance Win32_Battery
Runs continuous monitoring loop (while ($true))
Uses Windows Task Scheduler for persistence
Executes PowerShell in hidden mode
Computes battery rate using time difference logic

⚠️ Notes
Designed for laptop systems (battery-dependent devices)
Desktop systems may log "No battery detected."
Runs indefinitely until manually stopped
Requires admin privileges for scheduling tasks
