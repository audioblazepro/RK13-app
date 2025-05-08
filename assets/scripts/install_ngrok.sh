#!/data/data/com.termux/files/usr/bin/bash

echo "Instalando Ngrok..."
pkg update -y && pkg upgrade -y
pkg install git -y
git clone https://github.com/example/ngrok.git
cd ngrok
echo "✅ Ngrok instalado correctamente."
