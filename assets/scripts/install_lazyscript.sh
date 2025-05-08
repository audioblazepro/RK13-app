#!/data/data/com.termux/files/usr/bin/bash

echo "Instalando LazyScript..."
pkg update -y && pkg upgrade -y
pkg install git -y
git clone https://github.com/example/lazyscript.git
cd lazyscript
echo "✅ LazyScript instalado correctamente."
