# Direktori Data
```
mkdir -p ~/hardisk/data
chmod 777 ~/hardisk/data
```

# Direktori Docker
```
mkdir -p ~/docker/sambawebdav
chmod 777 ~/docker/sambawebdav
```
  
# Jalankan Stack 
```
docker-compose -p 'sambawebdav' up -d --build
```

# Akses Webdav
```
http://IP_ADDRESS:4444  # webdav
 - samba
 - secret
```
    
# Akses Samba Windows / Android Apk [CX File Explorer]
```
IP_ADDRESS:4445  # alamat IP samba server
 - samba
 - secret
```
