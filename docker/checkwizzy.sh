#!/bin/bash
cd /work
if [ ! -f "wizzydone" ]; then
   apt install -y npm nodejs git
   npm install -g wizzy
   git clone https://github.com/richliu/bmcmonitor.git
   cd bmcmonitor/wizzy
   wizzy export datasources
   wizzy export dashboards
   npm uninstall -g wizzy
   apt remove -y npm nodejs git
   apt autoremove -y
   apt autoclean
   apt clean
   cd /work
   rm -rf bmcmonitor
   touch wizzydone

fi

