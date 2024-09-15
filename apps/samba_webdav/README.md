STB MINI SERVER [B806H V1] (Passed Test)

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
smb://IP_ADDRESS:4445  # dari windows explorer / file explorer
# atau dengan perintah ini
smb://samba@192.168.192.212:4444
 - samba
 - secret
```
