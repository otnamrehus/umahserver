#!/bin/bash

echo "Pilihan opsi:"
echo "1. Install WPS Office 2019"
echo "2. Install Chromium"
echo "3. Instalasi Wine"
echo "4. Install Docker, Docker Compose, dan Portainer"
echo "5. Install Semua (WPS Office, Chromium, Wine, Docker, Docker Compose, dan Portainer)"
echo "6. Keluar"

read -p "Masukkan pilihan [1-6]: " choice

case $choice in
    1)
        echo "Memulai instalasi WPS Office 2019..."
        sudo apt update && \
        sudo apt install wget curl git && \
        sudo wget https://wdl1.pcfg.cache.wpscdn.com/wpsdl/wpsoffice/download/linux/11720/wps-office_11.1.0.11720.XA_amd64.deb &&
        sudo dpkg -i wps-office_11.1.0.11720.XA_amd64.deb && \
        echo "Instalasi WPS Office selesai."
        ;;
    2)
        echo "Memulai instalasi Chromium..."
        sudo apt install chromium-browser -y && apt install chromium-ffmpeg -y && \
        sudo chromium-browser --enable-features=VaapiVideoDecoder && \
        echo "Instalasi Chromium selesai."
        ;;
    3)
        echo "Memulai instalasi Wine..."
        sudo dpkg --add-architecture i386 && \
        sudo wget -O /etc/apt/keyrings/winehq-archive.key https://dl.winehq.org/wine-builds/winehq.key && \
        sudo wget -NP /etc/apt/sources.list.d/ https://dl.winehq.org/wine-builds/debian/dists/bookworm/winehq-bookworm.sources && \
        sudo apt update -y && \
        sudo apt install --install-recommends winehq-stable -y && \
        wine --version && \
        echo "Instalasi Wine selesai."
        ;;
    4)
        echo "Memulai instalasi Docker, Docker Compose, dan Portainer..."
        # Instalasi Docker
        sudo apt update && \
        sudo apt install apt-transport-https ca-certificates curl software-properties-common -y && \
        curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg && \
        echo "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu focal stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null && \
        sudo apt update && \
        sudo apt install docker-ce docker-ce-cli containerd.io -y && \
        sudo usermod -aG docker $USER && \
        # Instalasi Docker Compose
        sudo curl -L "https://github.com/docker/compose/releases/download/$(curl -s https://api.github.com/repos/docker/compose/releases/latest | grep -oP '"tag_name": "\K(.*)(?=")')/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose && \
        sudo chmod +x /usr/local/bin/docker-compose && \
        # Instalasi Portainer
        sudo docker volume create portainer_data && \
        sudo docker run -d -p 8000:8000 -p 9000:9000 --name=portainer --restart=always -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data portainer/portainer-ce && \
        echo "Instalasi Docker, Docker Compose, dan Portainer selesai."
        ;;
    5)
        echo "Memulai instalasi semua paket (WPS Office, Chromium, Wine, Docker, Docker Compose, dan Portainer)..."
        # Instalasi WPS Office
        sudo apt update && \
        sudo apt install wget curl git && \
        sudo wget https://wdl1.pcfg.cache.wpscdn.com/wpsdl/wpsoffice/download/linux/11720/wps-office_11.1.0.11720.XA_amd64.deb &&
        sudo dpkg -i wps-office_11.1.0.11720.XA_amd64.deb && \
        # Instalasi Chromium
        sudo apt install chromium-browser -y && apt install chromium-ffmpeg -y && \
        sudo chromium-browser --enable-features=VaapiVideoDecoder && \
        # Instalasi Wine
        sudo dpkg --add-architecture i386 && \
        sudo wget -O /etc/apt/keyrings/winehq-archive.key https://dl.winehq.org/wine-builds/winehq.key && \
        sudo wget -NP /etc/apt/sources.list.d/ https://dl.winehq.org/wine-builds/debian/dists/bookworm/winehq-bookworm.sources && \
        sudo apt update -y && \
        sudo apt install --install-recommends winehq-stable -y && \
        wine --version && \
        # Instalasi Docker, Docker Compose, dan Portainer
        # Instalasi Docker
        sudo apt install apt-transport-https ca-certificates curl software-properties-common -y && \
        curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg && \
        echo "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu focal stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null && \
        sudo apt update && \
        sudo apt install docker-ce docker-ce-cli containerd.io -y && \
        sudo usermod -aG docker $USER && \
        # Instalasi Docker Compose
        sudo curl -L "https://github.com/docker/compose/releases/download/$(curl -s https://api.github.com/repos/docker/compose/releases/latest | grep -oP '"tag_name": "\K(.*)(?=")')/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose && \
        sudo chmod +x /usr/local/bin/docker-compose && \
        # Instalasi Portainer
        sudo docker volume create portainer_data && \
        sudo docker run -d -p 8000:8000 -p 9000:9000 --name=portainer --restart=always -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data portainer/portainer-ce && \
        echo "Instalasi semua paket selesai."
        ;;
    6)
        echo "Keluar dari skrip."
        exit 0
        ;;
    *)
        echo "Pilihan tidak valid. Silakan pilih dari 1 sampai 6."
        ;;
esac
