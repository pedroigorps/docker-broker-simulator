#!/bin/sh

source /docker-entrypoint.sh
nohup /usr/sbin/mosquitto -c /mosquitto/config/mosquitto.conf &
cd /MQTTGEN
if [ -z "$1" ]
then
      python3 mqttgen.py config.json
else
      python3 mqttgen.py $1
fi
