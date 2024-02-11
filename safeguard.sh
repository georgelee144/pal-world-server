#!/bin/bash

# Check if Palworld is running for user "steam"
if pgrep -u steam -x PalServer > /dev/null
then
    echo "Palworld is running as of $(date +%T)."
else
    echo "Palworld is stopped as of $(date +%T). Restarting server!"
    /home/orchard/Documents/pal-world-server/stop.sh
    /home/orchard/Documents/pal-world-server/back_up_pal_world.sh
    /home/orchard/Documents/pal-world-server/start.sh
    echo "Server restarted as of $(date +%T)."
fi
