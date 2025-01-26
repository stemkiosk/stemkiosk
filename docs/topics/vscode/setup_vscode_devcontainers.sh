#!/usr/bin/env sh
## # Setup vscode devcontainers with podman and flatpak vscode
## ## References:
## - https://github.com/flathub/com.visualstudio.code/issues/55#issuecomment-2561905012

## Run this on the host:

# rpm-ostree install podman-docker podman-compose

systemctl --user enable --now podman.socket

flatpak install flathub com.visualstudio.code com.visualstudio.code.tool.podman/x86_64/stable
flatpak --user override --filesystem=xdg-run/podman com.visualstudio.code
flatpak --user override --filesystem=/tmp com.visualstudio.code
flatpak run --command=bash com.visualstudio.code \
    code --install-extension --force ms-vscode-remote.vscode-remote-extensionpack

mkdir -p "${HOME}/.var/app/com.visualstudio.code/data/node_modules/bin"
ln -sf /app/bin/host-spawn "${HOME}/.var/app/com.visualstudio.code/data/node_modules/bin/podman"
ln -sf /app/bin/host-spawn "${HOME}/.var/app/com.visualstudio.code/data/node_modules/bin/docker"

