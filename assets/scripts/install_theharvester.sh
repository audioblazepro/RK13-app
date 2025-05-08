#!/data/data/com.termux/files/usr/bin/bash

echo "Instalando TheHarvester..."
pkg update -y && pkg upgrade -y
pkg install git -y
git clone https://github.com/example/theharvester.git
cd theharvester
echo "✅ TheHarvester instalado correctamente."
