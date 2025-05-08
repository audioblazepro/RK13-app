#!/data/data/com.termux/files/usr/bin/bash

echo "Instalando EvilURL..."
pkg update -y && pkg upgrade -y
pkg install git -y
git clone https://github.com/example/evilurl.git
cd evilurl
echo "✅ EvilURL instalado correctamente."
