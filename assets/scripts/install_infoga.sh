#!/data/data/com.termux/files/usr/bin/bash

echo "Instalando Infoga..."
pkg update -y && pkg upgrade -y
pkg install git -y
git clone https://github.com/example/infoga.git
cd infoga
echo "✅ Infoga instalado correctamente."
