#!/data/data/com.termux/files/usr/bin/bash

echo "Instalando Termux-API..."
pkg update -y && pkg upgrade -y
pkg install git -y
git clone https://github.com/example/termux_api.git
cd termux_api
echo "✅ Termux-API instalado correctamente."
