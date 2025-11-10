A simple **Bash-based CLI tool** to monitor the **CPU package power (in Watts)** in real-time on Linux. Ideal for desktops or servers with Intel CPUs that support **RAPL** (e.g., i7-7700K).  

---

## Features

- Measures **CPU power in Watts** live using the `intel-rapl` interface
- Configurable measurement interval  
- Provides **accurate readings**, not estimate
- Additional displays **usage in Wh**, for easy calculations
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
