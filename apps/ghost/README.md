  # Direktori
    mkdir -p ~/ghost/content ~/ghost/data
    cd ghost
    
  # Jalankan Stack 
    docker-compose -p 'ghost' up -d

  # Browsing
    http://IP_ADDRESS:5555  # Ghost
    http://IP_ADDRESS:5580  # PHPMyAdmin
    
  # Reset Pasword / Login
    https://bcrypt-generator.com
    
    Note:
    - Akses dari PHPMyAdmin atau 
    - MySQL Command
      mysql -u username -p
    - Inputkan langsung pada Tabel "User", Field "Password"
      UPDATE database_name.users SET password=’<hashed_password>’ WHERE email = ’<email_address>’;
