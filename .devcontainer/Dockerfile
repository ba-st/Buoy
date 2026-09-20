FROM mcr.microsoft.com/devcontainers/javascript-node:24-trixie

# Install dependencies
RUN apt-get update \
  && apt-get install --yes --no-install-recommends \
    shellcheck \
    yamllint \
  && rm --recursive --force /var/lib/apt/lists/*

# Create the shell history mount point up front so the named volume inherits
# node ownership instead of being created as root.
RUN mkdir --parents /commandhistory \
  && chown node:node /commandhistory

USER node
WORKDIR /home/node

# Install markdownlint-cli for linting docs
RUN npm install --global markdownlint-cli@0.49.1

# Install Claude stable (lands in /home/node/.local/bin, already on PATH)
RUN curl --fail --silent --show-error \
  --location https://claude.ai/install.sh --output /tmp/install-claude.sh \
  && bash /tmp/install-claude.sh stable \
  && rm /tmp/install-claude.sh
