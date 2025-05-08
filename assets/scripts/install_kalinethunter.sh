#!/data/data/com.termux/files/usr/bin/bash

echo "Instalando KaliNethunter..."
pkg update -y && pkg upgrade -y
pkg install git -y
git clone https://github.com/example/kalinethunter.git
cd kalinethunter
echo "✅ KaliNethunter instalado correctamente."
