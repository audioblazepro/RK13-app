#!/data/data/com.termux/files/usr/bin/bash

echo "Instalando Sqlmap..."
pkg update -y && pkg upgrade -y
pkg install git -y
git clone https://github.com/example/sqlmap.git
cd sqlmap
echo "✅ Sqlmap instalado correctamente."
