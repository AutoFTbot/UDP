#!/bin/bash

# Update dan upgrade
echo "Memperbarui daftar paket..." | tee -a /root/install.log
apt update -y >> /root/install.log 2>&1
echo "Mengupgrade paket..." | tee -a /root/install.log
apt upgrade -y >> /root/install.log 2>&1

# Instalasi paket
echo "Menginstal paket tambahan..." | tee -a /root/install.log
apt install lolcat figlet neofetch screenfetch -y >> /root/install.log 2>&1

# Setup direktori
echo "Menyetel direktori..." | tee -a /root/install.log
cd
rm -rf /root/udp
mkdir -p /root/udp

# Banner
clear
echo -e "                _        ______ _   ____        _   " | lolcat | tee -a /root/install.log
echo -e "     /\\        | |      |  ____| | |  _ \\      | |  " | lolcat | tee -a /root/install.log
echo -e "    /  \\  _   _| |_ ___ | |__  | |_| |_) | ___ | |_ " | lolcat | tee -a /root/install.log
echo -e "   / /\\ \\| | | | __/ _ \\|  __| | __|  _ < / _ \\| __|" | lolcat | tee -a /root/install.log
echo -e "  / ____ \\ |_| | || (_) | |    | |_| |_) | (_) | |_ " | lolcat | tee -a /root/install.log
echo -e " /_/    \\_\\__,_|\\__\\___/|_|     \\__|____/ \\___/ \\__|" | lolcat | tee -a /root/install.log
echo -e "                                                    " | lolcat | tee -a /root/install.log
echo "" | tee -a /root/install.log
sleep 5

# Ubah zona waktu
echo "Mengubah zona waktu ke GMT+7:00 Jakarta" | tee -a /root/install.log
ln -fs /usr/share/zoneinfo/Asia/Jakarta /etc/localtime

# Instalasi udp-custom
echo "Mengunduh udp-custom..." | tee -a /root/install.log
wget "https://github.com/AutoFTbot/UDP/raw/main/udp-custom-linux-amd64" -O /root/udp/udp-custom >> /root/install.log 2>&1
chmod +x /root/udp/udp-custom >> /root/install.log 2>&1

echo "Mengunduh konfigurasi default..." | tee -a /root/install.log
wget "https://raw.githubusercontent.com/AutoFTbot/UDP/main/config.json" -O /root/udp/config.json >> /root/install.log 2>&1
chmod 644 /root/udp/config.json >> /root/install.log 2>&1

# Buat file service
echo "Membuat file service systemd..." | tee -a /root/install.log
if [ -z "$1" ]; then
cat <<EOF > /etc/systemd/system/udp-custom.service
[Unit]
Description=UDP Custom by ePro Dev. Team and modified by AutoFtBot

[Service]
User=root
Type=simple
ExecStart=/root/udp/udp-custom server
WorkingDirectory=/root/udp/
Restart=always
RestartSec=2s

[Install]
WantedBy=default.target
EOF
else
cat <<EOF > /etc/systemd/system/udp-custom.service
[Unit]
Description=UDP Custom by ePro Dev. Team and modified by AutoFtBot

[Service]
User=root
Type=simple
ExecStart=/root/udp/udp-custom server -exclude $1
WorkingDirectory=/root/udp/
Restart=always
RestartSec=2s

[Install]
WantedBy=default.target
EOF
fi

clear
echo '    Install Custom UDP Manager   ' | lolcat | tee -a /root/install.log

echo '' | tee -a /root/install.log
echo '' | tee -a /root/install.log
echo '' | tee -a /root/install.log
sleep 5

# Instalasi sistem tambahan
echo "Mengunduh dan menyiapkan sistem tambahan..." | tee -a /root/install.log
cd $HOME
mkdir -p /etc/AutoFtBot
cd /etc/AutoFtBot
wget https://github.com/AutoFTbot/UDP/raw/main/system.zip >> /root/install.log 2>&1
unzip system.zip >> /root/install.log 2>&1
cd /etc/AutoFtBot/system
mv menu /usr/local/bin >> /root/install.log 2>&1
chmod +x ChangeUser.sh Adduser.sh DelUser.sh Userlist.sh RemoveScript.sh torrent.sh >> /root/install.log 2>&1
cd /usr/local/bin
chmod +x menu >> /root/install.log 2>&1
cd /etc/AutoFtBot
rm system.zip >> /root/install.log 2>&1

clear
echo 'UDP Install Script By Project AutoFTbot Dev.Team' | tee -a /root/install.log
echo 'UDP Custom By ePro Dev. Team' | tee -a /root/install.log
echo '' | tee -a /root/install.log
echo '' | tee -a /root/install.log
echo ' Support US' | tee -a /root/install.log
echo "Github/AutoFTbot" | tee -a /root/install.log
echo "Telegram/AutoFTbot" | tee -a /root/install.log
sleep 5

# Mulai dan aktifkan layanan
echo "Memulai layanan udp-custom..." | tee -a /root/install.log
systemctl start udp-custom >> /root/install.log 2>&1
systemctl enable udp-custom >> /root/install.log 2>&1

echo "Instalasi selesai." | tee -a /root/install.log
