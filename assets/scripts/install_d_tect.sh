#!/data/data/com.termux/files/usr/bin/bash

echo "Instalando D-TECT..."
pkg update -y && pkg upgrade -y
pkg install git -y
git clone https://github.com/example/d_tect.git
cd d_tect
echo "✅ D-TECT instalado correctamente."
