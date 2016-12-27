FROM resin/rpi-raspbian:jessie

# Install build dependencies 
RUN apt-get update && apt-get install -y --no-install-recommends \
    ca-certificates \
    curl \
    wget \
    git

ENV INFLUXDB_VERSION 1.1.1

# Download and untar, unzip influxdb
# TODO: add md5 check
RUN wget -q https://dl.influxdata.com/influxdb/releases/influxdb-${INFLUXDB_VERSION}_linux_armhf.tar.gz && \
        tar xvfz influxdb-${INFLUXDB_VERSION}_linux_armhf.tar.gz

# Copy untared files to system's folders
RUN cp -r /influxdb-${INFLUXDB_VERSION}-1/* /

# Add influxdb user
RUN useradd influxdb

# Set ownership and permissions
RUN chown influxdb:influxdb -R /etc/influxdb
RUN chown influxdb:influxdb -R /var/log/influxdb
RUN mkdir -p /var/lib/influxdb && \
    chown influxdb:influxdb -R /var/lib/influxdb
RUN cp /usr/lib/influxdb/scripts/init.sh /etc/init.d/influxdb && \
    chmod 755 /etc/init.d/influxdb
RUN cp /usr/lib/influxdb/scripts/influxdb.service /etc/systemd/system
