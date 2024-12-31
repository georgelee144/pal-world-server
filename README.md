# Server Setup/Backup

Install using https://pimylifeup.com/ubuntu-palworld-dedicated-server/
Open 8211 port in router settings

Add to the bottom of sudo visudo

`orchard ALL=(steam) NOPASSWD: /home/steam/Steam/steamapps/common/PalServer/PalServer.sh`

`orchard ALL=(steam) NOPASSWD: /usr/bin/pkill -u steam`

Add to crontab based off file.


To make DeathPenalty=None make sure you chmod 444 the PalWorldSettings.ini file


Create /etc/systemd/sleep.conf.d/nosuspend.conf as
```
[Sleep]
AllowSuspend=no
AllowHibernation=no
AllowSuspendThenHibernate=no
AllowHybridSleep=no
```
