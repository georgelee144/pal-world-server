#!/bin/bash
sudo -u steam /usr/games/steamcmd +force_install_dir '/home/steam/Steam/steamapps/common/PalServer' +login anonymous +app_update 2394010 +quit
sudo -u steam /home/steam/Steam/steamapps/common/PalServer/PalServer.sh -port 8211 -useperfthreads -NoAsyncLoadingThread -UseMultithreadForDS
