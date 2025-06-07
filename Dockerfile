# Use the KasmVNC Alpine base image
FROM ghcr.io/linuxserver/baseimage-kasmvnc:alpine317

# Install Chromium and any needed fonts
RUN apk add --no-cache \
    chromium \
    chromium-chromedriver \
    ttf-freefont

# Environment variables to tune Chromium
ENV CHROME_BIN=/usr/bin/chromium-browser

# Expose KasmVNC port (default is 6901)
EXPOSE 6901

# Start Chromium inside the KasmVNC session
CMD ["chromium-browser", "--no-sandbox", "--disable-gpu", "--use-fake-ui-for-media-stream", "--use-fake-device-for-media-stream", "--window-size=1280,720"]
