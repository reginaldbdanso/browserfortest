FROM ghcr.io/linuxserver/baseimage-kasmvnc:debian-bookworm

# Install Chromium and dependencies
RUN apt-get update && apt-get install -y \
    chromium \
    chromium-driver \
    fonts-freefont-ttf \
    pulseaudio \
    libxcomposite1 \
    libxdamage1 \
    libxrandr2 \
    libxss1 \
    libxtst6 \
    xdg-utils \
    --no-install-recommends && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

# Environment variables
ENV CHROME_BIN=/usr/bin/chromium
ENV DISPLAY=:0

# Expose VNC port
EXPOSE 6901

# Auto start Chromium in KasmVNC
CMD ["chromium", "--no-sandbox", "--disable-gpu", "--use-fake-ui-for-media-stream", "--use-fake-device-for-media-stream", "--window-size=1280,720"]
