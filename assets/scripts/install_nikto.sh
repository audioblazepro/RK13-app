#!/data/data/com.termux/files/usr/bin/bash

echo "Instalando Nikto..."
pkg update -y && pkg upgrade -y
pkg install git -y
git clone https://github.com/example/nikto.git
cd nikto
echo "✅ Nikto instalado correctamente."
