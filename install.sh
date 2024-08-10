#!/bin/bash

# Update dan upgrade
apt update -y
apt upgrade -y

# Instalasi paket
apt install lolcat -y
apt install figlet -y
apt install neofetch -y
apt install screenfetch -y

# Setup direktori
cd
rm -rf /root/udp
mkdir -p /root/udp

# Banner
clear
echo -e "                _        ______ _   ____        _   " | lolcat
echo -e "     /\\        | |      |  ____| | |  _ \\      | |  " | lolcat
echo -e "    /  \\  _   _| |_ ___ | |__  | |_| |_) | ___ | |_ " | lolcat
echo -e "   / /\\ \\| | | | __/ _ \\|  __| | __|  _ < / _ \\| __|" | lolcat
echo -e "  / ____ \\ |_| | || (_) | |    | |_| |_) | (_) | |_ " | lolcat
echo -e " /_/    \\_\\__,_|\\__\\___/|_|     \\__|____/ \\___/ \\__|" | lolcat
echo -e "                                                    " | lolcat
echo ""
echo ""
sleep 5

# Ubah zona waktu
echo "Changing time zone to GMT+7:00 Jakarta"
ln -fs /usr/share/zoneinfo/Asia/Jakarta /etc/localtime

# Instalasi udp-custom
echo "Downloading udp-custom"
wget "https://github.com/AutoFTbot/UDP/raw/main/udp-custom-linux-amd64" -O /root/udp/udp-custom
chmod +x /root/udp/udp-custom

echo "Downloading default config"
wget "https://raw.githubusercontent.com/AutoFTbot/UDP/main/config.json" -O /root/udp/config.json
chmod 644 /root/udp/config.json

# Buat file service
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
echo '    Install Custom UDP Manager   ' | lolcat

echo ''
echo ''
echo ''
sleep 5

# Instalasi sistem tambahan
cd $HOME
mkdir -p /etc/AutoFtBot
cd /etc/AutoFtBot
wget https://github.com/AutoFTbot/UDP/raw/main/system.zip
unzip system.zip
cd /etc/AutoFtBot/system
mv menu /usr/local/bin
chmod +x ChangeUser.sh
chmod +x Adduser.sh
chmod +x DelUser.sh
chmod +x Userlist.sh
chmod +x RemoveScript.sh
chmod +x torrent.sh
cd /usr/local/bin
chmod +x menu
cd /etc/AutoFtBot
rm system.zip

clear
echo 'UDP Install Script By Project AutoFTbot Dev.Team'
echo 'UDP Custom By ePro Dev. Team'
echo ''
echo ''
echo ' Support US'
echo "Github/AutoFTbot"
echo "Telegram/AutoFTbot"
sleep 5

# Mulai dan aktifkan layanan
echo "Starting udp-custom service"
systemctl start udp-custom &>/dev/null

echo "Enabling udp-custom service"
systemctl enable udp-custom &>/dev/null

# Reboot sistem
echo "Rebooting system"
reboot
