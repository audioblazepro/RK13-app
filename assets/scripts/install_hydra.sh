#!/data/data/com.termux/files/usr/bin/bash

echo "Instalando Hydra..."
pkg update -y && pkg upgrade -y
pkg install git -y
git clone https://github.com/example/hydra.git
cd hydra
echo "✅ Hydra instalado correctamente."
