#!/data/data/com.termux/files/usr/bin/bash

echo "Instalando JohnTheRipper..."
pkg update -y && pkg upgrade -y
pkg install git -y
git clone https://github.com/example/johntheripper.git
cd johntheripper
echo "✅ JohnTheRipper instalado correctamente."
