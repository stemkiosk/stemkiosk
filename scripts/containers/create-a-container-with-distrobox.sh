## Create a container with distrobox
# https://github.com/89luca89/distrobox

distrobox create -i debian:latest -n debian1 --hostname debian1 --additional-packages="python3-pip pipx"
distrobox enter debian1 -- sudo apt install -y python3-pip pipx

distrobox create -i fedora:latest -n fedora1 --hostname fedora1 --additional-packages="python3-pip pipx"
distrobox enter fedora1 -- sudo dnf install -y python3-pip pipx

distrobox enter fedora1
distrobox enter debian1