  ____ ____  _   _  __        __    _   _                   
 / ___|  _ \| | | | \ \      / /_ _| |_| |_ __ _  __ _  ___ 
| |   | |_) | | | |  \ \ /\ / / _` | __| __/ _` |/ _` |/ _ \
| |___|  __/| |_| |   \ V  V / (_| | |_| || (_| | (_| |  __/
 \____|_|    \___/     \_/\_/ \__,_|\__|\__\__,_|\__, |\___|
                                                 |___/      

A simple **Bash-based CLI tool** to monitor the **CPU package power (in Watts)** in real-time on Linux. Ideal for desktops or servers with Intel CPUs that support **RAPL** (e.g., i7-7700K).  

---

## Features

- Displays a large **ASCII-Art banner** on startup: `CPU Wattage`  
- Measures **CPU power in Watts** live using the `intel-rapl` interface  
- Configurable measurement interval  
- Provides **accurate readings**, not estimates  
- Runs entirely in the terminal, **no GUI required**  

---

## Dependencies

- Linux system with **Intel CPU & RAPL support**  
- `bash` (standard)  
- `sudo` for reading `/sys/class/powercap/intel-rapl:0/energy_uj`  
- `bc` for floating-point calculations  

Install `bc` on Ubuntu if not present:

```bash
sudo apt update
sudo apt install bc
