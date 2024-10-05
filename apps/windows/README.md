1. Buat Direktori Baru
    ```
   mkdir windows
   cd windows
   ```
    
2. Jalankan
   ```
   docker compose -p 'windows' up -d  --build
   ````
3. Start | Stop Container
   ```
   docker stop | stop windows
   ```
4. Windows tidak dijalankan otomatis
  ```
   docker update --restart=no windows
  ```
5. Gunakan Remode Desktop Manager (Windows) / Remmina(Linux)
