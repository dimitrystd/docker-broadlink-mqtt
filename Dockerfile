FROM python:2

RUN pip install paho-mqtt broadlink==0.6

WORKDIR /app
RUN wget -O broadlink-mqtt.tar.gz https://github.com/eschava/broadlink-mqtt/archive/993c3db49b07612dc9cfaf34b566ff3bd248de2f.tar.gz \
  && tar -zxvf broadlink-mqtt.tar.gz \
  && mv broadlink-mqtt-993c3db49b07612dc9cfaf34b566ff3bd248de2f/* ./ \
  && rm -rf broadlink-mqtt.tar.gz broadlink-mqtt-993c3db49b07612dc9cfaf34b566ff3bd248de2f

ENV MQTT_SERVER=localhost
ENV MQTT_PORT=1883
ENV MQTT_USER=mqtt_user
ENV MQTT_PASS=password
ENV MQTT_TOPIC_PREFIX=broadlink/
ENV DEVICE_HOST=192.168.1.50
ENV DEVICE_MAC=01:23:45:67:ab:00

COPY mqtt.conf.template /app
COPY commands/ /app/commands/
COPY start.sh /app

RUN chmod +x start.sh

CMD ["./start.sh"]
