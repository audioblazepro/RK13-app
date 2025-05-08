#!/data/data/com.termux/files/usr/bin/bash

echo "Instalando Zphisher..."
pkg update -y && pkg upgrade -y
pkg install git -y
git clone https://github.com/example/zphisher.git
cd zphisher
echo "✅ Zphisher instalado correctamente."
