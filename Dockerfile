FROM kasmweb/chromium:1.15.0-rolling

# Optional: install extra tools you need
RUN apt-get update && apt-get install -y \
    fluxbox \
    pulseaudio \
    --no-install-recommends && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

# CMD is already configured by kasmweb images to launch Chromium and VNC
