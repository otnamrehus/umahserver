# 1. DIREKTORI #
Struktur Direktori

     web_dir
      +  app
         - index.php
      +  data
         - umum
         - user
         
Persiapan Direktori

    mkdir -p /root/direktori/data /root/direktori/app && \
    chown www-data:www-data /root/direktori/data  && \
    touch /root/direktori/app/index.php && touch /root/direktori/app/index.php

# 2. Running Container  # 
Download Materi

    git clone .... 

Jalankan Container
    
    docker run -d  \
       -p 2222:80  \
       -p 6222:22  \
       -v /root/direktori/data:/var/www/html/data  \
       -v /root/direktori/app/index.php:/var/www/html/index.php  \
       --name dirfile  \
       --hostname dirfile  \
       --restart always \
     tinyfilemanager/tinyfilemanager:master

# Console Container  #
    docker exec -it direktori bash
