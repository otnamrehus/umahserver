# UPDATE REPOSITORY

    rm -rf /etc/apt/source.list.d/*.*  && \
    cp /etc/apt/source.list /etc/apt/source.list.backup 
    echo -e "deb http://deb.debian.org/debian buster main contrib non-free \
    deb http://deb.debian.org/debian buster-updates main contrib non-free \
    deb http://deb.debian.org/debian bullseye-backports main contrib non-free\
    " > /etc/apt/source.list &&\
    apt update --allow-unauthenticated 

# INSTALL
    wget https://raw.githubusercontent.com/otnamrehus/umahserver/main/apps/stb-server/install.sh && \
    chmod +x install.sh
    ./install.sh
    
    
    
    
