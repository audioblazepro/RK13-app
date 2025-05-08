#!/data/data/com.termux/files/usr/bin/bash

echo "Instalando Trity..."
pkg update -y && pkg upgrade -y
pkg install git -y
git clone https://github.com/example/trity.git
cd trity
echo "✅ Trity instalado correctamente."
