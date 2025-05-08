#!/data/data/com.termux/files/usr/bin/bash

echo "Instalando Photon..."
pkg update -y && pkg upgrade -y
pkg install git -y
git clone https://github.com/example/photon.git
cd photon
echo "✅ Photon instalado correctamente."
