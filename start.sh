#!/bin/bash
sudo -u playground /usr/games/steamcmd +force_install_dir '/home/playground/Steam/steamapps/common/PalServer' +login anonymous +app_update 2394010 +quit
sudo -u playground /home/playground/Steam/steamapps/common/PalServer/PalServer.sh -port 8211 -useperfthreads -NoAsyncLoadingThread -UseMultithreadForDS
