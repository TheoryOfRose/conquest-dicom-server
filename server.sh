#!/bin/bash

echo "start apache2 web server"
service apache2 restart

echo "start conquest dicom server"
cd /conquestdicomserver/
envsubst < conquest.service > t.t
#service conquest stop
#service reload
#service conquest.service start
#service conquest.service enable
#service conquest.service status
systemctl stop conquest.service
systemctl daemon-reload
systemctl start conquest.service
systemctl enable conquest.service
systemctl status conquest.service
rm t.t

./webviewer.sh

