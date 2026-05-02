FROM node:22-slim

RUN apt-get update && apt-get install -y \
    ttyd \
    curl \
    git \
    && npm install -g @anthropic-ai/claude-code \
    && apt-get clean

EXPOSE 8080

CMD ["ttyd", "--port", "8080", "--writable", "/bin/bash"]
