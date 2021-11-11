# Pull base image.
FROM jlesage/baseimage-gui:debian-10

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

RUN wget https://github.com/buckets/desktop-beta/releases/download/v0.63.2/BucketsBeta_0.63.2_amd64.deb
RUN dpkg -i BucketsBeta_0.63.2_amd64.deb

# Copy the start script.
COPY startapp.sh /startapp.sh

# Set the name of the application.
ENV APP_NAME="Buckets Beta"
ENV DISPLAY_WIDTH=1700
ENV DISPLAY_HEIGHT=1050
