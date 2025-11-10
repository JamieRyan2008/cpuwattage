#!/bin/bash
# CPU Wattage - Live CPU Wattage CLI Tool

INTERVAL=2
RAPL_PATH="/sys/class/powercap/intel-rapl:0/energy_uj"

# ASCII-Art
cat << "EOF"
  ____ ____  _   _  __        __    _   _                   
 / ___|  _ \| | | | \ \      / /_ _| |_| |_ __ _  __ _  ___ 
| |   | |_) | | | |  \ \ /\ / / _` | __| __/ _` |/ _` |/ _ \
| |___|  __/| |_| |   \ V  V / (_| | |_| || (_| | (_| |  __/
 \____|_|    \___/     \_/\_/ \__,_|\__|\__\__,_|\__, |\___|
                                                 |___/      
EOF

if [ ! -r "$RAPL_PATH" ]; then
    echo "ERROR: Cannot read $RAPL_PATH. Make sure you have root permissions."
    exit 1
fi

# Messschleife mit INTERVAL innerhalb der sudo-shell
sudo bash -c "INTERVAL=$INTERVAL; LC_NUMERIC=C
ENERGY_START=\$(cat $RAPL_PATH)

while true; do
  a=\$(cat $RAPL_PATH)
  sleep \$INTERVAL
  b=\$(cat $RAPL_PATH)
  
  # Aktuelle Leistung in Watt
  watts=\$(echo \"scale=2; (\$b - \$a)/\$((INTERVAL*1000000))\" | bc)

  # Kumulierte Energie in Wh
  total_joule=\$(echo \"scale=6; (\$b - \$ENERGY_START)/1000000\" | bc)
  wh_estimated=\$(echo \"scale=6; \$total_joule/3600\" | bc)

  # Live-Update in einer Zeile
  echo -ne \"\r\$(date +'%H:%M:%S') | \$watts W | Total: \$wh_estimated Wh\"
done"
