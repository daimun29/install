#!/bin/bash

# Update dan upgrade sistem
sudo apt update && sudo apt upgrade -y

# Instal Node.js dan npm (versi terbaru)
curl -fsSL https://deb.nodesource.com/setup_current.x | sudo -E bash -
sudo apt install -y nodejs

# Instal Python3 dan pip (versi terbaru)
sudo apt install -y python3 python3-pip
python3 -m pip install --upgrade pip

# Instal Git (versi terbaru)
sudo add-apt-repository ppa:git-core/ppa -y
sudo apt update
sudo apt install -y git

# Instal Tmux (versi terbaru)
sudo apt install -y libevent-dev ncurses-dev build-essential bison pkg-config
TMUX_VERSION=$(curl -s https://api.github.com/repos/tmux/tmux/releases/latest | grep -oP '"tag_name": "\K(.*)(?=")')
wget https://github.com/tmux/tmux/releases/download/${TMUX_VERSION}/tmux-${TMUX_VERSION}.tar.gz
tar -xvzf tmux-${TMUX_VERSION}.tar.gz
cd tmux-${TMUX_VERSION}
./configure && make
sudo make install
cd ..
rm -rf tmux-${TMUX_VERSION} tmux-${TMUX_VERSION}.tar.gz

# Buka port 8080
sudo ufw allow 8080/tcp
sudo ufw reload

# Verifikasi instalasi
echo "=== Versi Terinstal ==="
node -v
npm -v
python3 --version
pip3 --version
git --version
tmux -V

echo "Instalasi selesai! Port 8080 telah dibuka."
