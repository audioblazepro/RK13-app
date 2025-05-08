#!/data/data/com.termux/files/usr/bin/bash

echo "Instalando ReconDog..."
pkg update -y && pkg upgrade -y
pkg install git -y
git clone https://github.com/example/recondog.git
cd recondog
echo "✅ ReconDog instalado correctamente."
