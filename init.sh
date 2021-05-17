#!/bin/ash
set -e

# Set permissions
user="$(id -u)"
if [ "$user" = '0' ]; then
	[ -d "/mosquitto" ] && chown -R mosquitto:mosquitto /mosquitto || true
fi

nohup /usr/sbin/mosquitto -c /mosquitto/config/mosquitto.conf &
cd /MQTTGEN
if [ -z "$1" ]
then
      python3 mqttgen.py cenarios/config.json
else
   case "$1" in
      1) python3 mqttgen.py cenarios/cenario1.json;;
      2) python3 mqttgen.py cenarios/cenario2.json;;
      3) python3 mqttgen.py cenarios/cenario3.json;;
      4) python3 mqttgen.py cenarios/cenario4.json;;
      5) python3 mqttgen.py cenarios/cenario5.json;;
      6) python3 mqttgen.py cenarios/cenario6.json;;
      7) python3 mqttgen.py cenarios/cenario7.json;;
      8) python3 mqttgen.py cenarios/cenario8.json;;
      9) python3 mqttgen.py cenarios/cenario9.json;;
      10) python3 mqttgen.py cenarios/cenario10.json;;
      *) echo "Opcao Invalida!";;
   esac
fi
