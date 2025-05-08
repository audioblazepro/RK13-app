#!/data/data/com.termux/files/usr/bin/bash

echo "Instalando Seeker..."
pkg update -y && pkg upgrade -y
pkg install git -y
git clone https://github.com/example/seeker.git
cd seeker
echo "✅ Seeker instalado correctamente."
