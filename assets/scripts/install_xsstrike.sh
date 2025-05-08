#!/data/data/com.termux/files/usr/bin/bash

echo "Instalando XSStrike..."
pkg update -y && pkg upgrade -y
pkg install git -y
git clone https://github.com/example/xsstrike.git
cd xsstrike
echo "✅ XSStrike instalado correctamente."
