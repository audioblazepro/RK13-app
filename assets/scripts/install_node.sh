#!/data/data/com.termux/files/usr/bin/bash
echo "📦 Instalando NodeJS Toolkit..."
pkg update -y
pkg install nodejs -y
node -v
