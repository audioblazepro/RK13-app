#!/data/data/com.termux/files/usr/bin/bash

echo "Instalando Nmap..."
pkg update -y && pkg upgrade -y
pkg install git -y
git clone https://github.com/example/nmap.git
cd nmap
echo "✅ Nmap instalado correctamente."
