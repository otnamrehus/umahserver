Web Aplikasi ini dijalankan dalam Mode Virtualisasi melali Sistem Docker, dengan spesifikasi Layanan Web Server :
- Alpine OS,
- PHP 5.5,
- CMS Web File Manager (Tinyfilemanager)  
# 1. DIREKTORI #
Struktur Direktori

     web_dir
      +  app
         - index.php
      +  data
         - umum
         - user
         
Persiapan Direktori

    mkdir -p /root/web_dir/data /root/web_dir/app && \
    chown www-data:www-data /root/web_dir/data  && \
    cd /root/web_dir/app

# 2. Running Container  # 
Download Skrip "web_dir"

    curl -o index.php https://raw.githubusercontent.com/otnamrehus/umahserver/main/apps/web-dir/app/index.php
    
   atau 

    wget https://raw.githubusercontent.com/otnamrehus/umahserver/main/apps/web-dir/app/index.php

Jalankan Container

    docker run -d  \
       -p 3333:80  \
       -p 3322:22  \
       -v /root/web_dir/data:/var/www/html/data  \
       -v /root/web_dir/app/index.php:/var/www/html/index.php  \
       --name dirfile  \
       --hostname dirfile  \
       --restart always \
     tinyfilemanager/tinyfilemanager:master

# 3. Jalankan  #
   Akses Browser
    
    https://IP_Adresss:2222
   
  
   Akun Pengguna
   
    admin [admin@123]
    user  [12345]
    

# 4. Akses ke Console Host Container  #
    docker exec -it direktori bash
