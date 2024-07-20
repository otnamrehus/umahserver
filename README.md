### umahserver
---------------------------------------------------------------------
### Hanya Buat Server Rumahan

### 1. Unduh:
    apt-get install git && \
    git clone https://github.com/otnamrehus/umahserver.git && \
    cd umahserver

### 2. Instalasi Dasar Server:
    - SSH, 
    - Docker, 
    - Portainer (GUI Docker), 
    - Zerotier (Tunneling/VPN).
    
    chmod +x install_ssh-docker-portainer-zerotier.sh && \
    ./install_ssh-docker-portainer-zerotier.sh

### 3. Instalasi Service App :
    [Web Direktori [TinyFileManager]] (https://github.com/otnamrehus/umahserver/tree/main/apps/web-dir)
