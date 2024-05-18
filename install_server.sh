#!/bin/bash

set -e

# Fungsi untuk Update dan Upgrade Sistem
update_system() {
    echo "Updating system..."
    apt update -y && apt upgrade -y
}

# Fungsi untuk Instalasi Paket-Paket Umum
install_general_packages() {
    echo "Installing general packages..."
    apt -y install screen sudo net-tools curl git gpg openssh-server
    sudo apt install -y apt-transport-https ca-certificates curl software-properties-common
}

# Fungsi untuk Konfigurasi SSH
configure_ssh_server() {
    echo "Configuring SSH..."
    sudo cp /etc/ssh/sshd_config /etc/ssh/sshd_config.backup
    sudo sh -c "echo 'PermitRootLogin Yes' >> /etc/ssh/sshd_config"
    sudo echo 'root:1' | chpasswd
    sudo systemctl restart ssh.service
    sudo systemctl restart sshd.service
}

# Fungsi untuk Instalasi Docker
install_docker_engine() {
    echo "Installing Docker..."
    apt install -y docker docker-compose
    sudo groupadd docker || true
    sudo usermod -aG docker $USER
    sudo systemctl enable docker
    sudo systemctl start docker
}

# Fungsi untuk Instalasi Portainer
install_portainer_service() {
    echo "Installing Portainer..."
    docker volume create portainer_data
    docker run -d -p 9000:9000 --name=portainer --restart=always \
      -v /var/run/docker.sock:/var/run/docker.sock \
      -v portainer_data:/data portainer/portainer-ce
}

# Fungsi untuk Instalasi ZeroTier
install_zerotier_service() {
    echo "Installing ZeroTier..."
    curl -s 'https://raw.githubusercontent.com/zerotier/ZeroTierOne/master/doc/contact%40zerotier.com.gpg' | gpg --import
    if z=$(curl -s 'https://install.zerotier.com/' | gpg); then
      echo "$z" | sudo bash
    fi
    zerotier-cli join 565799d8f6bdd3cdx
    zerotier-cli join 8bd5124fd6f987b8x
}

# Menampilkan Menu Pilihan
echo "Pilih opsi yang ingin dijalankan:"
echo "1) Update system"
echo "2) Install general packages"
echo "3) Configure SSH"
echo "4) Install Docker"
echo "5) Install Portainer"
echo "6) Install ZeroTier"
echo "7) Exit"

read -p "Masukkan pilihan Anda (1-7): " choice

case $choice in
    1)
        update_system
        ;;
    2)
        install_general_packages
        ;;
    3)
        configure_ssh_server
        ;;
    4)
        install_docker_engine
        ;;
    5)
        install_portainer_service
        ;;
    6)
        install_zerotier_service
        ;;
    7)
        echo "Exiting..."
        exit 0
        ;;
    *)
        echo "Pilihan tidak valid, harap masukkan angka 1-7."
        ;;
esac
