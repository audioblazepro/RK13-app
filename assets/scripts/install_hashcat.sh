#!/data/data/com.termux/files/usr/bin/bash

echo "Instalando Hashcat..."
pkg update -y && pkg upgrade -y
pkg install git -y
git clone https://github.com/example/hashcat.git
cd hashcat
echo "✅ Hashcat instalado correctamente."
