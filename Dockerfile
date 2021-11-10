# Pull base image.
FROM jlesage/baseimage-gui:debian-10


# Install xterm.
RUN apt update
RUN apt install -y \
    wget \
    libnss3 \
    libgtk-3-0 \
    libnotify4 \
    libxss1 \
    xdg-utils \
    libatspi2.0-0 \
    libappindicator3-1 \
    libsecret-1-0 \
    libasound2

RUN mkdir /opt/buckets
RUN wget --no-check-certificate https://github.com/buckets/desktop-beta/releases/download/v0.63.1/BucketsBeta-0.63.1.tar.gz

RUN tar -xzf BucketsBeta-0.63.1.tar.gz -C /opt/buckets
RUN chmod -R 777 /opt/buckets
RUN ls /opt/buckets
RUN chmod a+x /opt/buckets/BucketsBeta-0.63.1/bucketsbeta
RUN ln -sf /opt/buckets/BucketsBeta-0.63.1/bucketsbeta /usr/bin/buckets

# Copy the start script.
COPY startapp.sh /startapp.sh

# Set the name of the application.
ENV APP_NAME="Buckets Beta"
