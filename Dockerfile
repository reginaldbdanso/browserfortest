# Start from KasmVNC Alpine base image
FROM ghcr.io/linuxserver/baseimage-kasmvnc:alpine317

# Install Chromium and required dependencies
RUN apk add --no-cache \
    chromium \
    chromium-chromedriver \
    ttf-freefont \
    dbus-glib \
    alsa-utils \
    pulseaudio \
    pulseaudio-alsa \
    libxcomposite \
    libxdamage \
    libxrandr \
    libxss \
    libxtst \
    xdg-utils

# Set environment variables
ENV CHROME_BIN=/usr/bin/chromium-browser
ENV DISPLAY=:0

# Expose VNC port
EXPOSE 6901

# Start Chromium automatically in KasmVNC session
CMD ["chromium-browser", "--no-sandbox", "--disable-gpu", "--use-fake-ui-for-media-stream", "--use-fake-device-for-media-stream", "--window-size=1280,720"]
