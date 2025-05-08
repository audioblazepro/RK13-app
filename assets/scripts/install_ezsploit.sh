#!/data/data/com.termux/files/usr/bin/bash

echo "Instalando Ezsploit..."
pkg update -y && pkg upgrade -y
pkg install git -y
git clone https://github.com/example/ezsploit.git
cd ezsploit
echo "✅ Ezsploit instalado correctamente."
