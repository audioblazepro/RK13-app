#!/data/data/com.termux/files/usr/bin/bash

echo "Instalando Tcpdump..."
pkg update -y && pkg upgrade -y
pkg install git -y
git clone https://github.com/example/tcpdump.git
cd tcpdump
echo "✅ Tcpdump instalado correctamente."
