# Test-BackEnd---Go
Test Backend - Golang - PT Sharing Vision Indonesia

Ini adalah project backend API yang dibangun menggunakan Golang dengan arsitektur modular.

# Tech Stack
| Library | Fungsi Utama | 
| GORM | ORM untuk database (MySQL) | 
| Viper | Manajemen konfigurasi (env, file, flag, dll) | 
| Mux | Routing HTTP yang ringan dan fleksibel | 
| Logrus | Logging terstruktur dan level-based | 
| Air | Live reload saat development (opsional) | 

# Setup Database
Setelah project berhasil di clone, import database yang ada dalam folder **Database** terlebih dahulu. Lalu sesuaikan nama database dengan konfigurasi **.ENV**

# Setup Environment
PORT=8080
DB_HOST=127.0.0.1
DB_USER=root
DB_PASS=
DB_NAME=article
DB_PORT=3306

# Cara Menjalankan
Opsi 1 : Jika menggunakan Air (Live Reload)
  - Pastikan Xampp / Database sudah running
  - Masuk ke terminal dengan path project dan jalankan perintah : air

Opsi 2 : Jika tidak menggunakan Air (Manual)
  - Pastikan Xampp / Database sudah running
  - Masuk ke terminal dengan path project dan jalankan perintah : go run main.go

# Struktur Folder
├── configs/        # Konfigurasi Viper & Koneksi Database
├── controllers/    # Handler untuk endpoint
├── helpers/        # Sementara hanya untuk kebutuhan reusable response API
├── models/         # Struct dan GORM model
├── routes/         # Setup routing dengan Mux
├── .env            # Untuk konfigurasi aplikasi
├── main.go         # Entry point aplikasi




