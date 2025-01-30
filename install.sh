#!/bin/bash

# Pastikan skrip berjalan dengan hak akses root
if [ "$EUID" -ne 0 ]; then
    echo "Silakan jalankan skrip ini dengan sudo atau sebagai root!"
    exit 1
fi

echo "🚀 Memulai instalasi paket..."

# Update dan upgrade sistem
apt update && apt upgrade -y

# Instal Node.js dan npm (versi terbaru)
curl -fsSL https://deb.nodesource.com/setup_current.x | bash -
apt install -y nodejs

# Instal Python3 dan pip (versi terbaru)
apt install -y python3 python3-pip
python3 -m pip install --upgrade pip

# Instal Git (versi terbaru)
add-apt-repository ppa:git-core/ppa -y
apt update
apt install -y git

# Instal Tmux (versi terbaru)
apt install -y libevent-dev ncurses-dev build-essential bison pkg-config
TMUX_VERSION=$(curl -s https://api.github.com/repos/tmux/tmux/releases/latest | grep -oP '"tag_name": "\K(.*)(?=")')
wget https://github.com/tmux/tmux/releases/download/${TMUX_VERSION}/tmux-${TMUX_VERSION}.tar.gz
tar -xvzf tmux-${TMUX_VERSION}.tar.gz
cd tmux-${TMUX_VERSION}
./configure && make
make install
cd ..
rm -rf tmux-${TMUX_VERSION} tmux-${TMUX_VERSION}.tar.gz

# Instal Dependensi Docker
apt install -y ca-certificates curl gnupg

# Tambahkan Repository Docker Resmi
install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | tee /etc/apt/keyrings/docker.asc > /dev/null
chmod a+r /etc/apt/keyrings/docker.asc
echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | tee /etc/apt/sources.list.d/docker.list > /dev/null

# Instal Docker Engine & CLI
apt update
apt install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

# Tambahkan user ke grup Docker (agar bisa menjalankan Docker tanpa sudo)
usermod -aG docker $SUDO_USER

# Instal Docker Compose (Versi Terbaru)
curl -L "https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose

# Buka port 8080
ufw allow 8080/tcp
ufw reload

# Verifikasi Instalasi
echo "=== Versi Terinstal ==="
node -v
npm -v
python3 --version
pip3 --version
git --version
tmux -V
docker --version
docker-compose --version

echo "🎉 Instalasi selesai! Docker & Docker Compose telah berhasil diinstal."
echo "⚠️ Silakan logout dan login kembali agar perubahan pada grup Docker berlaku."
