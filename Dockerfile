FROM resin/rpi-raspbian:jessie

# Install build dependencies 
RUN apt-get update && apt-get install -y --no-install-recommends \
    ca-certificates \
    curl \
    wget \
    git

ENV INFLUXDB_VERSION 1.1.1

wget -q https://dl.influxdata.com/influxdb/releases/influxdb-${INFLUXDB_VERSION}_linux_armhf.tar.gz


