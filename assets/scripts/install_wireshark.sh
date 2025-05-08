#!/data/data/com.termux/files/usr/bin/bash

echo "Instalando Wireshark..."
pkg update -y && pkg upgrade -y
pkg install git -y
git clone https://github.com/example/wireshark.git
cd wireshark
echo "✅ Wireshark instalado correctamente."
