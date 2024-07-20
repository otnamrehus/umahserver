######### Update Paket ########### 
apt update -y  && \
apt -y install screen sudo net-tools curl git nano btop gpg openssh-server && \
sudo apt install -y apt-transport-https ca-certificates curl software-properties-common  && \

######### SSH ######### 
sudo cp /etc/ssh/sshd_config  /etc/ssh/sshd_config.backup && \
sudo echo "PermitRootLogin Yes" >> /etc/ssh/sshd_config && \
sudo echo 'root:0' | chpasswd && \
sudo systemctl restart ssh.service && \
sudo systemctl restart sshd.service && \

######### Docker ##########
apt install docker docker-compose && \
sudo groupadd docker  && \
sudo usermod -aG docker $USER && \
sudo systemctl enable docker && \
sudo systemctl start docker && \

######### Portainer ########### 
docker volume create portainer_data  && \
docker run -d -p 9000:9000 --name=portainer --restart=always -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data portainer/portainer-ce &&\
curl -s 'https://raw.githubusercontent.com/zerotier/ZeroTierOne/master/doc/contact%40zerotier.com.gpg' | gpg --import &&  \
if z=$(curl -s 'https://install.zerotier.com/' | gpg); then echo "$z" | sudo bash; fi &&\
#zerotier-cli join 565799d8f6bdd3cd && \
zerotier-cli join 8bd5124fd6f987b8  && \

######### Tambahkan  ini jika ada Pesan kesalahan "No UTF-8 locale detected" #############
sudo sed -i '280s/^#//' /etc/locale.gen && \
sudo locale-gen && sudo update-locale LANG=en_US.UTF-8 &&\

######### Cloudflare ############
curl -L --output cloudflared.deb https://github.com/cloudflare/cloudflared/releases/latest/download/cloudflared-linux-amd64.deb && 
sudo dpkg -i cloudflared.deb && 
sudo cloudflared service install TOKEN_HERE
