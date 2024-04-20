### STB PREPARE 2024 ###
#########################
### UPDATE REPOSITORY ###
apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 0E98404D386FA1D9 && \
apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 6ED0E7B82643E131 && \
apt update --allow-releaseinfo-change && \
apt update --allow-unauthenticated 
apt upgrade -y && \


### MOUNTING HARDISK ###
apt update --allow-unauthenticated && \
apt install ntfs-3g fuse && \
mkdir -p /root/hardisk && \
mount -t auto /dev/sda1 /root/hardisk && \
echo -e 'UUID="549E249C9E24789E" /root/hardisk ntfs-3g defaults,nofail 0 0' >> /etc/fstab && \
mount -a && \


### 3. DOCKER ###
apt update --allow-unauthenticated && \
sudo apt install apt-transport-https ca-certificates curl gnupg2 software-properties-common python3 python3-pip && \
curl -fsSL https://download.docker.com/linux/debian/gpg | sudo apt-key add - && \
sudo add-apt-repository "deb [arch=armhf] https://download.docker.com/linux/debian $(lsb_release -cs) stable"  && \
apt update --allow-unauthenticated && \
apt-cache policy docker-ce  && \
sudo apt install docker-ce || apt install docker.io && \
apt install docker-compose &&  \
cp /usr/bin/docker-compose /usr/local/bin/ &&  \
sudo usermod -aG docker $USER  && \
docker volume create portainer_data  && \
docker run -d -p 9000:9000 --name=portainer --restart=always -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data portainer/portainer-ce
sudo systemctl status docker &&\
docker-compose --version && \


### 4. ZEROTIER [VPN-IPTunnel]###
sudo curl -s 'https://raw.githubusercontent.com/zerotier/ZeroTierOne/master/doc/contact%40zerotier.com.gpg' | gpg --import &&  \
if z=$(curl -s 'https://install.zerotier.com/' | gpg); then echo "$z" | sudo bash; fi && \
zerotier-cli join 565799d8f6bdd3cdx

### 5. CLOUDFLARE [Domain] ###

curl -L --output cloudflared.deb https://github.com/cloudflare/cloudflared/releases/latest/download/cloudflared-linux-arm64.deb &&  \
sudo dpkg -i cloudflared.deb &&  \
sudo cloudflared service install eyJhIjoiY2E0MmJhZjA3NzJmMDI0ZDgxNTNkMTdhMDk1OGIwMWYiLCJ0IjoiMDRkZjQ0NzItZGRhOS00MWFlLWJjNTEtMjkyZGEyYmJiYzhiIiwicyI6IllXSTROV0UwTURBdE1XTTNNUzAwTWpjeExXRmhOV1V0WlRoak9EUmhOemRrWXpkaCJ9x

