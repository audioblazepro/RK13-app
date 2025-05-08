#!/data/data/com.termux/files/usr/bin/bash

echo "Instalando Hakku..."
pkg update -y && pkg upgrade -y
pkg install git -y
git clone https://github.com/example/hakku.git
cd hakku
echo "✅ Hakku instalado correctamente."
