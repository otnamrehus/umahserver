Web Aplikasi ini dijalankan dalam Mode Virtualisasi melali Sistem Docker, dengan spesifikasi Layanan Web Server :
- Alpine OS,
- PHP 5.5,
- CMS Web File Manager [(Tinyfilemanager)](https://tinyfilemanager.github.io)

# 1. DIREKTORI #
a] Struktur Direktori

     web_dir
      +  app
         - index.php
      +  data
         - umum
         - user
         
b] Persiapan Direktori

    mkdir -p /root/web_dir/data /root/web_dir/app && \
    chown www-data:www-data /root/web_dir/data  && \
    cd /root/web_dir/app
    

# 2. Running Container  # 
a) Download Skrip "web_dir"

    curl -o index.php https://raw.githubusercontent.com/otnamrehus/umahserver/main/apps/web-dir/app/index.php
    
   atau 

    wget https://raw.githubusercontent.com/otnamrehus/umahserver/main/apps/web-dir/app/index.php

b) Jalankan Container

    docker run -d  \
       -p 3333:80  \
       -p 3322:22  \
       -v /root/web_dir/data:/var/www/html/data  \
       -v /root/web_dir/app/index.php:/var/www/html/index.php  \
       --name web_dir  \
       --hostname web_dir  \
       --restart always \
     tinyfilemanager/tinyfilemanager:master

# 3. Jalankan  #
   a] Akses Browser
    
    https://IP_Adresss:3333
   
  
   b] Akun Pengguna
   
    admin [admin@123]
    user  [12345]
    *user_new [12345]

Contoh:

    // Login user name and password
    // Users: array('Username' => 'Password', 'Username2' => 'Password2', ...)
    // Generate secure password hash - https://tinyfilemanager.github.io/docs/pwd.html
    $auth_users = array(
        'admin' => '$2y$10$/K.hjNr84lLNDt8fTXjoI.DBp6PpeyoJ.mGwrrLuCZfAwfSAGqhOW', //admin@123
        'user' => '$2y$10$Fg6Dz8oH9fPoZ2jJan5tZuv6Z4Kp7avtQ9bDfrdRntXtPeiMAZyGO', //1234

   c] Akun Password
   
   Password Generator: https://tinyfilemanager.github.io/docs/pwd.html



   d] Akses Direktori Akun
   
    // user specific directories
    // array('Username' => 'Directory path', 'Username2' => 'Directory path', ...)
    $directories_users = array(
        'user' => 'data/user',
        'guru' => 'data/guru',
        'tu' => 'data/tu'
    );

   e] Akses file 

      // Allowed file extensions for create and rename files
      // e.g. 'txt,html,css,js'
      $allowed_file_extensions = 'gif,png,jpg,html,txt,pdf,docx,doc,xlsx,xls,ppt,pptx';
 
      // Allowed file extensions for upload files
      // e.g. 'gif,png,jpg,html,txt'
      $allowed_upload_extensions = 'gif,png,jpg,html,txt,pdf,docx,doc,xlsx,xls,ppt,pptx';

   f] Hidden index.php

      // Files and folders to excluded from listing
      // e.g. array('myfile.html', 'personal-folder', '*.php', ...)
      $exclude_items = array('index.php'); //insert index.php




# 4. Akses ke Console Host Container  #
    docker exec -it web_dir bash
