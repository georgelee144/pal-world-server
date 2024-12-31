#!/bin/bash

if ! pgrep -f "PalServer.sh" > /dev/null; then
    # /home/george/pal-world-server/discord.sh "OOPSIE WOOPSIE!! Uwu we made a fucky wucky!! A wittle fucko boingo! We are working VEWY HAWD to fix this!"
    /home/george/pal-world-server/stop.sh
    /home/george/pal-world-server/back_up_pal_world.sh
    /home/george/pal-world-server/start.sh
    # /home/george/pal-world-server/discord.sh "Server has been restarted!"
fi
