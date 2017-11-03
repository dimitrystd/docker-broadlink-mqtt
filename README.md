# Overview
Docker container for https://github.com/eschava/broadlink-mqtt

# Build
```
$ docker build --pull --rm --tag=broadlink-mqtt .
```

# Usage
Container can be configured via env variables, see [Dockerfile](Dockerfile). Example: 
```
$ docker run -it --rm -e MQTT_SERVER=192.168.1.1 -e DEVICE_HOST=192.168.1.60 -e DEVICE_MAC=34:AA:FF:CC:D5:68 broadlink-mqtt
[2017-10-30 03:27:27,320] DEBUG Connected to RM2 Broadlink device at ('192.168.1.60', 80)
[2017-10-30 03:27:27,332] DEBUG Connected to MQTT broker, subscribing to topic broadlink/#
```
Send value `replay` into topic `broadlink/tv/samsung/power`, in console you should see
```
[2017-10-30 03:27:42,943] DEBUG Received MQTT message broadlink/tv/samsung/power replay
[2017-10-30 03:27:42,943] DEBUG Replaying command from file /app/commands/tv/samsung/power
```

Example for docker-compose
```
  broadlink-mqtt:
    image: broadlink-mqtt
    environment:
      - MQTT_SERVER=mosquitto
      - MQTT_TOPIC_PREFIX=broadlink/rm-mini3/
      - DEVICE_HOST=192.168.1.60
      - DEVICE_MAC=34:AA:FF:CC:D5:68
    depends_on:
      - mosquitto
```
