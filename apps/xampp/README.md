  # Direktori
    mkdir -p ~/docker/xampp ~/data/xampp
    cd docker/xampp
    
  # Jalankan Stack 
    docker-compose -p 'xampp' up -d

  # Browsing
    http://IP_ADDRESS:1111             # Web
    http://IP_ADDRESS:1111/phpmyadmin  # PHPMyAdmin
