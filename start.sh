#!/bin/bash
steamcmd +login anonymous +app_update 2394010 validate +quit
sudo -u steam /home/steam/Steam/steamapps/common/PalServer/PalServer.sh -port 8211 -useperfthreads -NoAsyncLoadingThread -UseMultithreadForDS
