FROM node:22-slim

RUN apt-get update && apt-get install -y \
    curl \
    git \
    wget \
    && wget https://github.com/tsl0922/ttyd/releases/download/1.7.7/ttyd.x86_64 -O /usr/local/bin/ttyd \
    && chmod +x /usr/local/bin/ttyd \
    && npm install -g @anthropic-ai/claude-code \
    && apt-get clean

EXPOSE 8080

CMD ["ttyd", "--port", "8080", "--writable", "/bin/bash"]
