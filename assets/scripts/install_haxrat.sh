#!/data/data/com.termux/files/usr/bin/bash

echo "Instalando HaxRat..."
pkg update -y && pkg upgrade -y
pkg install git -y
git clone https://github.com/example/haxrat.git
cd haxrat
echo "✅ HaxRat instalado correctamente."
