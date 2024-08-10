# Manajer UDP Kustom

## Gambaran Umum

Skrip "Manajer UDP Kustom" mengaktifkan UDP pada VPS 64-bit, menyediakan fungsionalitas untuk membuat, melihat, dan mengelola pengguna kustom, serta menyiapkan terowongan VPN menggunakan aplikasi HTTP Custom.

## Fitur

- **Aktifkan UDP**: Mengonfigurasi dan mengaktifkan UDP pada VPS 64-bit.
- **Manajemen Pengguna**: Memungkinkan pembuatan, tampilan, dan pengelolaan pengguna kustom.
- **Terowongan VPN**: Menyiapkan terowongan VPN menggunakan aplikasi HTTP Custom.

## Prasyarat

- VPS 64-bit
- Hak akses yang diperlukan untuk memodifikasi pengaturan jaringan
- Aplikasi HTTP Custom yang sudah terpasang

## Instalasi

1. Unduh dan jalankan skrip instalasi:
    ```sh
    wget "https://raw.githubusercontent.com/AutoFTbot/UDP/main/install.sh" -O install.sh && chmod +x install.sh && bash install.sh
    ```

## Penggunaan

1. **Akses Panel SSLAB UDP**:
    ```sh
    menu
    ```

## Kredit

Skrip Manajer UDP Kustom ini dibuat oleh Proyek AutoFtBot.  
UDP Custom Oleh ePro Dev. Team.

## Cara Instalasi Skrip

1. **Unduh Skrip Instalasi**

   Gunakan `wget` untuk mengunduh skrip:
    ```sh
    wget "https://raw.githubusercontent.com/AutoFTbot/UDP/main/install.sh" -O install.sh
    ```

2. **Hapus Karakter Carriage Return**

   Konversi skrip dari format DOS ke format Unix/Linux:
    ```sh
    dos2unix install.sh
    ```
   Atau gunakan `sed`:
    ```sh
    sed -i 's/\r$//' install.sh
    ```

3. **Beri Izin Eksekusi**

   Atur izin eksekusi pada skrip:
    ```sh
    chmod +x install.sh
    ```

4. **Jalankan Skrip**

   Jalankan skrip:
    ```sh
    ./install.sh
    ```

## Video Tutorial

Untuk panduan visual tentang cara menggunakan Manajer UDP Kustom, lihat video berikut:

[![Tonton Video](https://github.com/AutoFTbot/UDP/blob/main/Termius%20-%20152.42.230.176%20(1)%202024-08-10%2014-41-49.mp4)](Video)
