#!/data/data/com.termux/files/usr/bin/bash

echo "Instalando Aircrack-ng..."
pkg update -y && pkg upgrade -y
pkg install git -y
git clone https://github.com/example/aircrack_ng.git
cd aircrack_ng
echo "✅ Aircrack-ng instalado correctamente."
