#!/data/data/com.termux/files/usr/bin/bash

echo "Instalando SocialFish..."
pkg update -y && pkg upgrade -y
pkg install git -y
git clone https://github.com/example/socialfish.git
cd socialfish
echo "✅ SocialFish instalado correctamente."
